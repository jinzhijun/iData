<?php
/**
* @author xialei <xialeistudio@gmail.com>
*/
class Map
{
  private static $_instance;

  const REQ_GET = 1;
  const REQ_POST = 2;

  /**
  * 单例模式
  * @return map
  */
  public static function instance()
  {
    if (!self::$_instance instanceof self)
    {
      self::$_instance = new self;
    }
    return self::$_instance;
  }

  /**
  * 执行CURL请求
  * @author: xialei<xialeistudio@gmail.com>
  * @param $url
  * @param array $params
  * @param bool $encode
  * @param int $method
  * @return mixed
  */
  private function async($url, $params = array(), $encode = true, $method = self::REQ_GET)
  {
    $ch = curl_init();
    if ($method == self::REQ_GET)
    {
      $url = $url . '?' . http_build_query($params);
      $url = $encode ? $url : urldecode($url);
      curl_setopt($ch, CURLOPT_URL, $url);
    }
    else
    {
      curl_setopt($ch, CURLOPT_URL, $url);
      curl_setopt($ch, CURLOPT_POST, true);
      curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
    }
    curl_setopt($ch, CURLOPT_REFERER, '百度地图referer');
    curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X; en-us) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53');
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    $resp = curl_exec($ch);
    curl_close($ch);
    return $resp;
  }

  /**
  * 获取客户端ip地址
  * 注意:如果你想要把ip记录到服务器上,请在写库时先检查一下ip的数据是否安全.
  */
  public function getIP() {
    if (getenv('HTTP_CLIENT_IP')) {
      $ip = getenv('HTTP_CLIENT_IP'); 
    }
    elseif (getenv('HTTP_X_FORWARDED_FOR')) { //获取客户端用代理服务器访问时的真实ip地址
      $ip = getenv('HTTP_X_FORWARDED_FOR');
    }
    elseif (getenv('HTTP_X_FORWARDED')) { 
      $ip = getenv('HTTP_X_FORWARDED');
    }
    elseif (getenv('HTTP_FORWARDED_FOR')) {
      $ip = getenv('HTTP_FORWARDED_FOR'); 
    }
    elseif (getenv('HTTP_FORWARDED')) {
      $ip = getenv('HTTP_FORWARDED');
    }
    else { 
      $ip = $_SERVER['REMOTE_ADDR'];
    }
    return $ip;
  }

  /**
  * ip定位
  * http://developer.baidu.com/map/geosdk-symbian-class.htm
  * @param string $ip
  * @return array
  * @throws Exception
  */
  public function locationByIP($ip)
  {
    try{
      //检查是否合法IP
      if ($ip=='127.0.0.1') {
        throw new Exception('本地IP不能定位');
      }
      if (!filter_var($ip, FILTER_VALIDATE_IP)) {
        throw new Exception('IP地址不合法');
      } else {
        $params = array(
          'ak' => 'q0tCNzPLy9QBTxWPhCLb6zmUwa8OBF7W',// 百度地图API KEY
          'ip' => $ip,
          'coor' => 'bd09ll' //百度地图GPS坐标。bd09ll 坐标为经纬度球面坐标;bd09 坐标为墨卡托平面坐标;gcj02 坐标为经纬度球面坐标 
        );
        $api = 'http://api.map.baidu.com/location/ip';
        $resp = $this->async($api, $params);
        $data = json_decode($resp, true);
      }

      //check forms filled in
      if($data['status'] != 0){
        //有错误
        // return 0;
        throw new Exception($data['message']);
      } else {
        //返回地址信息
        return array(
          'address' => $data['content']['address'],
          'province' => $data['content']['address_detail']['province'],
          'city' => $data['content']['address_detail']['city'],
          'district' => $data['content']['address_detail']['district'],
          'street' => $data['content']['address_detail']['street'],
          'street_number' => $data['content']['address_detail']['street_number'],
          'city_code' => $data['content']['address_detail']['city_code'],
          'lng' => $data['content']['point']['x'],
          'lat' => $data['content']['point']['y']
        );
      }
    } catch(Exception $e){
      return $e->getMessage(); //输出异常信息。
    }
  }

  /**
  * GPS定位
  * @param $lng
  * @param $lat
  * @return array
  * @throws Exception
  */
  public function locationByGPS($lng, $lat)
  {
    $params = array(
      'coordtype' => 'wgs84ll',
      'location' => $lat . ',' . $lng,
      'ak' => 'q0tCNzPLy9QBTxWPhCLb6zmUwa8OBF7W',//百度地图API KEY
      'output' => 'json',
      'pois' => 0
    );
    $resp = $this->async('http://api.map.baidu.com/geocoder/v2/', $params, false);
    $data = json_decode($resp, true);
    if ($data['status'] != 0)
    {
      throw new Exception($data['message']);
    }
    return array(
      'address' => $data['result']['formatted_address'],
      'province' => $data['result']['addressComponent']['province'],
      'city' => $data['result']['addressComponent']['city'],
      'street' => $data['result']['addressComponent']['street'],
      'street_number' => $data['result']['addressComponent']['street_number'],
      'city_code'=>$data['result']['cityCode'],
      'lng'=>$data['result']['location']['lng'],
      'lat'=>$data['result']['location']['lat']
    );
  }

}

?>
