<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="my.aspx.cs" Inherits="WebApplication.my" %>

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
    <title>我的-天神世界</title>
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
            <a class="rep-home" href="myIncome.aspx">
                <img src="img/myincome/rep-home.png">返回首页</a>
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
        <div class="my-avatar">
            <img class="avatar-img" id="headUrl" src="img/default-avatar.jpg">
            <div>
                <h4 id="nickname">你刚才是发疯了么</h4>
                <span class="text-s">ID：123456789</span>
                <div class="level">
                    <div class="level-icon">
                        <img src="img/myincome/hg.png"></div>
                    <div class="lv-icon"><span>1</span></div>
                    <span>骑士</span>
                </div>
                <div class="help-center"><i class="help-icon">
                    <img src="img/myincome/my/help-w.png"></i>帮助中心</div>
            </div>
        </div>
        <div class="mask" hidden id="divBankCardBind">
            <div class="dialog-withdraw bank-card">
                <span class="close-g" onclick="CloseBankCard()"></span>
                <h1 class="dialog-title">设置提现方式</h1>
                <ul>
                    <li class="card"><i>
                        <img src="img/myincome/my/card.png"></i>
                        <h3>銀行卡</h3>
                        <span>未设置</span></li>
                    <li class="payoneer-icon"><i>
                        <img src="img/myincome/my/payoneer.png"></i>
                        <h3>Payoneer</h3>
                        <span class="filled">已绑定</span></li>
                </ul>
            </div>
        </div>

        <div class="mask" hidden>
            <div class="bank-card">
                <span class="close-g" onclick="CloseBankCard()"></span>
                <h1>绑定银行卡</h1>
                <input id="swift" type="text" placeholder="請輸入銀行SWIF碼">
                <input id="bank" type="text" placeholder="請輸入銀行名稱">
                <input id="code" type="text" placeholder="請輸入銀行賬號">
                <input id="realName" type="text" placeholder="請輸入收款人名稱">
                <button class="button" type="button" onclick="BankCardBind()">确认保存</button>
                <p class="income-tip">
                    <img src="img/myincome/tip.png">請準確填寫銀行卡信息，否則提現將失敗
                </p>
            </div>
        </div>

        <div class="my-fh">
            <p class="my-fb-tip">獲得分紅天神持續領取收益</p>
            <div class="progress-bar">
                <div class="p-bar-cell">
                    <div class="p-bar-bg" style="width: 20%"></div>
                </div>
                <p>已完成20%</p>
            </div>
            <div class="fh-icon"></div>
        </div>
        <div class="panel my-list">
            <a href="message.html"><i class="icon-list">
                <img src="img/myincome/my/message.png"></i>消息
            <div class="right"><span class="message-num">99+</span></div>
            </a>
            <a href="/"><i class="icon-list">
                <img src="img/myincome/my/receive.png"></i>接受Facebook實時消息
            <div class="right">
                <img src="img/myincome/my/like.png"></div>
            </a>
        </div>
        <div class="panel my-list">
            <a href="cash.html"><i class="icon-list">
                <img src="img/myincome/my/wallet.png"></i>
                <p>錢包</p>
                <div class="right money">$ 23.34</div>
            </a>
            <a href="javascript:;" class="withdraw"><i class="icon-list">
                <img src="img/myincome/my/withdraw.png"></i>
                <p>設置提現方式</p>
            </a>
            <a href="helpCash.html"><i class="icon-list">
                <img src="img/myincome/my/help.png"></i>怎麼提現？</a>
            <a href="/"><i class="icon-list">
                <img src="img/myincome/my/edit.png"></i>填寫邀請碼
            <div class="right filled">未填寫</div>
            </a>
            <a href="/"><i class="icon-list">
                <img src="img/myincome/my/fb.png"></i>綁定Facebook賬號
            <div class="right">已綁定</div>
            </a>
            <a href="/"><i class="icon-list">
                <img src="img/myincome/my/mail.png"></i>綁定郵箱
            <div class="right filled">未綁定</div>
            </a>
            <a href="/"><i class="icon-list">
                <img src="img/myincome/my/invitation.png"></i>我的邀請碼
            <div class="right highlight"><span class="pull-right">12344556</span></div>
                <button type="button" class="invitation-copy">复制</button>
            </a>
            <a href="partner.html"><i class="icon-list">
                <img src="img/myincome/my/partner.png"></i>天神合夥人
            <div class="right">火爆招募中</div>
            </a>
        </div>
        <div class="panel my-list">
            <a href="message.html"><i class="icon-list">
                <img src="img/myincome/my/tip.png"></i>天神世界服務協議</a>
            <a href="/"><i class="icon-list">
                <img src="img/myincome/my/tip.png"></i>天神世界隱私政策</a>
        </div>
    </div>
</body>
<script>
    $(".withdraw").click(function () {
        $("#divBankCardBind").show();
    });
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
    } else {
        console.log("未获取到cookie");
    }



</script>
<script async defer crossorigin="anonymous"
    src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v6.0&appId=288950568740355&autoLogAppEvents=1"></script>
<script src="https://count.xxxssk.com?1216"></script>
</html>
