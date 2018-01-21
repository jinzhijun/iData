<?php
namespace app\lol\model;

use app\idata\model\ComModel;

/**
* 
* @param string $field
* @return object $list 
*/
class LolMatchModel extends ComModel
{
    public function getLists($filter=[], $order='', $limit=15, $field='', $extra=[])
    {
        $field = empty($field) ? 'a.*,b.name mode_name': $field;
        $join = [
            ['__LOL_MODE__ b', 'a.mode_id = b.id', 'LEFT']
        ];
        // $join = [
        //     ['lol_mode b', 'a.mode_id = b.id', 'LEFT']
        // ];

        $where = [];
        // $where = ['delete_time'=>0];
        $type = empty($filter['cid']) ? 0 : intval($filter['cid']);
        if (!empty($type)) {
            $where['a.mode_id'] = ['eq', $type];
        }
        $startTime = empty($filter['start_time']) ? 0 : strtotime($filter['start_time']);
        $endTime   = empty($filter['end_time']) ? 0 : strtotime($filter['end_time']);
        if (!empty($startTime) && !empty($endTime)) {
            $where['a.s_time'] = [['>= time', $startTime], ['<= time', $endTime]];
        } else {
            if (!empty($startTime)) {
                $where['a.s_time'] = ['>= time', $startTime];
            }
            if (!empty($endTime)) {
                $where['a.s_time'] = ['<= time', $endTime];
            }
        }
        $where = array_merge($where,$extra);

        $order = empty($order) ? 'a.id DESC' : $order;
        $limit = $this->getLimitCom($limit);

        $list = $this->alias('a')
            ->field($field)
            ->join($join)
            ->where($where)
            ->order($order)
            // ->fetchSql(true)->select();
            ->paginate($limit);

        return $list;
    }


}