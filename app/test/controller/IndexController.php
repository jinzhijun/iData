<?php
namespace app\test\controller;

use cmf\controller\HomeBaseController;
use map\Map;
use think\helper\Time;
use think\Db;

/**
 * 访问记录页
 * Db::query("select * from think_user where status=1");//查询,读操作
 * Db::execute("update think_user set name='thinkphp' where status=1");//更新和写入,写操作
 * $result = Db::table('think_user')->fetchSql(true)->find(1);
 * $list = User::where('status',1)->paginate(10);
   $this->assign('list', $list);
   $this->assign('pager', $list->render());
 *
*/
class IndexController extends HomeBaseController
{
    public function index()
    {
        // dump(cmf_get_current_user());die;
        // $this->error('用户尚未登录',url('user/Login/index'));
        $userId = cmf_get_current_user_id();
        $ip = $ip = get_client_ip(0, true);
        $time = Time::today();
        $agent = $_SERVER['HTTP_USER_AGENT'];
        $agent_md5 = md5($agent);
        $visitQ = Db::name('visit_log');

        // 获取位置信息
        // $ip = '223.104.18.150';
        // $ip = '106.14.74.155';
        $ll = Map::locationByIp($ip);
        $addr = $ll[1];

        // 访问限制
        $where = [
            'create_time' => [['>= time', $time[0]], ['<= time', $time[1]]],
            'ip' => $ip,
            'agent_md5' => $agent_md5,
        ];
        $find = $visitQ->field('id,total,ipaddr,ipaddrVar')->where($where)->find();
        $openMax = 50;
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
        $limit = 30;
        $list = $visitQ->paginate($limit);


        // 模板赋值
        $this->assign('your_visit_id', $your_visit_id);
        $this->assign('limit', $limit);
        $this->assign('list', $list);
        $this->assign('pager', $list->render());
        return $this->fetch(':index');
    }
}