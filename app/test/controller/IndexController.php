<?php
namespace app\test\controller;

use cmf\controller\HomeBaseController;
use think\helper\Time;
use map\Map;
use think\Db;

/**
 * 访问记录页
 * PV(浏览次数)、VV(访问次数)、UV(独立访客)、QPS每秒查询次数、TPS(每秒事务数)
*/
class IndexController extends HomeBaseController
{
    public function index()
    {
        // dump(cmf_get_current_user());die;
        // $this->error('用户尚未登录',url('user/Login/index'));

        // 初始化、获取
        $openMax = 30;// 你每日最大访问次数
        $limit = 50;// 列表分页数
        $userId = cmf_get_current_user_id();
        $ip = $ip = get_client_ip(0, true);
        $agent = $_SERVER['HTTP_USER_AGENT'];
        $agent_md5 = md5($agent);
        $time = Time::today();
        $visitQ = Db::name('visit_log');

        // 获取位置信息
        $ll = Map::locationByIp($ip);
        $addr = $ll[1];

        // 访问限制
        $where = [
            'create_time' => [['>= time', $time[0]], ['<= time', $time[1]]],
            'ip' => $ip,
            'agent_md5' => $agent_md5,
        ];
        $find = $visitQ->field('id,total,ipaddr,ipaddrVar')->where($where)->find();
        if ($find['total']>=5 && $find['total']<$openMax) {
            echo '还能打开页面 '.($openMax-$find['total']).' 次';
        } elseif ($find['total']>=$openMax) {
            die('非法入侵！');
        }

        // 添加访问记录
        if (empty($find)) {
            if (cmf_is_wechat()===true) {
                $type = 'wechat';
            } elseif (cmf_is_mobile()===true) {
                $type = 'wap';
            } else {
                $type = 'pc';
            }
            $log = [
                'user_id' => $userId,
                'obj_type' => $type,
                'ip' => $ip,
                'ipaddr' => json_encode($addr),
                'ipaddrVar' => implode(',',(array)$addr),
                'agent' => $agent,
                'agent_md5' => $agent_md5,
                'create_time' => time(),
                'update_time' => time(),
            ];
            // $visitQ->insert($log);
            // $result = $visitQ->getLastInsID();
            $insertId = $visitQ->insertGetId($log);
        } else {
            $log = [
                'total' => $find['total']+1,
                'update_time' => time()
            ];
            $result = $visitQ->where('id',$find['id'])->update($log);
        }
        $your_visit_id = empty($find['id']) ? (empty($insertId)?null:$insertId) : $find['id'];


        // 获取访问记录
        $field = 'id,obj_type,total,ip,ipaddrVar,agent,create_time,update_time';
        // $where = ['obj_type'=>'pc'];
        $list = $visitQ->order('id DESC')->paginate($limit);

        // 统计 PV(浏览次数)、VV(访问次数)、UV(独立访客)、QPS每秒查询次数、TPS(每秒事务数)
        // $pv = $visitQ->count('total');
        // dump($pv);


        // 模板赋值
        $this->assign('your_visit_id', $your_visit_id);
        $this->assign('limit', $limit);
        $this->assign('list', $list);
        $this->assign('pager', $list->render());
        return $this->fetch(':index');
    }
}