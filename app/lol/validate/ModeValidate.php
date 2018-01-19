<?php
namespace app\lol\validate;

use think\Validate;

class ModeValidate extends Validate
{
    protected $rule = [
        'categories' => 'require',
        'post_title' => 'require',
    ];
    protected $message = [
        'categories.require' => '请指定文章分类！',
        'post_title.require' => '文章标题不能为空！',
    ];

    protected $scene = [
//        'add'  => ['user_login,user_pass,user_email'],
//        'edit' => ['user_login,user_email'],
    ];
}