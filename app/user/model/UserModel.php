<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Powerless < wzxaini9@gmail.com>
// +----------------------------------------------------------------------
namespace app\user\model;

use think\Db;
use think\Model;

class UserModel extends Model
{
/*登录模型*/
    public function doMobile($user)
    {
        return $this->doCommon($user);
    }
    public function doName($user)
    {
        return $this->doCommon($user,'user_login');
    }
    public function doEmail($user)
    {
        return $this->doCommon($user,'user_email');
    }
    /**
     * 登录公共
    */
    public function doCommon($user,$regSign='mobile')
    {
        $userQuery = Db::name("user");
        $result = $userQuery->where($regSign, $user[$regSign])->find();
        if (!empty($result)) {
            $comparePasswordResult = cmf_compare_password($user['user_pass'], $result['user_pass']);
            $hookParam = [
                'user' => $user,
                'compare_password_result' => $comparePasswordResult
            ];
            hook_one("user_login_start",$hookParam);
            if ($comparePasswordResult) {
                //拉黑判断。
                if($result['user_status']==0){
                    return 3;
                }
                session('user', $result);
                $data = [
                    'last_login_time' => time(),
                    'last_login_ip'   => get_client_ip(0, true),
                ];
                $userQuery->where('id', $result["id"])->update($data);
                return 0;
            }
            return 1;
        }
        $hookParam =[
            'user' => $user,
            'compare_password_result' => false
        ];
        hook_one("user_login_start",$hookParam);
        return 2;
    }

/*注册模型*/
    public function registerMobile($user)
    {
        return $this->registerCommon($user);
    }
    public function registerName($user)
    {
        return $this->registerCommon($user,'user_login');
    }
    public function registerEmail($user)
    {
        return $this->registerCommon($user,'user_email');
    }
    /**
     * 注册公共
    */
    public function registerCommon($user,$regSign='mobile')
    {
        $userQuery = Db::name("user");
        $result    = $userQuery->where($regSign, $user[$regSign])->find();
        // $result    = $userQuery->where($regSign, $user[$regSign])->value($regSign);

        $userStatus = 1;
        if (cmf_is_open_registration()) {
            $userStatus = 2;
        }

        if (empty($result)) {
            // 过滤
            $data = [
                $regSign        => $user[$regSign],
                'user_nickname' => '',
                'user_pass'     => cmf_password($user['user_pass']),
                'last_login_ip' => get_client_ip(0, true),
                'create_time'   => time(),
                'last_login_time' => time(),
                'user_status'   => $userStatus,
                'user_type' => 2,//会员
            ];
            $userId = $userQuery->insertGetId($data);
            $data   = $userQuery->where('id', $userId)->find();
            cmf_update_current_user($data);
            return 0;
        }
        return 1;
    }

/*重置密码模型*/
    /**
     * 通过手机重置密码
     * @param $mobile
     * @param $password
     * @return int
     */
    public function mobilePasswordReset($mobile, $password)
    {
        return $this->pwdResetCommon($mobile,$password);
    }
    /**
     * 通过邮箱重置密码
     * @param $email
     * @param $password
     * @return int
     */
    public function emailPasswordReset($email, $password)
    {
        return $this->pwdResetCommon($email,$password,'user_email');
    }
    /*重置密码公共*/
    public function pwdResetCommon($kf, $pwd, $sign='mobile')
    {
        $result = $this->where($sign, $kf)->find();
        if (!empty($result)) {
            $data = [
                'user_pass' => cmf_password($pwd),
            ];
            $this->where($sign, $kf)->update($data);
            return 0;
        }
        return 1;
    }

    public function editData($user)
    {
        $userId           = cmf_get_current_user_id();
        // 锁定字段，避免非法操作
        $data['user_nickname'] = $user['user_nickname'];
        $data['sex'] = $user['sex'];
        $data['birthday'] = strtotime($user['birthday']);
        $data['user_url'] = $user['user_url'];
        $data['signature'] = $user['signature'];
        // 数据库操作
        $userQuery = Db::name("user");
        if ($userQuery->where('id', $userId)->update($data)) {
            $userInfo = $userQuery->where('id', $userId)->find();
            cmf_update_current_user($userInfo);
            return 1;
        }
        return 0;
    }

    /**
     * 用户密码修改
     * @param $user
     * @return int
     */
    public function editPassword($user)
    {
        $userId    = cmf_get_current_user_id();
        $userQuery = Db::name("user");
        if ($user['password'] != $user['repassword']) {
            return 1;
        }
        $pass = $userQuery->where('id', $userId)->find();
        if (!cmf_compare_password($user['old_password'], $pass['user_pass'])) {
            return 2;
        }
        $data['user_pass'] = cmf_password($user['password']);
        $userQuery->where('id', $userId)->update($data);
        return 0;
    }

    /**
     * 绑定用户手机号
     */
    public function bindingMobile($user)
    {
        $userId      = cmf_get_current_user_id();
        $data ['mobile'] = $user['username'];
        Db::name("user")->where('id', $userId)->update($data);
        $userInfo = Db::name("user")->where('id', $userId)->find();
        cmf_update_current_user($userInfo);
        return 0;
    }

    /**
     * 绑定用户邮箱
     */
    public function bindingEmail($user)
    {
        $userId     = cmf_get_current_user_id();
        $data ['user_email'] = $user['username'];
        Db::name("user")->where('id', $userId)->update($data);
        $userInfo = Db::name("user")->where('id', $userId)->find();
        cmf_update_current_user($userInfo);
        return 0;
    }

    public function comments()
    {
        $userId               = cmf_get_current_user_id();
        $userQuery            = Db::name("Comment");
        $where['user_id']     = $userId;
        $where['delete_time'] = 0;
        $favorites            = $userQuery->where($where)->order('id desc')->paginate(10);
        $data['page']         = $favorites->render();
        $data['lists']        = $favorites->items();
        return $data;
    }

    public function deleteComment($id)
    {
        $userId              = cmf_get_current_user_id();
        $userQuery           = Db::name("Comment");
        $where['id']         = $id;
        $where['user_id']    = $userId;
        $data['delete_time'] = time();
        $userQuery->where($where)->update($data);
        return $data;
    }
}