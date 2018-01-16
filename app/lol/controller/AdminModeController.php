<?php
namespace app\lol\controller;

use cmf\controller\AdminBaseController;
use think\Db;

/**
 * 游戏
 * lol
 * 游戏模式
*/
class AdminModeController extends AdminBaseController
{
    public function index()
    {
        // 获取、预处理
        $data = $this->request->param();
        $request = input('request.');
        $where   = [];

        // 条件筛选


        // 获取列表数据
        // $list = [];
// dump($list);

        // 模板赋值
        $this->assign('list', $list);
        // $this->assign('pager', $list->render());// 获取分页显示
        // 渲染模板输出
        return $this->fetch();
    }




}