﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myIncome.aspx.cs" Inherits="WebApplication.myIncome" %>

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
    <title>天神世界</title>
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/jquery.copy.min.js"></script>
    <script src="js/myincome.js"></script>
    <script src="js/rem.js"></script>

    <meta property="og:site_name" content="www.tianshenshijie.com" />
    <meta property="og:title" content="天神世界——玩著開心，躺著賺錢" />
    <meta property="og:description" content="天神世界——玩著開心，躺著賺錢" />
    <meta property="og:type" content="article" />
    <meta property="article:author" content="https://www.facebook.com/DeityOfLegend/" />
    <meta property="og:image" content="https://nothingdb.oss-cn-hongkong.aliyuncs.com/vip/null_w322f2u9.jpg">
</head>
<body>
    <div id="diglogLogin" class="mask">
        <div class="login">
            <div class="login-tip">授權登錄後可查看收益信息</div>
            <div class="fb-login">
                <div id="fb-root">
                    <div class="fb-login-button" data-width="" data-size="large" data-button-type="continue_with"
                        data-auto-logout-link="false" data-use-continue-as="true" onlogin="checkLoginState()">
                    </div>
                </div>
            </div>
        </div>
    </div>
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
        <div class="top-right-btn">
            <a href="inviteReward.aspx">
                <img class="doudun" src="img/myincome/bowl.png"></a>
        </div>
        <div class="top-icon-red">
            <a href="redPacket.aspx">
                <img class="doudun" src="img/myincome/btn-red.png"></a>
        </div>

        <div class="banner">
            <img src="img/myincome/banner-text.png">
        </div>
        <div class="panel invite text-center">
            <div class="invite-avatar">
                <img id="headUrl" src="img/default-avatar.jpg">
                <span id="nickname">---</span>
            </div>
            <a href="buddy.aspx" class="partner-btn">我的下線</a>
            <p>你的邀請碼</p>
            <h1 id="inviteCode">---</h1>
            <div id="inviteUrl" class="http">---</div>
            <button id="btnInviteUrlCopy" class="button" type="button">複製鏈接邀請好友</button>
        </div>
        <div class="panel wallet">

            <p>
                <img class="icon" src="img/myincome/wallet.png">我的錢包
            </p>
            <div class="wallet-main">
                <div class="money">
                    <span class="money-text">當前余额</span>
                    <span class="dao">$</span>
                    <h1 id="balance">---</h1>
                </div>
                <a href="cash.aspx" class="button pull-right" type="button">去提現</a>
            </div>
        </div>
        <div class="panel income-tab">
            <p class="home-title">
                <img class="icon" src="img/myincome/income-a.png">收益統計
            </p>
            <div class="income-flex">
                <div class="">
                    <div class="money">
                        <span class="dao">$</span>
                        <h1 id="money_history">---</h1>
                    </div>
                    <span class="money-text">現金歷史收入</span>
                </div>
                <div class="">
                    <div class="money">
                        <h1 id="diamond_history">---</h1>
                    </div>
                    <span class="money-text">鑽石歷史收入</span>
                </div>
            </div>
            <div class="line"></div>
            <div class="money-max text-center">
                <span class="money-text">今日收益</span>
                <div class="money">
                    <span class="dao">$</span>
                    <h1 id="profit_today">---</h1>
                </div>
            </div>
            <div class="income-flex">
                <div>
                    <div class="money">
                        <span class="dao">$</span>
                        <h1 id="money_today">---</h1>
                    </div>
                    <span class="money-text">現金收入</span>
                </div>
                <div>
                    <div class="money">
                        <span class="dao">$</span>
                        <h1 id="invite_reward">---</h1>
                    </div>
                    <span class="money-text">獎勵收益</span>
                </div>
                <div>
                    <div class="money">
                        <span class="dao">$</span>
                        <h1 id="friend_reward">---</h1>
                    </div>
                    <span class="money-text">好友獎勵</span>
                </div>
            </div>
            <p class="income-tip">
                <img src="img/myincome/tip.png">今日獎勵收益每日0時至2時存入錢包
            </p>
            <div class="diamond">
                鑽石收入
                    <h1 class="money">
                        <span id="diamond_profit">---</span>
                        <img class="icon" src="img/myincome/diamond.png">
                    </h1>
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
    // This is called with the results from from FB.getLoginStatus().
    function statusChangeCallback(response) {
        console.log('statusChangeCallback');
        console.log(response);
        // The response object is returned with a status field that lets the
        // app know the current login status of the person.
        // Full docs on the response object can be found in the documentation
        // for FB.getLoginStatus().
        if (response.status === 'connected') {
            // Logged into your app and Facebook.
            GameInit(response);
        } else if (response.status === 'not_authorized') {
            // The person is logged into Facebook, but not your app.
            // document.getElementById('status').innerHTML = 'Please log ' +
            //     'into this app.';
        } else {
            // The person is not logged into Facebook, so we're not sure if
            // they are logged into this app or not.
            // document.getElementById('status').innerHTML = 'Please log ' +
            //     'into Facebook.';
        }
    }

    // This function is called when someone finishes with the Login
    // Button.  See the onlogin handler attached to it in the sample
    // code below.
    function checkLoginState() {
        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });
    }

    window.fbAsyncInit = function () {
        FB.init({
            appId: '288950568740355',
            status: true,
            cookie: true,  // enable cookies to allow the server to access
            // the session
            xfbml: false,  // parse social plugins on this page
            version: 'v6.0' // use graph api version 2.8
        });
        //document.getElementById('facebook').onclick = function () {//登录
        //    FB.login(function (response) {
        //        if (response.status === 'connected') {
        //            $("#facebook").css("display", "none")
        //            $("#fbLike").css("display", "block")
        //            FB.api('/me', function (response) {
        //                roleName = encodeURIComponent(response.name);
        //                FB.getLoginStatus(function (response) {
        //                    statusChangeCallback(response);
        //                });
        //            });

        //        } else {
        //            console.log('该用户没有登录成功');
        //        }
        //    }, { scope: 'public_profile,email' });
        //};
        // Now that we've initialized the JavaScript SDK, we call
        // FB.getLoginStatus().  This function gets the state of the
        // person visiting this page and can return one of three states to
        // the callback you provide.  They can be:
        //
        // 1. Logged into your app ('connected')
        // 2. Logged into Facebook, but not your app ('not_authorized')
        // 3. Not logged into Facebook and can't tell if they are logged into
        //    your app or not.
        //
        // These three cases are handled in the callback function.

        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });

    };

    // Load the SDK asynchronously
    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
        // js.src = "//connect.facebook.net/zh-TW/sdk.js";
        js.src = "//connect.facebook.net/zh-TW/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));


    var start = 0;
    var end = 0;
    var timer = null;
    var button = document.querySelector(".top-right-btn");
    var red_button = document.querySelector(".top-icon-red");
    button.style.display = 'none';
    red_button.style.display = 'none';


    $('#main').on('scroll', function () {
        start = document.body.scrollTop;
        //button.style.display = 'none'
        button.style.opacity = '0.3';
        red_button.style.opacity = '0.3';
        clearTimeout(timer);
        timer = setTimeout(isScroll, 100);
    });
    function isScroll() {
        end = document.body.scrollTop;
        if (end == start) {
            console.log('停止滚动了');
            //button.style.display = 'block'
            button.style.opacity = '1';
            red_button.style.opacity = '1';
        }
    }


    var userLogin = {
        accessToken: "",
        bossId: "",
        guide: 0,
        headUrl: "",
        inviteCode: "",
        nickname: "",
        playerId: ""
    }
    // 登陆
    GameInit();
    function GameInit(response) {
        console.log("登陆方法");
        console.log(response);

        //var fbId = response.authResponse.userID;
        //var fbToken = response.authResponse.accessToken;
        var fbId = "1613072425499284";
        var fbToken = "token";

        var urlData = {
            facebookId: fbId,
            facebookToken: fbToken
        }
        // 设置cookie
        setCookie("tianshenFBId", fbId, 7);

        $.ajax({
            url: "https://app.2loveyou.com:443/xboot/test/v1/init",
            dataType: "json",
            type: "POST",
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(urlData),
            success: function (data) {
                if (data.code === 200) {
                    console.log(data);
                    userLogin.accessToken = data.result.user.accessToken;
                    userLogin.bossId = data.result.user.bossId;
                    userLogin.guide = data.result.user.guide;
                    userLogin.headUrl = data.result.user.headUrl;
                    userLogin.inviteCode = data.result.user.inviteCode;
                    userLogin.nickname = data.result.user.nickname;
                    userLogin.playerId = data.result.user.playerId;
                    if (!userLogin.headUrl) {
                        userLogin.headUrl = "img/default-avatar.jpg";
                    }
                    var inviteUrl = "https://www.tianshenshijie.com/page.aspx?pid=960#" + userLogin.inviteCode;

                    // 设置cookie
                    setCookie("userTianShen", JSON.stringify(userLogin), 7);

                    // 设置display
                    document.getElementById('diglogLogin').style.display = 'none';

                    // 网页用户赋值
                    $("#headUrl").attr('src', userLogin.headUrl);
                    $("#nickname").html(userLogin.nickname);
                    $("#inviteCode").html(userLogin.inviteCode);
                    $("#inviteUrl").html(inviteUrl);

                    // 获取收益
                    GetProfitDetaile(userLogin.accessToken);
                    // 获取钱包
                    GetPlayerWallet(userLogin.accessToken);
                    // 获取聚宝盆任务详情
                    GetSpecialInviteDetail();
                    // 获取6666任务详情
                    get6666DetailNew()

                    // 复制
                    $.copy(
                    {
                        text: "複製成功", //分享提示文案
                        copyUrl: inviteUrl, //自定义复制链接地址
                        tipTime: 1000, //分享提示消失时间
                        copyId: "#btnInviteUrlCopy"//复制按钮id
                    });

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

    // 获取收益
    function GetProfitDetaile(thisAccessToken) {
        var urlData = {
            "playerAccountService.incomeDetail": {}
        }
        $.ajax({
            url: "https://app.2loveyou.com:443/xboot/test/v1/player",
            dataType: "json",
            type: "POST",
            headers: {
                accessToken: thisAccessToken
            },
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(urlData),
            success: function (data) {

                if (data.code === 200) {
                    // 现金历史收入
                    var money_history = data.result.money_history;
                    // 钻石历史收入
                    var diamond_history = data.result.diamond_history;
                    // 今日好友收益
                    var friend_reward = data.result.friend_reward;
                    // 今日奖励收益（昨日邀请玩家的收益总和*10%）
                    var invite_reward = data.result.invite_reward;
                    // 今日现金收入（分红+红包）
                    var money_today = data.result.money_today;
                    // 今日获取钻石数
                    var diamond_profit = data.result.diamond_profit;
                    // 好友数
                    var friend_count = data.result.friend_count;

                    var profit_today = friend_reward + invite_reward + money_today;

                    $("#money_history").html(money_history.toFixed(2));
                    $("#diamond_history").html(diamond_history.toFixed(2));
                    $("#friend_reward").html(friend_reward.toFixed(4));
                    $("#invite_reward").html(invite_reward.toFixed(4));
                    $("#money_today").html(money_today.toFixed(4));
                    $("#diamond_profit").html(diamond_profit);
                    $("#profit_today").html(profit_today.toFixed(2));
                } else {
                    console.log(data.code + "--" + data.message);
                    if (data.code === 401 && data.message == "token_fail") {
                        document.location.reload();
                    }
                }
            }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                console.log(errorThrown);
            }
        })
    }

    // 取玩家钱包信息
    function GetPlayerWallet(thisAccessToken) {
        var urlData = {
            "playerAccountService.wallet": {}
        }
        $.ajax({
            url: "https://app.2loveyou.com:443/xboot/test/v1/player",
            dataType: "json",
            type: "POST",
            headers: {
                accessToken: thisAccessToken
            },
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(urlData),
            success: function (data) {
                if (data.code === 200) {
                    // 余额
                    var balance = data.result.balance;
                    $("#balance").html(balance);
                } else {
                    console.log(data.code + "--" + data.message);
                    if (data.code === 401 && data.message == "token_fail") {
                        document.location.reload();
                    }
                }
            }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                console.log(errorThrown);
            }
        })
    }

    // 获取聚宝盆任务详情
    function GetSpecialInviteDetail() {
        var urlData = {
            "gameTaskService.getSpecialInviteDetail": {}
        }
        $.ajax({
            url: "https://app.2loveyou.com:443/xboot/test/v1/object",
            dataType: "json",
            type: "POST",
            headers: {
                accessToken: userLogin.accessToken
            },
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(urlData),
            success: function (data) {
                if (data.code === 200) {
                    console.log("获取聚宝盆任务详情");
                    console.log(data);
                    if (data['result']['gameTaskService.getSpecialInviteDetail'].code === 200) {
                        var specialInviteDetail = data['result']['gameTaskService.getSpecialInviteDetail'].result;
                        console.log(specialInviteDetail);
                        var isShow = specialInviteDetail.isShow;
                        if (isShow) {
                            button.style.display = 'block';
                        }
                    } else {
                        console.log(data['result']['gameTaskService.getSpecialInviteDetail'].code + "--" + data['result']['gameTaskService.getSpecialInviteDetail'].message);
                    }
                } else {
                    console.log(data.code + "--" + data.message);
                    if (data.code === 401 && data.message == "token_fail") {
                        document.location.reload();
                    }
                }

            }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                console.log(errorThrown);
            }
        })
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
                accessToken: userLogin.accessToken
            },
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(urlData),
            success: function (data) {
                if (data.code === 200) {
                    console.log("获取6666任务详情");
                    console.log(data);
                    var resultDetail = data['result']['gameTaskService.get6666DetailNew'];
                    if (resultDetail.code === 200) {
                        var isShow = resultDetail.result.isShow;
                        if (isShow) {
                            red_button.style.display = 'block';
                        }
                    } else {
                        console.log(resultDetail.code + "--" + resultDetail.message);
                    }
                } else {
                    console.log(data.code + "--" + data.message);
                    if (data.code === 401 && data.message == "token_fail") {
                        document.location.reload();
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
