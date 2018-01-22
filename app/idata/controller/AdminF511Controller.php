<?php
namespace app\idata\controller;

use cmf\controller\AdminBaseController;
use think\helper\Time;
use think\Db;

/**
* 我的数据中心
* 与芳相关的
* 十二个月的最美别称：http://culture.china.com/art/11159887/20180104/31911242_3.html
*/
class AdminF511Controller extends AdminBaseController
{
    public function index()
    {
        return $this->fetch();
    }

    public function f511()
    {
        // return $this->fetch();
    }

    /**
     * 时光轴
     * 添加时间点，记录每一个时间点
     * 每个时间点上可以加字、图、语音、视频和文件
     * @return [type] [description]
     */
    public function timeline()
    {
        // $nowTime = Time::tranTime('2018-01-22');
        $nowTime = Time::tranTime(time());
        return '时光轴：'. $nowTime;
        return $this->fetch();
    }
}