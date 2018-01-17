{__NOLAYOUT__}
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>提示信息</title>
    <meta name="keywords" content="{$site_info.site_seo_keywords|default=''}"/>
    <meta name="description" content="{$site_info.site_seo_description|default=''}">
    <include file="public@head"/>
    <style type="text/css" media="screen">
        .alert_tip{margin:4rem 0;}
        .alert_content{width:auto;max-width:600px;margin:0 auto;padding:2rem 1.6rem;color:rgb(123, 82, 29);border-radius:6px;-webkit-border-radius:6px;-moz-border-radius:6px;-o-border-radius:6px;-webkit-border-radius:6px;border-radius:6px;}
        .alert_content img{display:block;margin:1rem auto;max-width:100%;}
        .alert_content .tip{font-size:18px;font-weight:600;text-align:center;margin:1rem 0;}
        .alert_content .time{font-size:16px;text-align:center;color:#666;margin:1rem 0;}
        .alert_content .time a{font-size:16px;color:#6d3605;font-weight:bold;}
    </style>
</head>
<body>
    <!-- 提示页面 -->
    <section class="alert_tip">
        <div class="main">
            <div class="alert_content">
                <?php switch($code): ?>
                <?php case 1: ?>
                <img src="__TMPL__/public/assets/images/success.png" alt="">
                <p class="tip"><?php echo strip_tags($msg); ?></p>
                <?php break; ?>
                <?php case 0: ?>
                <img src="__TMPL__/public/assets/images/error.png" alt="">
                <p class="tip"><?php echo strip_tags($msg); ?></p>
                <?php break; ?>
                <?php endswitch; ?>
                <div class="time">
                    页面自动 <a id="href" href="<?php echo($url);?>">>>跳转<<</a>
                    等待时间： <b id="wait"><?php echo $wait; ?></b>
                </div>
                <div>
                <?php
                    if ($data):
                        // print_r($data);echo "<br>";
                        // var_dump($data);echo "<br>";
                        var_export($data);echo "<br>";
                    endif;
                ?>
                </div>
            </div>
        </div>
    </section>
    <script type="text/javascript">
        (function(){
            var wait = document.getElementById('wait'),
            href = document.getElementById('href').href;
            var interval = setInterval(function(){
                var time = --wait.innerHTML;
                if(time <= 0) {
                    location.href = href;
                    clearInterval(interval);
                };
            }, 1000);
        })();
    </script>
    <!-- 底部 -->
    <include file="public@footer" />
</body>
</html>