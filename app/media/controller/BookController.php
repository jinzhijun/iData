<?php
namespace app\media\controller;

use cmf\controller\HomeBaseController;
use think\Db;

/**
* 我的媒体中心
* 书籍
*/
class BookController extends HomeBaseController
{
    public function index()
    {
        return $this->fetch();
    }
}