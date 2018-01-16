<?php
namespace app\lol\controller;

use cmf\controller\AdminBaseController;
use app\lol\model\LolHeroModel;
use think\Db;

/**
 * 游戏
 * lol
 * 英雄大全
*/
class AdminHeroController extends AdminBaseController
{
    public function index()
    {
        // 获取、预处理
        $param = $this->request->param();
        $positionId = $this->request->param('position', 0, 'intval');
        // $request = input('request.');

        $heroModel = new LolHeroModel();
        // 获取列表数据
        $list = model('LolHero')->getLists($param);

        $positionTree = $heroModel->getStatus($positionId,'heroposition');
// dump($list);die;



        // 模板赋值
        $this->assign('start_time', isset($param['start_time']) ? $param['start_time'] : '');
        $this->assign('end_time', isset($param['end_time']) ? $param['end_time'] : '');
        $this->assign('position_tree', $positionTree);
        // $this->assign('position', $positionId);
        $this->assign('list', $list->items());
        // 获取分页显示
        $list->appends($param);
        $this->assign('pager', $list->render());


        // 渲染模板输出
        return $this->fetch();
    }

    public function add()
    {
        return $this->fetch();
    }
    public function addPost()
    {
        $data = $this->request->param();
        $post = $data['post'];

        $heroModel = new LolHeroModel();
        if (!empty($data['photo'])) {
            $post['more']['photos'] = $heroModel->dealFiles($data['photo']);
        }

        $heroModel->insertData($post);

        $this->success('提交成功');
    }

    public function edit()
    {
        $id = $this->request->param('id',0,'intval');
        $heroModel = new LolHeroModel();
        $post = $heroModel->getPost($id);

        $this->assign('post',$post);
        return $this->fetch();
    }
    public function editPost()
    {
        $data = $this->request->param();
        $post = $data['post'];

        $heroModel = new LolHeroModel();
        if (!empty($data['photo'])) {
            $post['more']['photos'] = $heroModel->dealFiles($data['photo']);
        }

        $heroModel->updateData($post);

        $this->success('编辑成功');
    }




}