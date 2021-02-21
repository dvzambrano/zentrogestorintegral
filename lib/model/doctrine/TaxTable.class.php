<?php

/**
 * TaxTable
 * Codigo fuente generado por el SGArqBase: Plataforma de construcci�n de Sistemas.
 *
 * @author     MSc. Donel V�zquez Zambrano
 * @version    1.0.0
 */
class TaxTable extends Doctrine_Table {

    /**
     * Returns an instance of this class.
     *
     * @return object TaxTable
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
                    array('name' => 'customicon', 'type' => 'string'),
                    array('name' => 'deleteable', 'type' => 'bool'),
                    array('name' => 'code', 'type' => 'string')
                    , array('name' => 'name', 'type' => 'string')
                    , array('name' => 'comment', 'type' => 'string')
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

    const table = 'Tax';
    const akfield = 'code';

    public static function getAllPaged($start, $limit, $filters, $simple = false) {
        $select = 'true as deleteable';
//        $select = '(SELECT COUNT(q.periodid) FROM Goal q WHERE q.periodid = t.id)<1 as deleteable';
        $query = BaseTable::getAllPaged(self::table, $start, $limit, $filters, array(), array(), false, $select);
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