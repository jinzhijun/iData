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
        $cId = $this->request->param('cid', 0, 'intval');
        // $request = input('request.');

        $smodel = new LolHeroModel();
        // 获取列表数据
        $list = $smodel->getLists($param);

        $cateTree = $smodel->getStatus($cId,'heroposition');
// dump($list);die;

        // 模板赋值
        $this->assign('start_time', isset($param['start_time']) ? $param['start_time'] : '');
        $this->assign('end_time', isset($param['end_time']) ? $param['end_time'] : '');
        $this->assign('cate_tree', $cateTree);
        // $this->assign('cId', $cId);
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

        $smodel = new LolHeroModel();
        if (!empty($data['photo'])) {
            $post['more']['photos'] = $smodel->dealFiles($data['photo']);
        }

        $smodel->insertData($post);

        $this->success('提交成功',url('AdminHero/edit',['id'=>$smodel->id]));
    }

    public function edit()
    {
        $id = $this->request->param('id',0,'intval');
        $smodel = new LolHeroModel();
        $post = $smodel->getPost($id);

        $this->assign('post',$post);
        return $this->fetch();
    }
    public function editPost()
    {
        $data = $this->request->param();
        $post = $data['post'];

        $smodel = new LolHeroModel();
        if (!empty($data['photo'])) {
            $post['more']['photos'] = $smodel->dealFiles($data['photo']);
        }

        $smodel->updateData($post);

        $this->success('编辑成功');
    }

    public function delete()
    {
        $param = $this->request->param();
        $smodel = new LolHeroModel();

        if (isset($param['id'])) {
            $id = $this->request->param('id', 0, 'intval');
            $result = $smodel->field('id,hchampion')->where(['id'=>$id])->find();
            $log = [
                'object_id'   => $result['id'],
                'create_time' => time(),
                'table_name'  => 'lol_hero',
                'name'        => $result['hchampion']
            ];
            // 因为不是什么重要的，所以没用事务处理
            $res = $smodel->where(['id'=>$id])->update(['delete_time'=>time()]);
            if (!empty($res)) {
                Db::name('lol_hero')->where(['id'=>$id])->update(['status'=>0]);
                Db::name('recycleBin')->insert($log);
            }
            $this->success('删除成功！','');
        }

        if (isset($param['ids'])) {
            $ids = $this->request->param('ids/a');
            $recycle = $smodel->field('id,hchampion')->where(['id'=>['in',$ids]])->select();
            // 因为不是什么重要的，所以没用事务处理
            $result = $smodel->where(['id'=>['in',$ids]])->update(['delete_time'=>time()]);
            if (!empty($result)) {
                foreach ($recycle as $value) {
                    $log = [
                        'object_id'   => $value['id'],
                        'create_time' => time(),
                        'table_name'  => 'lol_hero',
                        'name'        => $value['hchampion']
                    ];
                    Db::name('recycleBin')->insert($log);
                }
                $this->success('删除成功！','');
            }
        }
    }

    // 状态操作
    public function change()
    {
        $param = $this->request->param();
        $smodel = new LolHeroModel();

        if (isset($param['ids'])) {
            $ids = $this->request->param('ids/a');
            unset($param['ids']);
            $smodel->where(['id'=>['in',$ids]])->update($param);
            $this->success('操作成功！', '');
        }
    }

    public function listOrder()
    {
        parent::listOrders(Db::name('lol_hero'));
        $this->success('排序更新成功！','');
    }

    public function move()
    {

    }

    public function copy()
    {

    }
}