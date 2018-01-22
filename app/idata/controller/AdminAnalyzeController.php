<?php
namespace app\idata\controller;

use cmf\controller\AdminBaseController;
use app\idata\model\VisitLogModel;
use think\Db;

/**
 * iData
 * 数据分析
 * 
*/
class AdminAnalyzeController extends AdminBaseController
{
    public function index()
    {
        // 获取、预处理
        $data = $this->request->param();
        $request = input('request.');
        $where   = [];

        // 条件筛选


        // 获取列表数据
        $list = [];
dump($list);

        // 模板赋值
        $this->assign('list', $list);
        // $this->assign('pager', $list->render());// 获取分页显示
        // 渲染模板输出
        // return $this->fetch();
    }

    /**
     * 网站访问记录、统计
     * @return [type] [description]
     */
    public function visit()
    {
        // 获取请求数据
        $param = $this->request->param();
        $order = $this->request->param('sort');

        // 初始化
        $visitQ = new VisitLogModel();
        $order = str_replace('%20',' ',$order);
        $limit = 50;// 列表分页数
        $field = 'id,obj_type,total,ip,ipaddrVar,agent,create_time,update_time';
        $extra = [];
        // $where = ['obj_type'=>'pc'];

        //  列表
        $list = $visitQ->getLists($param, $order, $limit, $field, $extra);

        // 统计 PV(浏览次数)、VV(访问次数)、UV(独立访客)、QPS(每秒查询次数)、TPS(每秒事务数)
        $count['pv'] = $visitQ->sum('total');
        $count['vv'] = $visitQ->count('total');
        $count['uv'] = $visitQ->avg('total');
        $count['qps'] = 'null';
        $count['tps'] = 'null';

        $count['avg'] = $visitQ->avg('total');
        $count['max'] = $visitQ->max('total');
        $count['gt1count'] = $visitQ->where('total','gt',1)->count('total');
        $count['gt1sum'] = $visitQ->where('total','gt',1)->sum('total');

        // 模板赋值
        $this->assign('cid', isset($param['cid']) ? $param['cid'] : '');
        $this->assign('start_time', isset($param['start_time']) ? $param['start_time'] : '');
        $this->assign('end_time', isset($param['end_time']) ? $param['end_time'] : '');
        $this->assign('keyword', isset($param['keyword']) ? $param['keyword'] : '');
        $this->assign('limit', $limit);
        $this->assign('count', $count);
        $this->assign('list', $list->items());
        $list->appends($param);
        $this->assign('pager', $list->render());
        return $this->fetch();
    }
    public function visitDb()
    {
        // 获取请求数据
        $param = $this->request->param();

        // 初始化
        $visitQ = Db::name('visit_log');
        $limit = 50;// 列表分页数
        $field = 'id,obj_type,total,ip,ipaddrVar,agent,create_time,update_time';
        // $where = ['obj_type'=>'pc'];

        //  列表
        $list = $visitQ->order('id DESC')->paginate($limit);
        // 分组
        // $field = 'id,obj_type,max(total) total,ip,ipaddrVar,agent,create_time,update_time';
        // $list = $visitQ->field($field)->group('create_time')->having('count(total)>1')->paginate($limit);
        $count = [];

        $this->assign('limit', $limit);
        $this->assign('count', $count);
        $this->assign('list', $list);
        $this->assign('pager', $list->render());
        return $this->fetch();
    }




    public function delete()
    {
        $param = $this->request->param();
        $dbName = $this->request->param('db','');
        if (empty($dbName)) {
            $this->error('数据库名丢失！');
        }
        $smodel = Db::name($dbName);

        if (isset($param['id'])) {
            $id = $this->request->param('id', 0, 'intval');
            $smodel->where('id',$id)->delete();
            $this->success('删除成功！','');
        }

        if (isset($param['ids'])) {
            $ids = $this->request->param('ids/a');
            $smodel->where(['id'=>['in',$ids]])->delete();
            $this->success('删除成功！','');
        }
    }

    // 状态操作
    public function change()
    {
        $dbName = $this->request->param('db/s','');
        $operate = $this->request->param('operate/a');
        if (empty($dbName)) {
            $this->error('数据库名丢失！');
        }
        if (empty($operate)) {
            $this->error('操作参数丢失！');
        }

        $smodel = Db::name($dbName);
        $ids = $this->request->param('ids/a');
        if (isset($ids)) {
            $smodel->where(['id'=>['in',$ids]])->update($operate);
            $this->success('操作成功！', '');
        }
    }


}