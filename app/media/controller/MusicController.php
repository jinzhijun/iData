<?php
namespace app\media\controller;

use cmf\controller\HomeBaseController;
use think\Db;

/**
* 我的媒体中心
* 音乐
*/
class MusicController extends HomeBaseController
{
    public function index()
    {
        return $this->fetch();
    }

    // 
    public function test()
    {
        return $this->fetch();
    }


    /*播放器*/
    public function mk()
    {
        return $this->fetch();
    }

    // xuanwu玄武
    public function xuanwu()
    {
        return $this->fetch();
    }
    public function ckplayer()
    {
        return $this->fetch();
    }

    // 网易 music.163.com
    public function netEase()
    {
        return $this->fetch();
    }
}