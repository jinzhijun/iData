<?php
namespace app\idata\controller;

use cmf\controller\AdminBaseController;
use think\Db;

/**
* 我的数据中心
* 首页
*/
class AdminIndexController extends AdminBaseController
{
    public function index()
    {
        return $this->fetch();
    }

    /**
     * 回忆录
     * https://wenku.baidu.com/view/cef51ff0de80d4d8d05a4f92.html
     * @return [type]        [description]
     */
    public function memoirs()
    {
        return '回忆录';
        return $this->fetch();
    }

    /**
     * 留言簿
     * @param string $value [description]
     */
    public function guestbook()
    {
        return '留言簿';
        return $this->fetch();
    }
}