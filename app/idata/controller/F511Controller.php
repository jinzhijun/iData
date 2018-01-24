<?php
namespace app\idata\controller;

use cmf\controller\HomeBaseController;
use app\idata\model\IdataTimelineModel;
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

        $sModel = new IdataTimelineModel();

        // group() having()
        // 第一步：按年份分组
        // 第二步：查找每年的数据
        // $list = $sModel->group()->having()->select();




        // $filter = ['status'=>1];
        // $list = $sModel->getLists($filter,'line_time DESC',99);

        // $this->assign('list',$list->items());
        // $data->appends($filter);
        // $this->assign('pager',$list->render());



        // 模拟数据
        $list = [
            [
                'year' => 2018,
                'data' => [
                    [
                        'is_star'=>1,
                        'line_time'=>strtotime('2018-01-23'),
                        'name'=>'标题：',
                        'description'=>'描述：一开始压根就没想过找对象，但想过以后要找一个什么样的对象。<br>不论从前，只谈现在：与我而言，你是特别的唯一的也是世间独一无二的。'
                    ],
                    [
                        'is_star'=>0,
                        'line_time'=>strtotime('2018-01-22'),
                        'name'=>'标题：头发的故事',
                        'description'=>'描述：不许乱摸！'
                    ],
                    [
                        'is_star'=>1,
                        'line_time'=>strtotime('2018-01-03'),
                        'name'=>'标题：新的开始',
                        'description'=>'描述：电影很好看。'
                    ],
                    [
                        'is_star'=>0,
                        'line_time'=>strtotime('2018-01-01'),
                        'name'=>'标题：元旦快乐！',
                        'description'=>'描述：'
                    ],
                ],
            ],
            [
                'year' => 2017,
                'data' => [
                    [
                        'is_star'=>0,
                        'line_time'=>strtotime('2017-05-30'),
                        'name'=>'标题：初遇',
                        'description'=>'描述：'
                    ],
                ],
            ],
            [
                'year' => 2016,
                'data' => [
                    [
                        'is_star'=>0,
                        'line_time'=>strtotime('2016-12-31'),
                        'name'=>'标题：16年最后一天',
                        'description'=>'描述：'
                    ],
                ],
            ],
        ];
        $this->assign('list',$list);




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