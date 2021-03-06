﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="messageDetail.aspx.cs" Inherits="WebApplication.messageDetail" %>

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
    <title>消息詳情-天神世界</title>
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
            <div class="right-btn">
                <a href="partner.aspx">
                    <img src="img/myincome/btn-buddy.png"></a>
                <a href="message.aspx">
                    <img src="img/myincome/news.png"></a>
                <a href="task.aspx">
                    <img src="img/myincome/task.png"></a>
                <a href="my.aspx">
                    <img src="img/myincome/my.png"></a>
            </div>
        </div>
        <div class="panel detail m-t10">
            <h1 id="message_title">---</h1>
            <div id="message_content" class="text">
                ---
            </div>
            <div id="detailReward" class="detail-reward">
                <%--<a href="#"><img src="img/r.png"><span>X9</span></a>
                <a href="#"><img src="img/r.png"><span>X9</span></a>--%>
            </div>
            <div id="detailBtn" class="detail-btn" hidden>
                <%--<button id="drawBtn" class="button" type="button">領取獎勵</button>
                <button id="overBtn" class="button" disabled type="button">已過期</button>
                <button id="getBtn" class="button" disabled type="button">已領取</button>--%>
            </div>
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
    // 获取user
    var userTianShen = JSON.parse(getCookie("userTianShen"));
    // 获取message
    var messageTianShen = JSON.parse(getCookie("messageTianShen"));

    if (messageTianShen) {
        console.log(messageTianShen);
        GetMessageDetail();
    } else {
        console.log("未获取到信息详情cookie");
    }

    // 获取详情
    function GetMessageDetail() {
        $("#message_title").html(messageTianShen.title);
        $("#message_content").html(messageTianShen.content);
        if (messageTianShen.type === 3) {
            $("#detailBtn").show();
            var divHtml = '';
            // 已领取
            if (messageTianShen.isGot != 0) {
                divHtml = divHtml + ' <button id="getBtn" class="button" disabled type="button">已領取</button>';
            } else if (messageTianShen.overdue) {
                // 已超时
                divHtml = divHtml + ' <button id="getBtn" class="button" disabled type="button">已過期</button>';
            } else {
                divHtml = divHtml + '<button id="getBtn" class="button" type="button" onclick="GetMessageRewards()" >領取獎勵</button>';
            }
            jQuery("#detailBtn").append(divHtml);
        }

        if (messageTianShen.reward.length > 0) {
            for (var i = 0; i < messageTianShen.reward.length; i++) {
                // <a href="#"><img src="img/r.png"><span>X9</span></a>
                var divHtml = '';
                divHtml = divHtml + '<a><img src="img/myincome/award/' + messageTianShen.reward[i].type + '.png"><span>X' + messageTianShen.reward[i].amount + '</span></a>';
                jQuery("#detailReward").append(divHtml);
            }
        }

        if (messageTianShen.isRead===0) {
            setNoticeRead();
        }

    }

    // 设置消息已读
    function setNoticeRead() {
        var urlData = {
            "mMessageService.read": {
                messId: messageTianShen.id
            }
        }
        $.ajax({
            url: "https://app.2loveyou.com:443/xboot/test/v1/player",
            dataType: "json",
            type: "POST",
            headers: {
                accessToken: userTianShen.accessToken
            },
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(urlData),
            success: function (data) {
                if (data.code === 200) {
                    console.log("设置消息已读");
                    console.log(data);
                } else {
                    console.log(data.code + "--" + data.message);
                }

            }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                console.log(errorThrown);
            }
        })
    }

    // 领取消息附件奖励
    function GetMessageRewards() {
        var urlData = {
            "mMessageService.getMessageRewards": {
                messId: messageTianShen.id
            }
        }
        $.ajax({
            url: "https://app.2loveyou.com:443/xboot/test/v1/object",
            dataType: "json",
            type: "POST",
            headers: {
                accessToken: userTianShen.accessToken
            },
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(urlData),
            success: function (data) {
                if (data.code === 200) {
                    console.log("领取消息附件奖励");
                    console.log(data);
                    $("#getBtn").html("已領取");
                    $('#getBtn').attr('disabled', "true");
                    messageTianShen.isGot = 1;
                } else {
                    console.log(data.code + "--" + data.message);
                }

            }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                console.log(errorThrown);
            }
        })
    }

</script>
<script async defer crossorigin="anonymous"
    src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v6.0&appId=288950568740355&autoLogAppEvents=1"></script>
<script src="https://count.xxxssk.com?1216"></script>
</html>
