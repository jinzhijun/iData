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
        $sQuery = Db::name('idata_timeline');
        $field = 'id,year,name,description,line_time,is_star';

        /**
         * 模型解决
         * 
         * group() having()
         * 第一步：按年份分组 ->group()
         * 第二步：查找每年的数据 ->having()
         */
        // $filter = ['status'=>1];
        // $list = $sModel->getLists($filter,'line_time DESC',99);
        // $list = $sModel->field($field)->group('year')->having('id<5')->select()->toArray();
        // $this->assign('list',$list->items());
        // $data->appends($filter);
        // $this->assign('pager',$list->render());

        /**
         * 原生 GROUP BY year WITH rollup
         */
        $list = $sQuery->query("SELECT year,group_concat(id) AS id,group_concat(name) AS name,group_concat(description) AS description,group_concat(line_time) AS line_time,group_concat(is_star) AS is_star FROM `cmf_idata_timeline` WHERE `status`=1 GROUP BY `year` ORDER BY `line_time` DESC");
        // dump($list);die;



        $this->assign('list',$list);

        return $this->fetch();
    }

    public function addTimeline()
    {
        return '新增 - 待开发';
        return $this->fetch();
    }
    public function addTimelinePost()
    {
        $smodel = new IdataTimelineModel();
        $post = $this->op();
        $post['create_time'] = time();

        $smodel->insertData($post);

        $this->success('提交成功',url('AdminF511/editTimeline',['id'=>$smodel->id]));
    }

    public function editTimeline()
    {
        return '编辑 - 待开发';
        $id = $this->request->param('id',0,'intval');
        
        $smodel = new IdataTimelineModel();
        $post = $smodel->getPost($id);

        $this->assign('post',$post);
        return $this->fetch();
    }
    public function editTimelinePost()
    {
        $smodel = new IdataTimelineModel();
        $post = $this->op();
        $post['update_time'] = time();
        $post['modtimes'] = $post['modtimes']+1;

        $smodel->updateData($post);

        $this->success('编辑成功');
    }
    public function op()
    {
        $data = $this->request->param();
        $post = $data['post'];

        $smodel = new IdataTimelineModel();
        if (!empty($data['photo'])) {
            $post['more']['photos'] = $smodel->dealFiles($data['photo']);
        }
        if (!empty($data['file'])) {
            $post['more']['files'] = $smodel->dealFiles($data['file']);
        }

        $post['year'] = empty($post['line_time']) ? '0' : gmdate('Y',strtotime($post['line_time']));
        $post['access_type'] = empty($post['access_type']) ? $smodel->getAccessType() : $post['access_type'];
        $post['ip'] = empty($post['ip']) ? get_client_ip() : $post['ip'];

        return $post;
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

    public function more()
    {
        // 模拟数据
        $list2 = [
            [
                'year' => 2018,
                'data' => [
                    [
                        'is_star'=>1,
                        'line_time'=>strtotime('2018-01-23'),
                        'name'=>'标题：1',
                        'description'=>'描述：'
                    ],
                    [
                        'is_star'=>0,
                        'line_time'=>strtotime('2018-01-22'),
                        'name'=>'标题：2',
                        'description'=>'描述：不许乱摸！'
                    ],
                    [
                        'is_star'=>1,
                        'line_time'=>strtotime('2018-01-03'),
                        'name'=>'标题：3',
                        'description'=>'描述：电影很好看。'
                    ],
                    [
                        'is_star'=>0,
                        'line_time'=>strtotime('2018-01-01'),
                        'name'=>'标题：元旦快乐！',
                        'description'=>'描述：元旦快乐！'
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
    }
}