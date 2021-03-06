﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="redPacket.aspx.cs" Inherits="WebApplication.redPacket" %>

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
    <link rel="icon" href="favicon.ico" />
    <link rel="stylesheet" href="css/myincome.css">
    <link rel="stylesheet" href="css/animation.css">
    <title>紅包-天神世界</title>
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/myincome.js"></script>
    <script src="js/rem.js"></script>
</head>
<body class="invite-reward">
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

        <div class="redpacked-main">
            <h3 id="watchNumberHead">觀看8888個視頻可以領取海量獎勵</h3>
            <table>
                <thead>
                    <tr>
                        <th>觀看視頻(次)</th>
                        <th>獎勵</th>
                    </tr>
                </thead>
                <tbody id="taskList">
                </tbody>
            </table>
            <h4 id="watchNumberBottom">【循環任務】領取8888次階段獎勵後，任務會重新開始哦</h4>
        </div>
        <div class="packed-light"></div>
        <div class="packed-chest">
            <img src="img/myincome/redpacket/chest.png">
        </div>
        <div class="packed-mark">
            <p id="allDollar">總價值$18</p>
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
        get6666DetailNew();
    } else {
        console.log("未获取到cookie");
    }

    // 获取6666任务详情
    function get6666DetailNew() {
        var urlData = {
            "gameTaskService.get6666DetailNew": {}
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
                    console.log("获取6666任务详情");
                    console.log(data);
                    var resultDetail = data['result']['gameTaskService.get6666DetailNew'];
                    if (resultDetail.code === 200) {
                        var allDollar = resultDetail.result.allDollar;
                        var isShow = resultDetail.result.isShow;
                        var max = resultDetail.result.max;
                        var tx_je = resultDetail.result.tx_je;
                        var tx_kq = resultDetail.result.tx_kq;
                        var setting = resultDetail.result.setting;
                        if (setting.length > 0 && isShow) {

                            for (var i = 0; i < setting.length; i++) {
                                var divHtml = '';
                                divHtml = divHtml + ' <tr> ';
                                // 1
                                divHtml = divHtml + ' <td> ';
                                divHtml = divHtml + setting[i].progress + '/' + setting[i].need;
                                if (i === 0 && tx_kq) {
                                    divHtml = divHtml + ' <div class="packed-showtip">完成任務後，首次$' + tx_je + '.00即可提現</div> ';
                                }
                                divHtml = divHtml + ' </td> ';
                                // 2
                                divHtml = divHtml + ' <td> ';
                                if (setting[i].rt == "dollar_red") {
                                    divHtml = divHtml + '+$' + setting[i].reward;
                                } else {
                                    divHtml = divHtml + '<img src="img/myincome/redpacket/zuan.png">+' + setting[i].reward;
                                }
                                divHtml = divHtml + ' </td> ';
                                // 3
                                divHtml = divHtml + ' <td align="center" id="' + setting[i].id + '"> ';
                                if (setting[i].isGet === 1) {
                                    divHtml = divHtml + ' <img src="img/myincome/invite/received-simp.png" class="received-simp"> ';
                                }else{
                                    if (setting[i].need <= setting[i].progress) {
                                        divHtml = divHtml + ' <button class="redpacked-redbtn" onclick="reward6666New(\'' + setting[i].id + '\')">領取</button> ';
                                    } else {
                                        divHtml = divHtml + ' <button disabled class="redpacked-redbtn">領取</button> ';
                                    }
                                }

                                divHtml = divHtml + ' </td> ';

                                divHtml = divHtml + ' </tr> ';
                                jQuery("#taskList").append(divHtml);
                            }
                        }

                        $("#watchNumberHead").html("觀看" + max + "個視頻可以領取海量獎勵");
                        $("#watchNumberBottom").html("【循環任務】領取" + max + "次階段獎勵後，任務會重新開始");
                        $("#allDollar").html("總價值$" + allDollar);
                    } else {
                        console.log(resultDetail.code + "--" + resultDetail.message);
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

    // 领取6666任务奖励
    function reward6666New(taskId) {
        console.log("taskId:" + taskId);
        var urlData = {
            "gameTaskService.reward6666New": {
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
                    console.log("领取聚宝盆奖励");
                    console.log(data);
                    var rewardSpecialInviteData = data['result']['gameTaskService.reward6666New'];
                    if (rewardSpecialInviteData.code === 200) {
                        $("#" + taskId).html('<img src="img/myincome/invite/received-simp.png" class="received-simp">');
                    } else {
                        console.log(rewardSpecialInviteData.code + "--" + rewardSpecialInviteData.message);
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

</script>
<script async defer crossorigin="anonymous"
    src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v6.0&appId=288950568740355&autoLogAppEvents=1"></script>
<script src="https://count.xxxssk.com?1216"></script>
</html>

