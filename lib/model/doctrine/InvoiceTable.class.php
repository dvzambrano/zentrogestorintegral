<?php

/**
 * InvoiceTable
 * Codigo fuente generado por el SGArqBase: Plataforma de construcción de Sistemas.
 *
 * @author     MSc. Donel Vázquez Zambrano
 * @version    1.0.0
 */
class InvoiceTable extends Doctrine_Table {

    /**
     * Returns an instance of this class.
     *
     * @return object InvoiceTable
     */
    public static function getInstance() {
        return Doctrine_Core::getTable(self::table);
    }

    public static function formatData($array, $page, $count = false) {
        return array(
            'metaData' => array(
                'idProperty' => 'id',
                'root' => 'data',
                'totalProperty' => 'results',
                'fields' => array(
                    array('name' => 'id', 'type' => 'int'),
                    array('name' => 'code', 'type' => 'string'),
                    array('name' => 'name', 'type' => 'string'),
                    array('name' => 'comment', 'type' => 'string'),
                    array('name' => 'products', 'type' => 'string'),
                    array('name' => 'customicon', 'type' => 'string'),
                    array('name' => 'deleteable', 'type' => 'bool'),
                    array('name' => 'Comprobant'),
                    array('name' => 'Contract'),
                    array('name' => 'Transactions'),
                    array('name' => 'InvoiceTaxRelation'),
                    array('name' => 'InvoiceItems'),
                ),
                'sortInfo' => array(
                    'field' => 'id',
                    'direction' => 'ASC'
                )
            ),
            'success' => true,
            'message' => 'app.msg.info.loadedsuccessful',
            'results' => $count,
            'data' => $array->toArray(),
            'page' => $page
        );
    }

    const table = 'Invoice';
    const akfield = 'code';

    public static function getAllPaged($start, $limit, $filters, $simple = false) {
        $select = 'c.*, ii.*, itr.*, itrc.*, itrt.*, ctr.*, e.*, trsc.*, acc.*, cur.*, um.*, cc.*, elem.*, true as deleteable';
		
        $query = BaseTable::getAllPaged(self::table, $start, $limit, $filters,array('t.Comprobant c', 't.InvoiceItems ii', 't.InvoiceTaxRelation itr', 'itr.Currency itrc', 'itr.Tax itrt', 't.Contract ctr', 'ctr.Event e', 'c.Transactions trsc', 'trsc.Account acc', 'acc.Costcenter cc', 'acc.Element elem', 'trsc.Currency cur', 'trsc.Um um'), array(
                    array(
                        'field' => 'accountid',
                        'realfield' => 'id',
                        'char' => 'acc'
                    ),
                    array(
                        'field' => 'fromdate',
                        'realfield' => 'creationdate',
                        'char' => 't'
                    ),
                    array(
                        'field' => 'todate',
                        'realfield' => 'creationdate',
                        'char' => 't'
                    ),
                    array(
                        'field' => 'entityid',
                        'realfield' => 'entityid',
                        'char' => 'c'
                    )
                        ), false, $select);
        if ($simple)
            return $query['results'];
        return self::formatData($query['results'], $query['page'], $query['count']);
    }

    public static function findByAK($ak) {
        return BaseTable::findByAK(self::table, self::akfield, $ak);
    }

    public static function getAll($filters = array(), $simple = false) {
        return self::getAllPaged(0, PHP_INT_MAX, $filters, $simple);
    }

    public static function deleteByPK($pks, $user = false) {
        return BaseTable::deleteByPK(self::getInstance(), $pks);
    }

    //[getByParentMethod]
}