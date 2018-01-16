<?php
namespace app\media\controller;

use cmf\controller\HomeBaseController;
use think\Db;

/**
* 我的数据中心
*/
class BookController extends HomeBaseController
{
    public function index()
    {
        return $this->fetch();
    }
}