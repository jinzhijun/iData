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
        $userId = cmf_get_current_user_id();
        $ip = $ip = get_client_ip(0, true);
        $time = Time::today();
        $agent = $_SERVER['HTTP_USER_AGENT'];
        $agent_md5 = md5($agent);
// dump($userId);
// dump($ip);
// dump($time);
// dump($agent);



        // 获取位置信息
        // $ip = '223.104.18.150';
        // $ip = '106.14.74.155';
        $ll = Map::locationByIp($ip);
        $addr = $ll[1];
// dump($ll);
// dump($addr);
// die;
        /*if (empty($ll[0])) {
            $localId = null;
        } else {
            $local = $ll[1];
            $GPS = $map->locationByGPS($local['lng'], $local['lat']);
            // $localId = Db::name('district')->where(['name',['like',"%$local[province]%"]])->value('id');
        }*/



        // 访问限制
        // session('ips',null);
        $ips = session('ips');
        // if ( !empty($ips) && in_array(md5($ip),$ips) ) {
        //     echo '<pre>';
        //     var_export($ips);
        //     echo '</pre>';
        //     die('非法入侵！');
        // }
        $where = [
            'create_time' => [['>= time', $time[0]], ['<= time', $time[1]]],
            'ip' => $ip,
            'agent_md5' => $agent_md5,
        ];
        $find = Db::name('visit_log')->field('id,total,ipaddr,ipaddrVar')->where($where)->find();
        if ($find['total']>=5) {
            $ipban = md5($ip);
            if (empty(session('ips'))) {
                $sips = [];
            } else {
                $sips = session('ips');
            }
            $scount = count($sips);
            if ($scount>0) {
                if (!in_array($ipban, $sips)) {
                    $sips = array_merge($sips,[$ipban]);
                    session('ips',$sips);
                } else {
                    // 放行
                }
            } else {
                session('ips',[$ipban]);
            }
        }
dump($find);
// dump($ips);
// $a = ['a'];
// $b = ['b'];
// $c = ['c'];
// dump(array_merge($a,$b,$c));
// array_push($a,$b);
// dump($a);



        // 添加记录
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
            // Db::name('visit_log')->insert($log);
            // $result = Db::name('visit_log')->getLastInsID();
            $insertId = Db::name('visit_log')->insertGetId($log);
        } else {
            $log = [
                'total' => $find['total']+1,
                'update_time' => time()
            ];
            $result = Db::name('visit_log')->where('id',$find['id'])->update($log);
        }

        $your_visit_id = empty($find['id']) ? (empty($insertId)?null:$insertId) : $find['id'];



        // 获取访问记录
        $field = 'id,obj_type,total,ip,ipaddrVar,agent,create_time,update_time';
        // $where = ['obj_type'=>'pc'];
        $list = Db::name('visit_log')->paginate(30);



        // 模板赋值
        $this->assign('list', $list);
        $this->assign('pager', $list->render());
        return $this->fetch(':index');
    }
}