<?php
namespace app\idata\controller;

use cmf\controller\AdminBaseController;
use app\idata\model\IdataTimelineModel;
use think\helper\Time;
use think\Db;

/**
* 我的数据中心
* 与芳相关的
* 十二个月的最美别称：http://culture.china.com/art/11159887/20180104/31911242_3.html
*/
class AdminF511Controller extends AdminBaseController
{
    public function index()
    {
        return $this->fetch();
    }

    public function f511()
    {
        // return $this->fetch();
    }


    /**
     * 时光轴
     * 添加时间点，记录每一个时间点
     * 每个时间点上可以加字、图、语音、视频和文件
     * @return [type] [description]
     */
    public function timeline()
    {
        // 获取请求数据
        $param = $this->request->param();

        // 初始化
        // $nowTime = Time::tranTime('2018-01-22');
        // $nowTime = Time::tranTime(time());
        $visitQ = new IdataTimelineModel();
        $order = 'line_time DESC';
        $limit = 30;// 列表分页数
        $field = 'id,access_type,name,nickname,sex,description,line_time,create_time,update_time,modtimes,is_star,status';
        $extra = [];

        //  列表
        $list = $visitQ->getLists($param, $order, $limit, $field, $extra);

        // 模板赋值
        $this->assign('cid', isset($param['cid']) ? $param['cid'] : '');
        $this->assign('start_time', isset($param['start_time']) ? $param['start_time'] : '');
        $this->assign('end_time', isset($param['end_time']) ? $param['end_time'] : '');
        $this->assign('keyword', isset($param['keyword']) ? $param['keyword'] : '');

        $this->assign('list', $list->items());
        $list->appends($param);
        $this->assign('pager', $list->render());
        return $this->fetch();
    }

    public function addTimeline()
    {
        return $this->fetch();
    }
    public function addTimelinePost()
    {
        $smodel = new IdataTimelineModel();
        $post = $this->op();
        $post['create_time'] = time();

        $smodel->insertData($post);

        $this->success('提交成功',url('AdminF511/editTimeline',['id'=>$smodel->id]));
    }

    public function editTimeline()
    {
        $id = $this->request->param('id',0,'intval');
        
        $smodel = new IdataTimelineModel();
        $post = $smodel->getPost($id);

        $this->assign('post',$post);
        return $this->fetch();
    }
    public function editTimelinePost()
    {
        $smodel = new IdataTimelineModel();
        $post = $this->op();
        $post['update_time'] = time();
        $post['modtimes'] = $post['modtimes']+1;

        $smodel->updateData($post);

        $this->success('编辑成功');
    }
    public function op()
    {
        $data = $this->request->param();
        $post = $data['post'];

        $smodel = new IdataTimelineModel();
        if (!empty($data['photo'])) {
            $post['more']['photos'] = $smodel->dealFiles($data['photo']);
        }
        if (!empty($data['file'])) {
            $post['more']['files'] = $smodel->dealFiles($data['file']);
        }

        $post['access_type'] = empty($post['access_type']) ? $smodel->getAccessType() : $post['access_type'];
        $post['ip'] = empty($post['ip']) ? get_client_ip() : $post['ip'];

        return $post;
    }



// 通用操作
    public function delete()
    {
        $param = $this->request->param();
        $dbName = $this->request->param('db','');
        if (empty($dbName)) {
            $this->error('数据库名丢失！');
        }
        $smodel = Db::name($dbName);

        // 是否软删除 回收机制
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
        $this->error('删除失败！');
    }

    // 状态操作
    public function change()
    {
        $dbName = $this->request->param('db/s','');
        $operate = $this->request->param('operate/s');
        $status = $this->request->param('status/d');
        if (empty($dbName)) {
            $this->error('数据库名丢失！');
        }
        if (empty($operate)) {
            $this->error('操作丢失！');
        }

        $smodel = Db::name($dbName);
        $ids = $this->request->param('ids/a');
        if (isset($ids)) {
            $smodel->where(['id'=>['in',$ids]])->update([$operate=>$status]);
            $this->success('操作成功！', '');
        }
    }
}