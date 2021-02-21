<?php

/**
 * Codigo fuente generado por el SGArqBase: Plataforma de construcción de Sistemas.
 *
 * @package    SGArqBase
 * @subpackage invoice
 * @author     MSc. Donel Vázquez Zambrano
 * @version    1.0.0
 */
class invoiceActions extends sfBaseActions {

    public function load(sfWebRequest $request) {
        $rows = array();
        $filter = $this->getFilter($request);

        switch ($request->getParameter('component')) {
            case 'combo':
            case 'grid':
                $start = $request->getParameter('start');
                $limit = $request->getParameter('limit');

                $rows = InvoiceTable::getInstance()->getAllPaged($start, $limit, $filter);
                break;

            default:
                break;
        }

        return $rows;
    }

    public function save(sfWebRequest $request) {
        $invoice = array();
        $comprobant = array();
        $ak = Util::generateCode($request->getParameter('creationdate') . $request->getParameter('comment') . $request->getParameter('entityid'));

        if ($request->getParameter('id') != ''){
            $invoice = Doctrine::getTable('Invoice')->find($request->getParameter('id'));
            $comprobant = $invoice->getComprobant();
        }

        if ($invoice == array()) {
            $comprobant = Doctrine::getTable('Comprobant')->findByAK($ak);
            if ($comprobant)
                throw new Exception(json_encode(array(
                            msg => 'app.error.duplicatedalternatekey',
                            params => array('invoice.field.label', 'invoice.field.comment', $request->getParameter('comment'))
                        )));
            $comprobant = new Comprobant();
            $invoice = new Invoice();
            $invoice->setComprobant($comprobant);
        }
        
        $comprobant->setCode($ak);
        $comprobant->setComment($request->getParameter('comment'));
        
        $date = date_create_from_format('d/m/Y', $request->getParameter('creationdate'));
        $comprobant->setCreationdate($date->format('Y-m-d H:i:s'));
        
        if ($request->getParameter('name') && $request->getParameter('name') != '')
            $comprobant->setName($request->getParameter('name'));
        else{
            $array = $comprobant->getNameInfo($date->format('Y-m-d H:i:s'));
            $comprobant->setName($array[0] . Comprobant::CODE_SEPARATOR . $array['next']);
        }

        if ($request->getParameter('entityid') && $request->getParameter('entityid') != '')
            $comprobant->setEntityid($request->getParameter('entityid'));
        else
            $comprobant->setEntityid(null);
        
        $comprobant->setIsModificable(false);

        if ($request->getParameter('contractid') && $request->getParameter('contractid') != '')
            $invoice->setContractid($request->getParameter('contractid'));
        
        
        $invoice->setProducts($request->getParameter('products'));

        $comprobant->save();
        $invoice->save();
        sfContext::getInstance()->getLogger()->alert('Salvada factura ' . $invoice->exportTo('json') . ' por el usuario "' . $this->getUser()->getUsername() . '".');

        $q = Doctrine_Query::create()
                ->delete('InvoiceTaxRelation')
                ->addWhere('invoiceid = ?', $invoice->getId());
        $deleted = $q->execute();

        if ($request->getParameter('taxes') && $request->getParameter('taxes') != '') {
            $taxes = json_decode(stripslashes($request->getParameter('taxes')));

            foreach ($taxes as $tax) {
                $relation = new InvoiceTaxRelation();
                $relation->setInvoiceid($invoice->getId());
                $relation->setTaxid($tax->id);
                $relation->setAmount($tax->amount);
                $relation->setFixed($tax->fixed);
                if($tax->currencyid && $tax->currencyid != '')
                    $relation->setCurrencyid($tax->currencyid);
                else
                    $relation->setCurrencyid(null);
                $relation->save();
            }
        }
        
        // deleting all items and its related transactions
        $q = Doctrine_Query::create()
                ->select('t.*')
                ->from('InvoiceItem t')
                ->where('t.invoiceid = ?', $invoice->getId());
        $items = $q->execute();
        for($index = 0; $index < count($items); $index++)
            $items[$index]->getTransaction()->delete();
        $q = Doctrine_Query::create()
                ->delete('InvoiceItem')
                ->addWhere('invoiceid = ?', $invoice->getId());
        $deleted = $q->execute();
        if ($request->getParameter('products') && $request->getParameter('products') != '') {
            $products = json_decode(stripslashes($request->getParameter('products')));

            foreach ($products as $product) {
                $item = new InvoiceItem();
                $item->setTransaction(new Transaction());
                //$item->getTransaction()->setAccountid($product->amount);
                $item->getTransaction()->setComprobantid($comprobant->getId());
                $item->getTransaction()->setComment($product->name);
                $item->getTransaction()->setDebit(0);
                $item->getTransaction()->setCredit($product->price);
                //$item->getTransaction()->setCreditave($product->price);
                $item->getTransaction()->setCurrencyid($product->Currency->id);
                $item->getTransaction()->setRate($product->Currency->rate);
                $item->getTransaction()->setAmount($product->amount);
                $item->getTransaction()->setUmid($product->Um->id);
                $item->setInvoiceid($invoice->getId());
                $item->save();
                
                
                $array = get_object_vars($product);
                $keys = array_keys($array);
                foreach ($keys as $key) {
                    $tax = BaseTable::findByAK('Tax', 'code', $key);
                    if($tax){
                        $item = new InvoiceItem();
                        $item->setTransaction(new Transaction());
                        $item->getTransaction()->setComprobantid($comprobant->getId());
                        $item->getTransaction()->setComment($product->name.' ['.$tax->getName().']');
                        $item->getTransaction()->setDebit(0);
                        $item->getTransaction()->setCredit($array[$key]);
                        $item->getTransaction()->setAmount(1);
                        $item->setInvoiceid($invoice->getId());
                        
                        if(isset($array[$key.'.currencyid'])){
                            $item->getTransaction()->setCurrencyid($array[$key.'.currencyid']);
                            $item->getTransaction()->setRate($array[$key.'.currencyrate']);
                        }
                        else{
                            $item->getTransaction()->setCurrencyid($product->Currency->id);
                            $item->getTransaction()->setRate($product->Currency->rate);
                            $item->getTransaction()->setCredit($array[$key]*100/$product->price);
                        }
                        
                        $item->save();
                    }
                }

            }
        }
        
        return $comprobant->getInvoice()->toArray();
    }

    public function delete(sfWebRequest $request) {
        $pks = json_decode(stripslashes($request->getParameter('ids')));
        return Doctrine::getTable('Invoice')->deleteByPK($pks);
    }

    public function executeReport(sfWebRequest $request) {
        // applying currency to report
        $currency = Util::getMetadataValue('app_currencycode');
        $rate = 1;
        $c = false;
        if($request->getParameter('currencyid') && $request->getParameter('currencyid')!='')
            $c = BaseTable::findByAK('Currency', 'id', $request->getParameter('currencyid'));
        if($request->getParameter('currencycode') && $request->getParameter('currencycode')!='')
            $c = BaseTable::findByAK('Currency', 'code', $request->getParameter('currencycode'));
        if($c){
            $currency = $c->getCode();
            $rate = $c->getRate();
        }
        
        $this->user = Doctrine::getTable('sfGuardUser')->retrieveByUsername($this->getUser()->getUsername());
        
            
        $this->invoice = BaseTable::findByAK('Invoice', 'id', $request->getParameter('id'));
        $this->entity = BaseTable::findByAK('Entity', 'id', $request->getParameter('entityid'));
        $this->profile = json_decode($this->invoice->getContract()->getProvider()->getProfile(), true);
        
        $this->saler = json_decode($this->invoice->getContract()->getProvider()->getLegalImportant(true, false), true)["persons"][0];
        
        $items = $this->invoice->getInvoiceItems();

        $this->items = array();
        $this->total = 0;

        for ($index = 1; $index <= count($items); $index++) {
            $obj = new stdClass();
            $obj->index = $index;
            $obj->name = $items[$index-1]->getTransaction()->getComment();
            $obj->amount = $items[$index-1]->getTransaction()->getAmount();
            $obj->unitprice = $items[$index-1]->getTransaction()->getCredit()/$items[$index-1]->getTransaction()->getCurrency()->getRate()*$rate;
            $obj->currency = $currency;
            $obj->subtotal = $obj->unitprice * $obj->amount;

            $this->total += $obj->subtotal;

            $obj->unitprice = Util::getNumberFormated($obj->unitprice);
            $obj->subtotal = Util::getNumberFormated($obj->subtotal);

            $this->items[] = $obj;
        }
        
        $this->taxes = array();
        $this->grantotal = 0;
        $taxes = $this->invoice->getInvoiceTaxRelation();
        foreach ($taxes as $tax){
            $obj = new stdClass();
            $obj->name = $tax->getTax()->getName();
            $obj->amount = $tax->getAmount();
            if($tax->getFixed()){
                $obj->amount = $tax->getAmount()/$tax->getCurrency()->getRate()*$rate;
                $obj->currency = $currency;
                $obj->value = Util::getNumberFormated($this->total + $obj->amount);
            }
            else{
                $obj->currency = '%';
                $obj->value = Util::getNumberFormated($this->total * $obj->amount / 100);
            }
            
            $this->grantotal = $this->total + ($this->total * $obj->amount / 100);
            
            $this->taxes[] = $obj;
        }
        
        $this->currency = $currency;

        $this->total = Util::getNumberFormated($this->total);
        $this->grantotal = Util::getNumberFormated($this->grantotal);
        $this->letters = Util::getNumberSpell($this->grantotal);
    }
}
