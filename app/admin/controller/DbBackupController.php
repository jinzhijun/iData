<?php
namespace app\admin\controller;

use cmf\controller\AdminBaseController;
use think\Db;
use think\Model;
use think\Loader;
// use dbbackup\SqlBack;

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

        // $dname = config('database.database');
        // $prefix = config("database.prefix");

        // import('dbbackup'.DS.'SqlBack');
        import('dbbackup/SqlBack',EXTEND_PATH);
        // Loader::import('SqlBack',EXTEND_PATH);
        $this->sqlback = new \SqlBack(config('database.hostname'), config('database.username'), config('database.password'), config('database.database'), config('database.hostport'), config('database.charset'), $this->dir);
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
        $list = $this->sqlback->lists($this->dir);

        $this->assign('list',$list);

        return $this->fetch();
        // $this->display();
    }

    /**
     * 数据库备份 backup
     * @adminMenu(
     *     'name'   => '数据库备份',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '数据库备份',
     *     'param'  => ''
     * )
     */
    public function export()
    {
        //设置超时时间为0，表示一直执行。当php在safe mode模式下无效，此时可能会导致导入超时，此时需要分段导入
        set_time_limit(0);

        // $result = true;
        $result = $this->sqlback->backup();
        if ($result===false) {
            $this->error('数据备份失败！',url('DbBackup/index'));
        }
        $this->success('数据备份成功',url('DbBackup/index'));
    }

    /**
     * 数据库还原 restore
     * @adminMenu(
     *     'name'   => '数据库还原',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '数据库还原',
     *     'param'  => ''
     * )
     */
    public function import()
    {
        set_time_limit(0);
        $file = $this->request->param('fname');
        $file = $this->dir . $file;

        if(is_file($file)){
            $result = $this->sqlback->restore($file);
            if ($result===false) {
                $this->error('数据备份失败！',url('DbBackup/index'));
            }
            $this->success('数据备份成功',url('DbBackup/index'));
        } else {
            $this->error('文件不存在！',url('DbBackup/index'));
        }
    }

    /**
     * 删除备份
     * @adminMenu(
     *     'name'   => '删除备份',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除备份',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $param = $this->request->param();
        if (empty($param))
            $this->error('请选择备份文件！');

        $file = empty($param['fname'])?'':$param['fname'];
        if ($file) {
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
        if ($files) {
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
    }

}