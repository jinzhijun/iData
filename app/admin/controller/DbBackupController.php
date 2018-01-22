<?php
namespace app\admin\controller;

use cmf\controller\AdminBaseController;
use think\Db;
// use think\Model;
// use think\Loader;
use dbbackup\SqlBack;

/**
* 数据库备份还原
*/
class DbBackupController extends AdminBaseController
{
    private $dir = '/backup/';

    public function _initialize()
    {
        parent::_initialize();
        $this->dir = CMF_ROOT .'data'. $this->dir;//
        // $this->dir = getcwd() . $this->dir;// 使用当前工作空间
    }

    /**
     * 数据库管理
     * @adminMenu(
     *     'name'   => '数据库管理',
     *     'parent' => 'admin/DbBackup/default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 30,
     *     'icon'   => '',
     *     'remark' => '数据库管理',
     *     'param'  => ''
     * )
    */
    public function index()
    {
        $list = SqlBack::lists($this->dir);

        $this->assign('list',$list);

        return $this->fetch();
        // $this->display();
    }

    public function test()
    {
        // $this->dir;
        // $config = config('database');
        // $connect = Db::connect($config);
        // $connect =  Db::connect([], true);

        // $dbName =$connect->getConfig('database') . '.';
        // dump($dbName);die;
        
        // $tables = $connect->query("show tables");
        // dump($tables);die;
        // var_dump($tables);die;

        $qb = new SqlBack();
        $result = $qb->backup();
        // $result = $qb->restore();
        dump($result);die;

    }

    /*获取视图信息 借助Db类库*/
    public function schema()
    {
        $connect = Db::connect(config('database'));
        $tables = $connect->getTables();
        $dbName = $connect->getConfig('database') . '.';
        $dir = RUNTIME_PATH . 'schema';
        $dir2 = $dir . DS . $dbName;

        foreach ($tables as $table) {
            $content = '<?php ' . PHP_EOL . 'return ';
            $info    = $connect->getFields($dbName . $table);
            $content .= var_export($info, true) . ';';
            if (!is_dir($dir)) {
                mkdir($dir);
            }
            // echo $dir2 . $table . EXT;die;
            file_put_contents($dir2 . $table . EXT, $content);
        }
    }

    /**
     * 数据库备份 backup
    */
    public function export()
    {
        $qb = new SqlBack();
        $result = $qb->backup();
        if ($result===false) {
            $this->error('数据备份失败！',url('index'));
        }
        $this->success('数据备份成功',url('index'));
    }
    /*备份所选表的数据*/
    public function exportSelect()
    {
        $ids = $this->request->param('ids/a');

        return true;
    }


    /**
     * 数据库还原 restore
    */
    public function import()
    {
        $file = $this->request->param('fname');
        $file = $this->dir . $file;

        if(is_file($file)){
            $qb = new SqlBack();
            $result = $qb->restore($file);
            if ($result===false) {
                $this->error('数据还原失败！',url('index'));
            }
            $this->success('数据还原成功',url('index'));
        } else {
            $this->error('文件不存在！',url('index'));
        }
    }

    /**
     * 删除备份
    */
    public function delete()
    {
        $param = $this->request->param();
        if (empty($param))
            $this->error('请选择备份文件！');

        $file = empty($param['fname'])?'':$param['fname'];
        if (!empty($file)) {
            if (is_file($this->dir . $file)) {
                if (unlink($this->dir . $file)===false) {
                    $this->error('该备份删除失败！');
                }
            } else {
                $this->error('该备份文件不存在！');
            }
        }

        // 批量操作
        $files = isset($param['fnames'])?$param['fnames']:'';
        if (!empty($files)) {
            foreach($files as $file){
                if (is_file($this->dir . $file)) {
                    if(unlink($this->dir . $file)===false){
                        $this->error('删除失败！');
                    }
                } else {
                    $this->error('文件不存在！');
                }
            }
        }

        $this->success('备份已删除');
    }

    public function down()
    {
        $filename = $this->request->param('fname');// usedcar20171030-153923.sql
        ob_start();
        $file = $this->dir . $filename;
        header("Content-type: application/octet-stream");
        header("Accept-Ranges: bytes");
        header("Content-Disposition: attachment; filename={$filename}");
        $size = readfile($file);
        header("Accept-Length:". $size);
        ob_end_flush();
        exit;
    }

}