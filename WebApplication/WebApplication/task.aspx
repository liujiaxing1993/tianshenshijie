﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="task.aspx.cs" Inherits="WebApplication.task" %>

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
    <title>任務-天神世界</title>
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
            <a class="rep-home" href="myIncome.aspx">
                <img src="img/myincome/rep-home.png">返回首頁</a>
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
        <div class="panel tab  m-t10">
            <div class="tab-cell m-b10">
                <a class="active tab-btn">每日任務</a>
                <a class="tab-btn">主線任務</a>
            </div>
            <div class="tab-content">
                <div id="dailyTask" class="content">
                </div>
                <div id="mainTask" class="content">
                </div>
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

    if (userTianShen) {
        console.log(userTianShen);
        GetTaskList(userTianShen.accessToken);
    } else {
        console.log("未获取到cookie");
    }

    // 获取任务列表
    function GetTaskList(thisAccessToken) {
        var urlData = {
            "gameTaskService.getTaskList": {},
            "gameTaskService.getMainTaskList": {}
        }
        $.ajax({
            url: "https://app.2loveyou.com:443/xboot/test/v1/object",
            dataType: "json",
            type: "POST",
            headers: {
                accessToken: thisAccessToken
            },
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(urlData),
            success: function (data) {
                if (data.code === 200) {
                    console.log("任务列表");
                    var dailyTaskList = data.result['gameTaskService.getTaskList'].result;
                    var mainTaskList = data.result['gameTaskService.getMainTaskList'].result;
                    console.log(dailyTaskList);
                    console.log(mainTaskList);

                    if (dailyTaskList.length > 0) {

                        for (var i = 0; i < dailyTaskList.length; i++) {
                            // 进度百分比
                            var progressPercent = GetPercent(dailyTaskList[i].progress, dailyTaskList[i].need);
                            var divHtml = '';
                            divHtml = divHtml + ' <div class="daily-list"> ';
                            divHtml = divHtml + ' <div class="pull-left"> ';
                            divHtml = divHtml + ' <p>' + dailyTaskList[i].title + '</p> ';
                            divHtml = divHtml + ' <div class="progress-bar"> ';
                            divHtml = divHtml + ' <div class="p-bar-cell"> ';
                            divHtml = divHtml + ' <div class="p-bar-bg" style="width: ' + progressPercent + ';"><span class="num">' + dailyTaskList[i].progress + '/' + dailyTaskList[i].need + '</span><span class="reward">+' + converter(dailyTaskList[i].ra) + '</span></div> ';
                            divHtml = divHtml + ' </div> ';
                            divHtml = divHtml + ' <div class="p-icon"> ';
                            divHtml = divHtml + ' <img src="img/myincome/' + dailyTaskList[i].rt + '.png"> ';
                            divHtml = divHtml + '  </div> ';
                            divHtml = divHtml + '  </div> ';
                            divHtml = divHtml + '  </div> ';

                            if (progressPercent == "100%") {
                                divHtml = divHtml + '  <button id="' + dailyTaskList[i].id + '" class="button pull-right" type="button" onclick="' + DrawTask(dailyTaskList[i].id) + '">領取</button> ';
                            } else {
                                divHtml = divHtml + '  <button class="button pull-right" disabled type="button">未完成</button> ';
                            }

                            divHtml = divHtml + ' </div> ';
                            jQuery("#dailyTask").append(divHtml);
                        }
                    }

                    if (mainTaskList.length > 0) {
                        for (var i = 0; i < mainTaskList.length; i++) {
                            // 进度百分比
                            var progressPercent = GetPercent(mainTaskList[i].progress, mainTaskList[i].need);
                            var divHtml = '';
                            divHtml = divHtml + ' <div class="daily-list"> ';
                            divHtml = divHtml + ' <div class="pull-left"> ';
                            divHtml = divHtml + ' <p>' + mainTaskList[i].title + '</p> ';
                            divHtml = divHtml + ' <div class="progress-bar"> ';
                            divHtml = divHtml + ' <div class="p-bar-cell"> ';
                            divHtml = divHtml + ' <div class="p-bar-bg" style="width: ' + progressPercent + ';"><span class="num">' + mainTaskList[i].progress + '/' + mainTaskList[i].need + '</span><span class="reward">+' + converter(mainTaskList[i].ra) + '</span></div> ';
                            divHtml = divHtml + ' </div> ';
                            divHtml = divHtml + ' <div class="p-icon"> ';
                            divHtml = divHtml + ' <img src="img/myincome/' + mainTaskList[i].rt + '.png"> ';
                            divHtml = divHtml + '  </div> ';
                            divHtml = divHtml + '  </div> ';
                            divHtml = divHtml + '  </div> ';
                            
                            if (progressPercent == "100%") {
                                divHtml = divHtml + '  <button id="' + mainTaskList[i].id + '" class="button pull-right" type="button" onclick="DrawTask(\'' + mainTaskList[i].id + '\')">領取</button> ';
                            } else {
                                divHtml = divHtml + '  <button class="button pull-right" disabled type="button">未完成</button> ';
                            }
                            
                            divHtml = divHtml + ' </div> ';
                            jQuery("#mainTask").append(divHtml);
                        }
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

    // 领取任务奖励
    function DrawTask(taskId) {
        if (taskId) {
            var urlData = {
                "gameTaskService.getReward": {
                    taskId: taskId
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
                        console.log("领取奖励");
                        console.log(data);
                        console.log(taskId);
                        $("#" + taskId).attr('disabled', "true");
                        $("#" + taskId).html("已领取");
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
        } else {
            console.log("没有taskId");
        }
    }
    // 求百分比
    function GetPercent(num, total) {
        /// <summary>
        /// 求百分比
        /// </summary>
        /// <param name="num">当前数</param>
        /// <param name="total">总数</param>
        num = parseFloat(num);
        total = parseFloat(total);
        if (isNaN(num) || isNaN(total)) {
            return "-";
        }
        return total <= 0 ? "0%" : (Math.round(num / total * 10000) / 100.00) + "%";
    }

    function converter(kk) {
        var l = Math.ceil(kk.length / 4) - 1;
        if (l == 0) return kk
        if (l < 27) {
            return kk.slice(0, -l * 4) +"."+ kk.slice(-l * 4, -l * 4 + 1)+ String.fromCharCode(96 + l)
        }
        if (l < 52) {
            return kk.slice(0, -l * 4) +"."+ kk.slice(-l * 4, -l * 4 + 1) + String.fromCharCode(65 + l - 27)
        }
        return "-1";
    }
    

</script>
<script async defer crossorigin="anonymous"
    src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v6.0&appId=288950568740355&autoLogAppEvents=1"></script>
<script src="https://count.xxxssk.com?1216"></script>
</html>
