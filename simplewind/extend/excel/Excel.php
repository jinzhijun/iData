<?php
namespace excel;

use PHPExcel;
use PHPExcel_IOFactory;
// use simplewind\vendor\phpoffice\phpexcel\Classes\PHPExcel\Writer\Excel5;
use PHPExcel_Writer_Excel5;

/**
* Excel 导入导出
*/
class Excel
{
    private $dir;

    function __construct($dir)
    {
        $this->dir = $dir;
    }

    /**
     * +----------------------------------------------------------
     * 导出资料 Copyright (c) 2006 - 2014 PHPExcel, version ##VERSION##, ##DATE##
     * +----------------------------------------------------------
     * @param $expTitle 名称
     * @param $expCellName 参数
     * @param $expTableData 内容
     * @throws \PHPExcel_Exception
     * @throws \PHPExcel_Reader_Exception
     * +----------------------------------------------------------
    */
    public function exportExcel($expTitle='', $expCellName=[], $expTableData=[])
    {
        // 预设
        $xlsTitle = $this->transcoding($expTitle);//文件名称
        $fileName = $xlsTitle .'_'. date('YmdHis').'.xls';//or $xlsTitle 文件名称可根据自己情况设定
        $cellNum = count($expCellName);
        $dataNum = count($expTableData);

        $objPHPExcel = new PHPExcel();
        // $objPHPExcel->setActiveSheetIndex(0);
        // $objActSheet = $objPHPExcel->getActiveSheet();

        // 设置单元格宽度, 如何自动列宽？
        // $objPHPExcel->getActiveSheet()->getColumnDimension()->setAutoSize(true);
        $prepare = [24,12,12,12,15,15,20];
        foreach ($prepare as $key => $var) {
            $objPHPExcel->getActiveSheet()->getColumnDimension($this->n_to_l($key))->setWidth($var);
        }

        // 设置表格标题文字
        // $objPHPExcel->getActiveSheet(0)->mergeCells( 'A1:'. $this->n_to_l($cellNum-1) .'1' );//合并单元格，表格标题文字显示区域
        // $objPHPExcel->setActiveSheetIndex(0)->setCellValue('A1', $expTitle .' Export time:'.date('Y-m-d H:i:s'));

        // 设置表格标题栏内容, 有表格标题时 $this->n_to_l($i).'2'
        for($i=0;$i<$cellNum;$i++){
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue( $this->n_to_l($i).'1', $expCellName[$i] );
        }

        // 生成列表, Miscellaneous glyphs, UTF-8, 有表格标题时($i+3)
        for($i=0;$i<$dataNum;$i++){
            for($j=0;$j<$cellNum;$j++){
                $objPHPExcel->getActiveSheet(0)->setCellValue( $this->n_to_l($j).($i+2), $expTableData[$i][$j] );
            }
        }

        // 渲染生成文件
        // $this->saveFile($fileName,$objPHPExcel,'servers');//存到服务器
        $this->saveFile($fileName,$objPHPExcel);// 直接浏览器
    }

    /**
     * +----------------------------------------------------------
     * 导出资料 Copyright (c) 2006 - 2011 PHPExcel, version 1.7.6
     * +----------------------------------------------------------
     * @param $title 名称
     * @param $head 数据表头单元格 th
     * @param $data 数据标准单元格 td
     * +----------------------------------------------------------
    */
    public function exportExcel2($title='', $head=[], $data=[])
    {
        $xlsTitle = $this->transcoding($title);//文件名称
        $fileName = $xlsTitle . '_LIST_' . date('YmdHis') .'.xls';//or $xlsTitle 文件名称可根据自己情况设定
        $cellNum = count($head);

        // vendor('phpoffice/phpexcel/Classes/PHPExcel.php');
        // $objExcel = new \PHPExcel();
        // 创建一个处理对象实例
        $objExcel = new PHPExcel();
        // echo $objExcel->getID();

        //*************************************
        //设置当前的sheet索引，用于后续的内容操作。
        //一般只有在使用多个sheet的时候才需要显示调用。
        //缺省情况下，PHPExcel会自动创建第一个sheet被设置SheetIndex=0
        $objExcel->setActiveSheetIndex(0);
        $objActSheet = $objExcel->getActiveSheet();

        // 设置单元格宽度
        // $objActSheet->getColumnDimension()->setAutoSize(true);
        $prepare = [24,12,12,12,15,15,20];
        foreach ($prepare as $key => $var) {
            $objActSheet->getColumnDimension($this->n_to_l($key))->setWidth($var);
        }
        $objActSheet->getColumnDimension('A')->setWidth(24);
        $objActSheet->getColumnDimension('B')->setWidth(12);
        $objActSheet->getColumnDimension('C')->setWidth(12);
        $objActSheet->getColumnDimension('D')->setWidth(12);
        $objActSheet->getColumnDimension('E')->setWidth(15);
        $objActSheet->getColumnDimension('F')->setWidth(15);
        $objActSheet->getColumnDimension('G')->setWidth(20);

        $mergeNum = $cellNum>8 ? $cellNum : 8;
        // 设置表格标题文字
        $objActSheet->mergeCells('A1:' . $this->n_to_l($mergeNum-1).'1');// 合并单元格，表格标题文字显示区域
        $objActSheet->setCellValue('A1', $title);

        // 设置表格标题栏内容
        foreach ($head as $k => $value) {
            // $objActSheet->getColumnDimension($this->n_to_l($k))->setWidth(strlen($value));// 无法统计最长的
            $objActSheet->setCellValue($this->n_to_l($k) .'2', $value);
        }

        // 生成列表
        foreach ($data as $index => $row) {
            foreach ($row as $k => $value) {
                $objActSheet->setCellValue( $this->n_to_l($k).($index+3), $value );
            }
        }

        // 渲染生成文件
        // $this->saveFile($fileName,$objExcel,'servers');//存到服务器
        $this->saveFile($fileName,$objExcel);// 直接浏览器
    }

    /**
     * +----------------------------------------------------------
     * 导入资料
     * +----------------------------------------------------------
     * @param $file 文件
     * @throws \PHPExcel_Exception
     * @throws \PHPExcel_Reader_Exception
     * +----------------------------------------------------------
    */
    public function importExcel($file='')
    {
        # code...
    }

    public function saveFile($fileName='', $objExcel, $type='output')
    {
        // 创建文件格式写入对象实例, uncomment
        $objWriter = new PHPExcel_Writer_Excel5($objExcel);
        // 创建文件格式写入对象实例, uncomment
        // vendor('phpoffice/phpexcel/Classes/PHPExcel/Writer/Excel5');
        // $objWriter = new \PHPExcel_Writer_Excel5($objExcel);

        if ($type=='servers') {
            // 以后可以从目录读文件
            $this->createDir($this->dir);
            // 保存为一个文件到服务器
            $objWriter->save($this->dir .'/'. $fileName);
            // @unlink($this->dir . $fileName);
        } else {
            // 文件直接输出到浏览器
            header ( 'Pragma:public');
            header ( 'Expires:0');
            header ( 'Cache-Control:must-revalidate,post-check=0,pre-check=0');
            header ( 'Content-Type:application/force-download');
            header ( 'Content-Type:application/vnd.ms-excel');
            // header('Content-type:application/vnd.ms-excel;charset=utf-8;name="'.$xlsTitle.'.xls"');
            header ( 'Content-Type:application/octet-stream');
            header ( 'Content-Type:application/download');
            header ( 'Content-Disposition:attachment;filename='. $fileName);//attachment新窗口打印inline本窗口打印
            header ( 'Content-Transfer-Encoding:binary');
            $objWriter->save('php://output');

            // 2014
            // header('pragma:public');
            // header('Content-type:application/vnd.ms-excel;charset=utf-8;name="'.$xlsTitle.'.xls"');
            // header("Content-Disposition:attachment;filename=$fileName");//attachment新窗口打印inline本窗口打印
            // $objWriter = PHPExcel_IOFactory::createWriter($objExcel, 'Excel5');//Excel5为xls格式，excel2007为xlsx格式
            // $objWriter->save('php://output');
            exit;
        }
    }

    // 列
    function n_to_l($number) {
        $letter = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $box = str_split($letter);
        return $box[$number];
    }

    // 转码
    public function transcoding($string='',$code='')
    {
        $string = iconv('utf-8', 'gb2312', $string);

        return $string;
    }

    // 创建目录
    public function createDir($dir='')
    {
        $arr = explode('/',$dir);
        $first = $arr[0];
        unset($arr[0]);

        foreach ($arr as $ds) {
            if ($ds!='..' && !is_dir($first.'/'.$ds)) {
                mkdir($first.'/'.$ds,777);
            }
            $first = $first.'/'.$ds;
        }
    }



}