<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>首页</title>
	<style type="text/css">
	t{}
	nav a{margin: 10px;}
	</style>
	<base href="http://www.w3school.com.cn/i/" />
	<base target="_blank" />
</head>

<body>
<header>
<h1>Welcome to my homepage</h1>
<p>My name is Donald Duck</p>
</header>

<p>Do not forget to buy <mark>milk</mark> today.</p>
<progress value="22" max="100"></progress>
<br>

<ruby>
漢 <rt><rp>(</rp>ㄏㄢˋ<rp>)</rp></rt>
</ruby>
<br>

<img src="shanghai_lupu_bridge.jpg" border="0" usemap="#planetmap" alt="Planets" />
<map name="planetmap" id="planetmap">
  <area shape="circle" coords="180,139,14" href ="venus.html" alt="Venus" />
  <area shape="circle" coords="129,161,10" href ="mercur.html" alt="Mercury" />
  <area shape="rect" coords="0,0,110,260" href ="sun.html" alt="Sun" />
</map>
<br>

<audio controls>
   <source src="horse.ogg" type="audio/ogg">
   <source src="horse.mp3" type="audio/mpeg">
 Your browser does not support the audio element.
</audio> 
<br>

<details>
<summary>HTML 5</summary>
This document teaches you everything you have to learn about HTML 5.
</details>
<br>
<p>我们在每天早上 <time>9:00</time> 开始营业。</p>
<p>我在 <time datetime="2008-02-14">情人节</time> 有个约会。</p>
<br>

<center><bdo dir="ltr">首页</bdo><bdo dir="rtl">首页</bdo></center>

<nav>
	<a target="_blank" tabindex="1" title="首页" href="index.php">Home</a>
	<a target="_blank" tabindex="2" title="成员风采" href="user.php">User</a>
	<a target="_blank" tabindex="3" title="精彩比赛" href="match.php">Match</a>
	<a target="_blank" tabindex="4" title="官方数据" href="http://lol.qq.com/">Office</a>
	<a target="_blank" tabindex="5" title="游戏资料" href="http://lol.qq.com/web201310/info-heros.shtml">Game_infos</a>
	<a target="_blank" tabindex="6" title="赛事中心" href="http://lol.qq.com/match/">Match_Center</a>
	<a target="_blank" tabindex="7" title="数据分析" href="http://lol.qq.com/match/">Data_Analysis</a>
</nav>

<div>成员风采</div>
<dir>
   <li>若风</li>
   <li>小智</li>
   <li>Miss</li>
</dir>

<div>精彩比赛</div>
<figure>
  <figcaption>黄浦江上的的卢浦大桥</figcaption>
  <img src="shanghai_lupu_bridge.jpg" width="350" height="234" />
</figure>

<div>官方数据</div>
<table border="1">
<tr>
  <th>一月 <dialog open>这是打开的对话窗口</dialog></th>
  <th>二月</th>
  <th>三月</th>
</tr>
<tr>
  <td>31</td>
  <td>28</td>
  <td>31</td>
</tr>
</table>

<div>游戏资料</div>
<form>
  <fieldset>
    <legend>health information</legend>
    height: <input type="text" />
    weight: <input type="text" />
  </fieldset>
</form>

<div>赛事中心</div>

<div>数据分析</div>
<input id="myCar" list="cars" />
<datalist id="cars">
  <option value="BMW">
  <option value="Ford">
  <option value="Volvo">
</datalist>
<canvas id="myCanvas"></canvas>
<script type="text/javascript">
var canvas=document.getElementById('myCanvas');
var ctx=canvas.getContext('2d');
ctx.fillStyle='#FF0000';
ctx.fillRect(0,0,80,100);
</script>



<footer>
  <p>Posted by: W3School</p>
  <p>Contact information: <a href="mailto:someone@example.com">someone@example.com</a>.</p>
</footer>
</body>
</html>