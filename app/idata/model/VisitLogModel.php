<?php
namespace app\idata\model;

use app\idata\model\ComModel;

/**
* 
* @param string $field
* @return object $list 
*/
class VisitLogModel extends ComModel
{
    public function getLists($filter=[], $order='', $limit=15, $field='', $extra=[])
    {
        $field = empty($field) ? '*': $field;

        $where = [];
        if (!empty($filter['cid'])) {
            $where['obj_type'] = ['eq', $filter['cid']];
        }
        $startTime = empty($filter['start_time']) ? 0 : strtotime($filter['start_time']);
        $endTime   = empty($filter['end_time']) ? 0 : strtotime($filter['end_time']);
        if (!empty($startTime) && !empty($endTime)) {
            $where['create_time'] = [['>= time', $startTime], ['<= time', $endTime]];
        } else {
            if (!empty($startTime)) {
                $where['create_time'] = ['>= time', $startTime];
            }
            if (!empty($endTime)) {
                $where['create_time'] = ['<= time', $endTime];
            }
        }
        if (!empty($filter['ip'])) {
            $where['ip'] = trim($filter['ip']);
        }
        $keyword = empty($filter['keyword']) ? '' : trim($filter['keyword']);
        if (!empty($keyword)) {
            $where['agent|ipaddrVar'] = ['like', "%$keyword%"];
        }
        $where = array_merge($where,$extra);

        $order = empty($order) ? 'id DESC' : $order;
        $limit = $this->getLimitCom($limit);

        $list = $this->field($field)
            ->where($where)
            ->order($order)
            ->paginate($limit);

        return $list;
    }


}