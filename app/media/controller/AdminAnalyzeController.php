<?php
namespace app\media\controller;

use cmf\controller\AdminBaseController;
use think\Db;

/**
 * 媒体
 * 数据分析
 * 电子书、相册、音乐、视频
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




}