<?php
namespace app\test\controller;

use cmf\controller\HomeBaseController;

/**
* 测试模块
*/
class TestController extends HomeBaseController
{
    public function index()
    {
        var_export($_SESSION);
        // return $this->fetch();
    }

    public function test()
    {
        return $this->fetch();
    }

    // 王菲
    public function faye()
    {
        return $this->fetch();
    }
}