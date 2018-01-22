<?php
namespace app\idata\controller;

use cmf\controller\HomeBaseController;
use think\Db;

/**
* 我的数据中心
* PV(浏览次数)、VV(访问次数)、UV(独立访客)、QPS每秒查询次数、TPS(每秒事务数)
*/
class IndexController extends HomeBaseController
{
    public function index()
    {
        return $this->fetch();
    }
}