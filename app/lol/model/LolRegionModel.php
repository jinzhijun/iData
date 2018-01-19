<?php
namespace app\lol\model;

use app\idata\model\ComModel;

/**
* 
* @param string $field
* @return object $list 
*/
class LolRegionModel extends ComModel
{
    public function getLists($filter=[], $order='', $limit=15, $field='', $extra=[])
    {
        $field = empty($field) ? '*': $field;
        // $join = [
        //     ['__USER__ u', 'a.user_id = u.id']
        // ];

        $where = [];
        // $where = ['delete_time'=>0];
        $where = array_merge($where,$extra);
        if (!empty($position)) {
            $where['nettype'] = ['like', "%$type%"];
        }
        $startTime = empty($filter['start_time']) ? 0 : strtotime($filter['start_time']);
        $endTime   = empty($filter['end_time']) ? 0 : strtotime($filter['end_time']);
        if (!empty($startTime) && !empty($endTime)) {
            $where['published_time'] = [['>= time', $startTime], ['<= time', $endTime]];
        } else {
            if (!empty($startTime)) {
                $where['published_time'] = ['>= time', $startTime];
            }
            if (!empty($endTime)) {
                $where['published_time'] = ['<= time', $endTime];
            }
        }
        $keyword = empty($filter['keyword']) ? '' : $filter['keyword'];
        if (!empty($keyword)) {
            $where['name'] = ['like', "%$keyword%"];
        }

        $order = empty($order) ? 'list_order,published_time DESC,id DESC' : $order;

        $list = $this->field($field)
            // ->join($join)
            ->where($where)
            ->order($order)
            ->paginate($limit);

        return $list;
    }


}