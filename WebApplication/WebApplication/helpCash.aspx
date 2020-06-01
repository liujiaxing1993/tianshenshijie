﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="helpCash.aspx.cs" Inherits="WebApplication.helpCash" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width,height=device-height,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="x5-orientation" content="portrait">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="favicon.ico">
    <link rel="stylesheet" href="css/myincome.css">
    <link rel="stylesheet" href="css/animation.css">
    <link rel="stylesheet" href="css/my.css">
    <title>怎麼提現？-天神世界</title>
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/myincome.js"></script>
    <script src="js/rem.js"></script>
</head>
<body>
<div class="download-bottom">
    <div class="pull-left">
        <img src="img/myincome/game-icon.jpg">
        <h4>下載天神世界APP</h4>
        <p>登錄遊戲輕鬆月入$5000</p>
    </div>
    <button class="pull-right" type="button" onclick="downJump()">下載</button>
</div>
<div class="main">
    <div class="top-bar">
        <a class="rep-home" href="javascript:history.back(-1)">
            <img src="img/myincome/rep-home.png">返回</a>
        <div id="Div1" class="fb-like" data-href="https://www.facebook.com/DeityOfLegend/" data-width=""
             data-layout="button_count" data-action="like" data-size="small" data-share="true">
        </div>
    </div>
    <div class="top">
        <a>
            <img class="logo" src="img/myincome/logo.png"></a>
    </div>
    <div class="panel help-cash m-t10">
        <img src="img/myincome/my/help-cash.png">
    </div>

</div>
</body>

<script>
    $(".content").eq(0).show();
    $(".tab-cell a").click(function () {
        var num = $(".tab-cell a").index(this);
        $(".content").hide();
        $(".content").eq(num).show();
        $(this).attr("class", "active tab-btn");
        $(this).siblings().attr("class", "tab-btn");
    })
    //禁止双击缩放
    window.onload = function () {
        document.addEventListener('touchstart', function (event) {
            if (event.touches.length > 1) {
                event.preventDefault();
            }
        });
        var lastTouchEnd = 0;
        document.addEventListener('touchend', function (event) {
            var now = (new Date()).getTime();
            if (now - lastTouchEnd <= 300) {
                event.preventDefault();
            }
            lastTouchEnd = now;
        }, false);
        document.addEventListener('gesturestart', function (event) {
            event.preventDefault();
        });
    }

</script>
<script async defer crossorigin="anonymous"
        src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v6.0&appId=288950568740355&autoLogAppEvents=1"></script>
<script src="https://count.xxxssk.com?1216"></script>
</html>
