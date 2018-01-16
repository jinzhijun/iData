<?php
namespace app\idata\controller;

use cmf\controller\UserBaseController;
use think\Db;

/**
* 我的数据中心
 * 后花园
*/
class GardenController extends UserBaseController
{
    public function index()
    {
        return $this->fetch('garden/index');
    }

    public function yard()
    {
        return $this->fetch('garden/yard/index');
    }

    public function secret()
    {
        return $this->fetch('garden/secret/index');
    }
}