<?php

/**
 * ProductTable
 * Codigo fuente generado por el SGArqBase: Plataforma de construcción de Sistemas.
 *
 * @author     MSc. Donel Vázquez Zambrano
 * @version    1.0.0
 */
class ProductTable extends Doctrine_Table {

    /**
     * Returns an instance of this class.
     *
     * @return object ProductTable
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
					
					array('name' => 'name', 'mapping' => 'Element.name', 'type' => 'string'),
					array('name' => 'comment', 'mapping' => 'Element.comment', 'type' => 'string'),
					array('name' => 'um', 'mapping' => 'Element.Um.name', 'type' => 'string'),
					array('name' => 'amount', 'type' => 'decimal'),
                    array('name' => 'currencyid', 'type' => 'int'),
                    array('name' => 'elementid', 'type' => 'int'),
                    array('name' => 'deleteable', 'type' => 'bool'),
                    array('name' => 'Element'),
                    array('name' => 'ProductTaxRelation'),
                    array('name' => 'Currency')
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

    const table = 'Product';
    const akfield = 'id';

    public static function getAllPaged($start, $limit, $filters, $simple = false) {
        $select = 'e.*, u.*, r.*, t.*, c.*, true as deleteable';
						  //getAllPaged($table, $start, $limit, $filters = array(), $joins = array(), $replacements = array(), $ordered = false, $select = false, $where = false) {
        $query = BaseTable::getAllPaged(self::table, $start, $limit, $filters, array('t.Element e', 'e.Um u', 't.Currency c', 't.ProductTaxRelation r'), array(
			// replacement
			array('field'=> 'entityid', 'realfield'=> 'entityid', 'char'=> 'e'),
			array('field'=> 'name', 'realfield'=> 'name', 'char'=> 'e'),
			array('field'=> 'comment', 'realfield'=> 'comment', 'char'=> 'e'),
			array('field'=> 'um', 'realfield'=> 'name', 'char'=> 'u'),
			array('field'=> 'Currency', 'realfield'=> array('code', 'name'), 'char'=> 'c'),
		), false, $select);
        if ($simple)
            return $query['results']->toArray();
        return self::formatData($query['results'], $query['page'], $query['count']);
    }

    public static function findByAK($ak) {
        return BaseTable::findByAK(self::table, self::akfield, $ak);
    }

    public static function getAll($filters = array(), $simple = false) {
        return self::getAllPaged(0, PHP_INT_MAX, $filters, $simple);
    }

    public static function deleteByPK($pks) {
        return BaseTable::deleteByPK(self::getInstance(), $pks);
    }

    // for importing from filepurposes. DO NOT DELETE!
    public static function getRebuilded($array = array()) {
        $product = false;

        if (!$product && $array['code'] != '')
            $product = Doctrine::getTable('Product')->findByAK($array['code']);

        if (!$product && $array['id'] > 0) {
            $product = new Product();
            $product->fromArray($array);
            $product->save();
        }

        return $product;
    }

    //[getByParentMethod]
}