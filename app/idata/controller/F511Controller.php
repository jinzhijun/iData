<?php
namespace app\idata\controller;

use cmf\controller\HomeBaseController;
use think\Db;

/**
* f511
*/
class F511Controller extends HomeBaseController
{
    public function index()
    {
        return $this->fetch();
    }

    /**
     * 时光轴
     * 添加时间点，记录每一个时间点
     * 每个时间点上可以加字、图、语音、视频和文件
     * http://www.php.cn/js-tutorial-382076.html
     * @return [type] [description]
     */
    public function timeline()
    {
        // $nowTime = Time::tranTime('2018-01-22');
        // $nowTime = Time::tranTime(time());
        // return '时光轴：'. $nowTime;

        return $this->fetch();
    }

    // html5唯美爱情表白动画网页代码
    public function renxi()
    {
        return $this->fetch();
    }

    // 表白特效
    public function express()
    {
        return $this->fetch();
    }
}