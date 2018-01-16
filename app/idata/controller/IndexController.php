<?php
namespace app\idata\controller;

use cmf\controller\HomeBaseController;
use think\Db;

/**
* 我的数据中心
*/
class IndexController extends HomeBaseController
{
    public function index()
    {
        return $this->fetch();
    }
}