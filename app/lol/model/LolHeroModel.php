<?php
namespace app\lol\model;

use app\idata\model\ComModel;

/**
* 
* @param string $field
* @return object $list 
*/
class LolHeroModel extends ComModel
{
    public function getLists($filter=[], $order='', $limit=15, $field='', $extra=[])
    {
        $field = empty($field) ? 'id,hchampion,hname,hcname,oldername,hvoucher,hgold,hposition,wpct,hard,description,published_time,is_top,is_rec,status,more': $field;
        $where = [];
        // $join = [];
        // $join = [
        //     ['__USER__ u', 'a.user_id = u.id']
        // ];
        $where = array_merge($where,$extra);

        $position = empty($filter['position']) ? 0 : intval($filter['position']);
        if (!empty($position)) {
            $where['hposition'] = ['like', "%$position%"];
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
            $where['hchampion|hname|hcname|oldername'] = ['like', "%$keyword%"];
        }

        $order = empty($order) ? 'update_time DESC' : $order;

        $list = $this->field($field)
            // ->join($join)
            ->where($where)
            ->order($order)
            ->paginate($limit);

        return $list;
    }


}