<?php
namespace dbbackup;
use think\Db;
/**
 * 数据库备份与还原
 *
*/
class SqlBack
{
    private $header = 'Lothar';
    private $end = '';// 结束符: -- end_flag
    private $eol = PHP_EOL;

    function __construct()
    {
        header("content-type:text/html;charset=utf-8");
        //设置超时时间为0，表示一直执行。当php在safe mode模式下无效，此时可能会导致导入超时，此时需要分段导入
        set_time_limit(0);//无时间限制
        @ob_end_flush();

        $this->set = config('database');
        // var_dump($set['hostname']);die;
        $this->time = date('Y-m-d H:i:s');
    }

    // 获取列表
    public static function lists($dir='../data/')
    {
        // is_dir($dir)?'':mkdir($dir);
        $files = scandir($dir);
        $list = [];
        foreach($files as $v){
            if(is_file($dir.$v) && substr($v,strrpos($v,'.')) == '.sql'){
                $list[] = $v;
            }
        }
        rsort($list);
        return $list;
    }

    /**
     * 备份数据库
    */
    public function backup($dir='../data/backup/', $tables=[])
    {
        // return getcwd();
        // 初始化
        $this->header = 
<<<EOT
/*
Lothar MySQL Data Transfer

Source Server         : {$this->set['hostname']}
Source Server Version : 50540
Source Host           : localhost:{$this->set['hostport']}
Source Database       : {$this->set['database']}

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: {$this->time}
*/
EOT;
        $end_flag = ';'. $this->eol . $this->end . $this->eol;
        $sqldump = $this->header . $end_flag .'SET FOREIGN_KEY_CHECKS=0'. $end_flag;
        $connect = Db::connect($this->set);
        $dbName = $connect->getConfig('database');
        $tableAll = $connect->getTables();
        if (empty($tables)) {
            $tables = $tableAll;
        }
        $tablesCount = count($tables);
        $tableAllCount = count($tableAll);
        // return $sqldump;

        // 生成备份内容
        foreach ($tables as $table) {
            $sqldump .= 'DROP TABLE IF EXISTS `'. $table . $end_flag;
            $sqldump .= $this->getTableStructure($table)['Create Table'] . $end_flag;
            $datas = $this->getTableData($table);
            if (!empty($datas)) {
                $keys = $this->getIntoFields($datas);
                $vals = $this->getIntoFieldsVal($datas,'long');
                // $sqldump .= "INSERT INTO `{$table}` ({$keys}) VALUES {$vals}". $end_flag;
                // 缺省模式
                $sqldump .= "INSERT INTO `{$table}` VALUES {$vals}". $end_flag;
            }
        }
// return $sqldump;
        $file = '';
        if ($tablesCount==1) {
            $file = $dir . $table . date('YmdHis') .'.sql';
        } elseif ($tablesCount < $tableAllCount) {
            $file = $dir . $dbName .'（'.$tablesCount.'）'. date('YmdHis') .'.sql';
        } else {
            $file = $dir . $dbName . date('YmdHis') .'.sql';
        }
// return $file;
        // file_put_contents($file, '123');
        file_put_contents($file, $sqldump);
        // $fp = fopen($file,'wb');
        // if(!$fp){
        //     return false;
        // }
        // fputs($fp,$sql);
        // fclose($fp);

        return true;
    }

    //数据库还原
    public function restore($fname='')
    {
        if (is_file($fname)) {
            $end_flag = ';'. $this->eol . $this->end . $this->eol;
            $sqldump = file_get_contents($fname);
            $query = explode($end_flag, $sqldump);
            $total = count($query)-1;

            // 锁定数据库，以免备份或导入时出错
            // 实际运行会报错：SQLSTATE[HY000]: General error: 2014 Cannot execute queries while other unbuffered queries are active.
            // Db::query('lock tables '. $this->set['database'] .' WRITE');
            // $i=1 第一个下标为0，是注释需要过滤掉
            for ($i=1; $i < $total; $i++) { 
                // $result = Db::query($query[$i]);
                $result = Db::execute($query[$i]);
                if ($result === false) {
                    return false;
                }
            }
            // Db::query('unlock tables');
            return true;
        } else {
            return false;
        }
    }



    // 获取所有表
    public function getTables($dbName='')
    {
        // $mQuery = new mysqli($this->set['hostname'], $this->set['username'], $this->set['password'], $this->set['database'], $this->set['hostport']);
        // mysqli_set_charset($mQuery, $this->set['charset']);
        // $result = $mQuery->query('SELECT * from `cmf_user`');
        // $tables = $result->fetch_assoc();
        // $tables = $result->fetch_array();
        // $tables = $result->fetch_all(MYSQLI_BOTH);
        // return $tables;

        $mQuery = Db::connect($this->set);
        $tables = $mQuery->query("show tables");// 二维数据
        $newtables = [];
        foreach ($tables as $row) {
            $table = $row['Tables_in_'.$this->set['database']];
            $newtables[] = $table;
        }
        return $newtables;
    }
    // 获取表结构
    public function getTableStructure($table='cmf_nav')
    {
        $mQuery = Db::connect($this->set,true);
        $creatTable = $mQuery->query("show create table $table");// 二维数据

        return $creatTable[0];
    }
    // 获取表数据
    public function getTableData($table='cmf_nav')
    {
        $mQuery = Db::connect($this->set,true);
        $result = $mQuery->query("select * from $table");

        // $result = Db::table($table)->select()->toArray();

        return $result;
    }
    // 获取插入字段
    public function getIntoFields($data=[], $option='string')
    {
        $keys = array_keys($data[0]);
        if ($option == 'array') {
            return $keys;
        }
        $keys = array_map('addslashes',$keys);// 为了清除`的影响
        // $keys = implode('`,`',$keys);
        $keys = '`'. join('`,`',$keys) .'`';
        return $keys;
    }
    // 获取插入值
    public function getIntoFieldsVal($data=[], $option='string')
    {
        $vals = '';
        if ($option == 'array') {
            foreach ($data as $value) {
                $vals[] = array_values($value);
            }
        } elseif ($option == 'long') {
            foreach ($data as $value) {
                $var = array_values($value);
                $var = array_map('addslashes',$var);
                $vals .= ",('". join("','",$var) ."')";
            }
            $vals = substr($vals, 1);
        } else {
            foreach ($data as $value) {
                $var = array_values($value);
                $var = array_map('addslashes',$var);
                $vals = "('". join("','",$var) ."')";
            }
        }
        return $vals;
    }
}