﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cashRecord.aspx.cs" Inherits="WebApplication.cashRecord" %>

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
    <title>現金記錄-天神世界</title>
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

        <div class="tab-cell m-b10 wallet-tabs tab-cell-1">
            <a class="active tab-btn">收入記錄</a>
            <a class="tab-btn">提現記錄</a>
        </div>
        <div class="tab-content">
            <div class="content">
                <div class="panel m-t10">
                    <div id="incomeList" class="list record">
                    </div>
                </div>
                <div id="caseudIncome"></div>
            </div>
            <div class="content">
                <div class="panel m-t10">
                    <div id="withdrawList" class="list record">
                    </div>
                </div>
                <div id="caseudWithdraw"></div>
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

    // 收入
    var this_page_sizeIncome = 20;
    var this_page_noIncome = 1;
    var addstateIncome = true;

    // 提现
    var this_page_sizeWithdraw = 20;
    var this_page_noWithdraw = 1;
    var addstateWithdraw = true;

    // 获取user
    var userTianShen = JSON.parse(getCookie("userTianShen"));

    if (userTianShen) {
        console.log(userTianShen);
        IncomeCashRecord(this_page_sizeIncome, this_page_noIncome);
        this_page_noIncome++;

        WithdrawCashRecord(this_page_sizeWithdraw, this_page_noWithdraw);
        this_page_noWithdraw++;

    } else {
        console.log("未获取到cookie");
    }

    $('#main').on('scroll', function () {
        //获取当前加载更多按钮距离顶部的距离
        var bottomsubmitIncome = $('#caseudIncome').offset().top;
        var bottomsubmitWithdraw = $('#caseudWithdraw').offset().top;
        //获取当前页面底部距离顶部的高度距离
        var nowtop = $('#main').scrollTop() + $(window).height();
        if (nowtop > bottomsubmitIncome) {
            if (addstateIncome) {
                addstateIncome = false;
                IncomeCashRecord(this_page_sizeIncome, this_page_noIncome);
                this_page_noIncome++;
            }
        }
        if (nowtop > bottomsubmitWithdraw) {
            if (addstateWithdraw) {
                addstateWithdraw = false;
                WithdrawCashRecord(this_page_sizeWithdraw, this_page_noWithdraw);
                this_page_noWithdraw++;
            }
        }
    })


    /**
     * post 获取钱包现金记录
     * @param page_size  {number}
     * @param page_no  {number}
     * @param type  {string 'income'/'withdraw'}
     */
    function IncomeCashRecord(page_size, page_no) {
        var urlData = {
            "playerAccountService.dollarRecords": {
                page_size: page_size,
                page_no: page_no,
                type: "income"
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
                    console.log("获取钱包收入记录");
                    console.log(data);

                    var messageList = data.result.list;
                    if (messageList.length > 0) {
                        addstateIncome = true;
                        for (var i = 0; i < messageList.length; i++) {
                            var liHtml = '';
                            liHtml = liHtml + ' <a> ';
                            liHtml = liHtml + ' <h1> ' + messageList[i].title;
                            liHtml = liHtml + ' <span class="date">' + DisposeTime(messageList[i].date) + '</span> ';
                            liHtml = liHtml + ' </h1> ';
                            liHtml = liHtml + ' <div class="record-money txt-income">+' + messageList[i].money.toFixed(4) + '</div>';

                            liHtml = liHtml + '  </a> ';
                            jQuery("#incomeList").append(liHtml);
                        }
                    } else {
                        addstateIncome = false;
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


    function WithdrawCashRecord(page_size, page_no) {
        var urlData = {
            "playerAccountService.dollarRecords": {
                page_size: page_size,
                page_no: page_no,
                type: "withdraw"
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
                    console.log("获取钱包提现记录");
                    console.log(data);

                    var messageList = data.result.list;
                    if (messageList.length > 0) {
                        addstateWithdraw = true;
                        for (var i = 0; i < messageList.length; i++) {
                            var liHtml = '';
                            liHtml = liHtml + ' <a> ';
                            liHtml = liHtml + ' <h1> ' + messageList[i].title + '（' + messageList[i].status + '）';
                            liHtml = liHtml + ' <span class="date">' + DisposeTime(messageList[i].date) + '</span> ';
                            liHtml = liHtml + ' </h1> ';
                            liHtml = liHtml + ' <div class="record-money">' + messageList[i].money.toFixed(4) + '</div>';

                            liHtml = liHtml + '  </a> ';
                            jQuery("#withdrawList").append(liHtml);
                        }
                    } else {
                        addstateWithdraw = false;
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

    // 处理时间
    function DisposeTime(times) {
        // "2020-05-14 17:32:16"
        var timearr = times.split(":");
        var timestr = timearr[0] + ":" + timearr[1]
        return timestr
    }
</script>
<script async defer crossorigin="anonymous"
    src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v6.0&appId=288950568740355&autoLogAppEvents=1"></script>
<script src="https://count.xxxssk.com?1216"></script>
</html>
