<?php

/**
 * Codigo fuente generado por el SGArqBase: Plataforma de construcción de Sistemas.
 *
 * @package    SGArqBase
 * @subpackage product
 * @author     MSc. Donel Vázquez Zambrano
 * @version    1.0.0
 */
class productActions extends sfBaseActions {

    public function load(sfWebRequest $request) {
        $rows = array();
        $filter = $this->getFilter($request);

        switch ($request->getParameter('component')) {
            case 'combo':
            case 'grid':
                $start = $request->getParameter('start');
                $limit = $request->getParameter('limit');

                $rows = ProductTable::getInstance()->getAllPaged($start, $limit, $filter);
                break;

            default:
                break;
        }

        return $rows;
    }

    public function save(sfWebRequest $request) {
        $product = array();
        $ak = Util::generateCode($request->getParameter('name') . $request->getParameter('entityid'));

        if ($request->getParameter('id') != '')
            $product = Doctrine::getTable('Product')->find($request->getParameter('id'));

        if ($product == array()) {
            $product = Doctrine::getTable('Element')->findByAK($ak);
            if ($product)
                throw new Exception(json_encode(array(
                            msg => 'app.error.duplicatedalternatekey',
                            params => array('product.field.label', 'product.field.name', $request->getParameter('name'))
                        )));
            $product = new Product();
			$product->setElement(new Element());
        }
		
		$product->getElement()->setCode($ak);
        $product->getElement()->setName($request->getParameter('name'));
        $product->getElement()->setComment($request->getParameter('comment'));

        if ($request->getParameter('um_id') && $request->getParameter('um_id') != '')
            $product->getElement()->setUmid($request->getParameter('um_id'));

        if ($request->getParameter('entityid') && $request->getParameter('entityid') != '')
            $product->getElement()->setEntityid($request->getParameter('entityid'));
        else
            $product->getElement()->setEntityid(null);
		
		$product->setAmount($request->getParameter('amount'));
        if ($request->getParameter('currency_id') && $request->getParameter('currency_id') != '')
            $product->setCurrencyid($request->getParameter('currency_id'));

        $product->save();
        sfContext::getInstance()->getLogger()->alert('Salvado producto ' . $product->exportTo('json') . ' por el usuario "' . $this->getUser()->getUsername() . '".');

        $q = Doctrine_Query::create()
                ->delete('ProductTaxRelation')
                ->addWhere('productid = ?', $product->getId());
        $deleted = $q->execute();

        if ($request->getParameter('taxes') && $request->getParameter('taxes') != '') {
            $taxes = json_decode(stripslashes($request->getParameter('taxes')));

            foreach ($taxes as $tax) {
                $relation = new ProductTaxRelation();
                $relation->setProductid($product->getId());
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

        return $product->toArray();
    }

    public function delete(sfWebRequest $request) {
        $pks = json_decode(stripslashes($request->getParameter('ids')));
        return Doctrine::getTable('Product')->deleteByPK($pks);
    }

}
