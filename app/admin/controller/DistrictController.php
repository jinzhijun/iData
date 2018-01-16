<?php
namespace app\admin\controller;

use cmf\controller\AdminBaseController;
// use app\admin\model\DistrictModel;
use think\Db;

/**
 * Class DistrictController 地区管理控制器
 * @package app\admin\controller
 */
class DistrictController extends AdminBaseController
{

    /**
     * 地区管理
     * @adminMenu(
     *     'name'   => '地区管理',
     *     'parent' => 'admin/District/default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 30,
     *     'icon'   => '',
     *     'remark' => '地区管理',
     *     'param'  => ''
     * )
    */
    public function index()
    {
        return '地区管理';
        $this->fetch();
    }
}