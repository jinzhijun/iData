<?php
namespace app\media\controller;

use cmf\controller\HomeBaseController;
use think\Db;

/**
* 我的媒体中心
* 音乐
*/
class TestController extends HomeBaseController
{
    public function index()
    {
        return $this->fetch();
    }

    // 
    public function test()
    {
        return $this->fetch();
    }

    // 
    public function music()
    {
        return $this->fetch();
    }
}