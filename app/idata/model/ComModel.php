<?php
namespace app\idata\model;

// use app\admin\model\RouteModel;
use think\Model;
use think\Db;

/**
* 自定义公共模型
*/
class ComModel extends Model
{
    protected $type = [
        'more' => 'array',
        // 'hposition' => 'array',
    ];
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = true;
    // 自动转化
    public function getContentAttr($value)
    {
        return cmf_replace_content_file_url(htmlspecialchars_decode($value));
    }
    public function setContentAttr($value)
    {
        return htmlspecialchars(cmf_replace_content_file_url(htmlspecialchars_decode($value), true));
    }
    // 自动完成
    public function setPublishedTimeAttr($value)
    {
        return strtotime($value);
    }


    // 添加数据
    function insertData($data)
    {
        if (!empty($data['more']['thumbnail'])) {
            $data['more']['thumbnail'] = cmf_asset_relative_url($data['more']['thumbnail']);
        }

        $this->allowField(true)->data($data, true)->isUpdate(false)->save();

        return $this;
    }

    // 编辑数据
    function updateData($data)
    {
        if (!empty($data['more']['thumbnail'])) {
            $data['more']['thumbnail'] = cmf_asset_relative_url($data['more']['thumbnail']);
        }

        $this->allowField(true)->isUpdate(true)->data($data, true)->save();

        return $this;
    }

    // 删除数据
    public function deleteData($data)
    {
        # code...
    }






// 以下是后加的
    /**
     * 后台管理编辑显示页面
     * @param int $id 唯一ID
     * @return $post 获取一条数据
    */
    public function getPost($id)
    {
        $post = $this->get($id);
        // $post = $this->where('id',$id)->find()->toArray();//find()结果集为空时toArray()报错
        // $post = $this->where('id',$id)->select()->toArray();//不会报错

        if (empty($post)) {
            $post = [];
        } else {
            $post = $post->toArray();
        }

        return $post;
    }

    // 处理用户名 user_nickname|user_login|user_email|mobile
    public function getUsername($data=[])
    {
        $username = empty($data['user_nickname']) ? (empty($data['user_login']) ? (empty($data['mobile']) ? $data['user_email'] : $data['mobile']) : $data['user_login']) : $data['user_nickname'];
        return $username;
    }

    // 状态
    public function getStatus($status='',$config='trade_order_status', $type='select', $option='')
    {
        if (is_array($config)) {
            $ufoconfig = $config;
        } elseif (empty(config('?'.$config))) {
            return false;
        }
        $ufoconfig = config($config);
        if ($option===false) {
            return $ufoconfig;
        }

        $options = '';
        if ($type=='select') {
            $status = intval($status);
            $options = (empty($option)) ? '':'<option value="">--'.$option.'--</option>';
            foreach ($ufoconfig as $key => $vo) {
                $options .= '<option value="'.$key.'" '.($status==$key?'selected':'').'>'.$vo.'</option>';
            }
        } elseif ($type=='checkbox') {
            $status = (array)$status;
            foreach ($ufoconfig as $key => $vo) {
                $options .= '<input type="checkbox" name="ids[]" value="'.$key.'" '.(in_array($key,$status)?'checked':'').'> '.$vo.' &nbsp; &nbsp;';
            }
        }

        return $options;
    }
    // 多选

    // 选择框
    public function createOptions($selectId=0, $option='', $data=[])
    {
        if ($option===false) {
            return $data;
        } else {
            $options = (empty($option)) ? '':'<option value="">--'.$option.'--</option>';
            if (is_array($data)) {
                foreach ($data as $v) {
                    $options .= '<option value="'.$v['id'].'" '.($selectId==$v['id']?'selected':'').'>'.$v['name'].'</option>';
                }
            }
            return $options;
        }
    }

    // Excel 处理
    public function excelPort($title='', $head='', $field='*', $where=[], $dir='')
    {
        $dir = CMF_ROOT .'data/excel/'.$dir;//getcwd()使用当前工作空间
        $excel = new Excel($dir);

        if (is_string($field)) {
            $dataTemp = $this->field($field)->where($where)->select()->toArray();
        } else {
            $dataTemp = $field;
        }
        if (empty($dataTemp)) {
            return false;
        }

        foreach ($dataTemp as $key => $row) {
            $data[] = array_values($row);
        }

        $excel->exportExcel($title, $head, $data);
    }

    // 后台 JS 插件获取文件
    public function dealFiles($files=['names'=>[],'urls'=>[]], $pk='')
    {
        $post = [];
        $names = $files['names']; $urls = $files['urls'];
        if (!empty($names) && !empty($urls)) {
            foreach ($urls as $key => $url) {
                $relative_url = cmf_asset_relative_url($url);
                array_push($post, ["url"=>$relative_url, "name"=>$names[$key]]);
            }
        }

        return $post;
    }

    /*
    * 图片上传处理
    * 控制器中使用
        $file_var = ['driving_license','identity_card'];
        $files = model('Service')->uploadPhotos($file_var);
        foreach ($files as $key => $it) {
            if (!empty($it['err'])) {
                $this->error($it['err']);
            }
            $post['more'][$key] = $it['data'];
        }
    */
    public function uploadPhotos($field_var=[], $module='', $valid=[])
    {
        $module     = empty($module) ? request()->module() : $module;
        $valid      = empty($valid) ? ['size' => 1024*1024,'ext' => 'jpg,jpeg,png,gif'] : $valid;
        $move       = '.' . DS . 'upload' . DS . $module . DS;
        // $move       = ROOT_PATH . 'public' . DS . 'upload'. DS .'service'. DS;

        if (is_string($field_var)) {
            return $this->uploadPhotoOne($field_var, $module, $valid, $move);
        } elseif (is_array($field_var)) {
            foreach ($field_var as $fo) {
                $data[$fo] = $this->uploadPhotoOne($fo, $module, $valid, $move);
            }
            return $data;
        }

        return false;
    }

    // 处理一张图片
    public function uploadPhotoOne($field_var, $module, $valid, $move)
    {
        $file = request()->file($field_var);

        // 移动到框架应用根目录/public/uploads/ 目录下
        if (empty($file)) {
            $data['err'] = '文件上传出错，请检查';
        } else {
            $result = $file->validate($valid)->move($move);
            // var_dump($result);
            if ($result) {
                // 成功上传后 获取上传信息
                // 输出 jpg
                // echo $result->getExtension();
                // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
                // echo $result->getSaveName();
                // 输出 42a79759f284b767dfcb2a0197904287.jpg
                // echo $result->getFilename();

                // 处理
                $saveName = str_replace('//', '/', str_replace('\\', '/', $result->getSaveName()));
                $photo    = $module .'/'. $saveName;
                // session('photo_'.$field_var, $photo);
                $data['data'] = $photo;
                $data['err'] = '';
            } else {
                // 上传失败获取错误信息
                $data['data'] = '';
                $data['err'] = $file->getError();
            }

            // json形式
            // if ($result) {
            //     $saveName = str_replace('//', '/', str_replace('\\', '/', $result->getSaveName()));
            //     $photo         = $module .'/'. $saveName;
            //     // session('photo_'.$field_var, $photo);
            //     $data = json_encode([
            //         'code' => 1,
            //         "msg"  => "上传成功",
            //         "data" => ['file' => $photo],
            //         "url"  => ''
            //     ]);
            // } else {
            //     $data = json_encode([
            //         'code' => 0,
            //         "msg"  => $file->getError(),
            //         "data" => "",
            //         "url"  => ''
            //     ]);
            // }
        }

        return $data;
    }

    // 同一字段多图上传
    public function uploadPhotoMulti($field_var, $module, $valid, $move)
    {
        # code...
    }
}