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
        $field = empty($field) ? 'id,hchampion,hname,hcname,oldername,hvoucher,hgold,hposition,wpct,hard,description,published_time,is_top,is_rec,status,more,list_order': $field;

        // $join = [
        //     ['__USER__ u', 'a.user_id = u.id']
        // ];

        $where = ['delete_time'=>0];
        $position = empty($filter['cid']) ? 0 : intval($filter['cid']);
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
        $where = array_merge($where,$extra);

        $order = empty($order) ? 'is_top DESC,is_rec DESC,list_order,update_time DESC,id DESC' : $order;
        $limit = $this->getLimitCom($limit);

        $list = $this->field($field)
            // ->join($join)
            ->where($where)
            ->order($order)
            ->paginate($limit);

        return $list;
    }

    public function getHeroPosition($status=[],$option=false)
    {
        $options = $this->getStatus($status,'heroposition','checkbox',$option);

        return $options;
    }


}