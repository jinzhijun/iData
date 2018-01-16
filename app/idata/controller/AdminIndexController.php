<?php
namespace app\idata\controller;

use cmf\controller\AdminBaseController;
use think\Db;

/**
* 我的数据中心
*/
class AdminIndexController extends AdminBaseController
{
    public function index()
    {
        return $this->fetch();
    }

    public function f511()
    {
        return $this->fetch();
    }
}