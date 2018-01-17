<?php
namespace app\idata\controller;

use cmf\controller\AdminBaseController;
use think\Db;

/**
* 我的数据中心
*/
class AdminGardenController extends AdminBaseController
{
    public function index()
    {
        return $this->fetch();
    }

    public function yard()
    {
        return $this->fetch();
    }

    public function backyard()
    {
        return $this->fetch();
    }

    public function flower()
    {
        return $this->fetch();
    }

    public function secret()
    {
        return $this->fetch();
    }
}