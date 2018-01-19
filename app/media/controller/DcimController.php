<?php
namespace app\media\controller;

use cmf\controller\HomeBaseController;
use think\Db;

/**
* 我的媒体中心
* 图片
*/
class DcimController extends HomeBaseController
{
    public function index()
    {
        return $this->fetch();
    }
    public function album()
    {
        return $this->fetch();
    }
}