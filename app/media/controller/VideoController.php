<?php
namespace app\media\controller;

use cmf\controller\HomeBaseController;
use think\Db;

/**
* 我的媒体中心
* 视频
*/
class VideoController extends HomeBaseController
{
    public function index()
    {
        return $this->fetch();
    }
}