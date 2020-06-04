﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="message.aspx.cs" Inherits="WebApplication.message" %>

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
    <title>消息-天神世界</title>
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
    <div id="main" class="main">
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

        <div class="panel m-t10">
            <h1 class="panel-title">消息列表</h1>
            <div class="list" id="messageList">
                <%--   <a>
                    <h1>關於邀請好友建立關係失敗的公告
                    <span class="date">3-5 02:07</span>
                    </h1>
                    <i class="right-icon">
                        <img class="icon" src="img/myincome/right-link.png">
                    </i>
                </a>
                <a>
                    <h1>關於邀請好友建立關係失敗的公告
                    <span class="date">3-5 02:07</span>
                    </h1>
                    <i class="right-icon">
                        <img class="icon" src="img/myincome/right-link.png">
                    </i>
                </a>--%>
            </div>
        </div>
        <div id="caseud"></div>


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

    var thisMessageList = [];

    var this_page_size = 20;
    var this_page_no = 1;
    var addstate = true;

    // 获取user
    var userTianShen = JSON.parse(getCookie("userTianShen"));

    if (userTianShen) {
        console.log(userTianShen);
        GetMessageList(this_page_size, this_page_no);
        this_page_no++;
    } else {
        console.log("未获取到cookie");
    }

    $('#main').on('scroll', function () {
        //获取当前加载更多按钮距离顶部的距离
        var bottomsubmit = $('#caseud').offset().top;
        //获取当前页面底部距离顶部的高度距离
        var nowtop = $('#main').scrollTop() + $(window).height();
        if (nowtop > bottomsubmit) {
            if (addstate) {
                addstate = false;
                GetMessageList(this_page_size, this_page_no);
                this_page_no++;
            }
        }
    })


    // 获取消息列表
    function GetMessageList(page_size, page_no) {
        var urlData = {
            "mMessageService.list": {
                page_size: page_size,
                page_no: page_no
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
                    console.log("消息列表");
                    console.log(data);

                    var messageList = data.result.list;
                    thisMessageList = thisMessageList.concat(messageList);
                    if (messageList.length > 0) {
                        addstate = true;
                        for (var i = 0; i < messageList.length; i++) {
                            var liHtml = '';
                            liHtml = liHtml + ' <a onclick="SaveMessageDetail(\'' + messageList[i].id + '\')"> ';
                            liHtml = liHtml + ' <h1> ' + messageList[i].title;
                            liHtml = liHtml + ' <span class="date">' + messageList[i].date + '</span> ';
                            liHtml = liHtml + ' </h1> ';
                            if (messageList[i].type === 3) {
                                // 已领取
                                if (messageList[i].isGot != 0) {
                                    liHtml = liHtml + ' <i class="right-overtime"> <img class="icon" src="img/myincome/award/received.png"> </i>';
                                } else if (messageList[i].overdue) {
                                    // 已超时
                                    liHtml = liHtml + ' <i class="right-overtime"> <img class="icon" src="img/myincome/award/overtime.png"> </i>';
                                } else {
                                    liHtml = liHtml + ' <i class="right-overtime"> <img class="icon" src="img/myincome/award/new1.png"> </i>';
                                }
                            }
                            liHtml = liHtml + ' <i class="right-icon"> <img class="icon" src="img/myincome/right-link.png"> </i>';
                            liHtml = liHtml + '  </a> ';
                            jQuery("#messageList").append(liHtml);
                        }
                    } else {
                        addstate = false;
                    }

                } else {
                    console.log(data.code + "--" + data.message);
                    if (data.code === 401 && data.message == "token_fail") {
                        var logResult = LogInAgain();
                        if (logResult) {
                            document.location.reload();
                        }
                    }
                }

            }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                console.log(errorThrown);
            }
        })
    }

    // 保存消息
    function SaveMessageDetail(id) {
        if (id) {
            console.log(id);
            var message
            for (var i = 0; i < thisMessageList.length; i++) {
                if (thisMessageList[i].id == id) {
                    message = thisMessageList[i];
                    break;
                }
            }
            console.log(message);
            if (message) {
                // 设置cookie
                setCookie("messageTianShen", JSON.stringify(message), 7);
                // 跳转
                location.href = "messageDetail.aspx";
            } else {
                console.log("无消息");
            }

        } else {
            console.log("消息id为空");
        }
    }

</script>
<script async defer crossorigin="anonymous"
    src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v6.0&appId=288950568740355&autoLogAppEvents=1"></script>
<script src="https://count.xxxssk.com?1216"></script>
</html>
