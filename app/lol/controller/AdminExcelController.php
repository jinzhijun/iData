<?php
namespace app\lol\controller;

use cmf\controller\AdminBaseController;
use think\Db;

/**
 * 游戏
 * lol
 * 导入导出
*/
class AdminExcelController extends AdminBaseController
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

    // 导入
    public function import()
    {
        // return $this->fetch();
    }

    // 导出
    public function export()
    {
        // return $this->fetch();
    }


}