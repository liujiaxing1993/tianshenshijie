﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cash.aspx.cs" Inherits="WebApplication.cash" %>

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
    <title>錢包-天神世界</title>
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

        <div class="tab-cell m-b10 wallet-tabs tab-cell-1">
            <a class="active tab-btn">现金钱包</a>
            <a class="tab-btn">钻石钱包</a>
        </div>
        <div class="tab-content">
            <div class="content">
                <div class="panel invite text-center balance-bg m-t10">
                    <a href="cashRecord.aspx" class="partner-btn">记录</a>
                    <p>當前餘額</p>
                    <div class="nowdipos">
                        <span class="usdao">$</span>
                        <h1 id="balance">---</h1>
                    </div>
                </div>
                <div class="panel wallet">

                    <div class="depos-title">
                        <h1>提現方式</h1>
                    </div>
                    <div class="depos-main main-public">
                        <div onclick="SwitchWithdrawType(1)" id="bank_type" class="btnselect">
                            <span>
                                <img id="bank_selected" src="img/myincome/selected.png"></span>银行卡
                        </div>
                        <div onclick="SwitchWithdrawType(2)" id="payoneer_type" class="payoneer">
                            <span>
                                <img id="payoneer_selected" src="img/myincome/selected.png"></span>
                            Payoneer
                    <span>
                        <img class="icon-reward" src="img/myincome/plusfivety.png"></span>
                        </div>

                    </div>
                </div>

                <div class="panel wallet">

                    <div class="depos-title">
                        <div class="avail-title">
                            <h1>提現金額</h1>
                            <span>(美元)</span>
                        </div>

                    </div>
                    <div id="cashAmount" class="avail-main main-public">
                    </div>
                </div>

                <button class="dipos-btn" type="button" onclick="Withdraw()">立即提現</button>
                <p class="dipos-tip">
                    <img src="img/myincome/help-yellow.png">提現後3個工作日內到賬，手續費3%；首次提現，不收手續費
                </p>
            </div>
            <div class="content">
                <div class="panel invite text-center balance-bg m-t10">

                    <a href="diamondRecord.aspx" class="partner-btn">记录</a>
                    <p>當前鉆石</p>
                    <div id="diamonds" class="nowdipos">80000<img src="img/myincome/redpacket/zuan.png" class="diamond-icon">(=$100.1408)</div>
                </div>
                <div class="panel wallet">

                    <div class="depos-title">
                        <h1>兌換現金</h1>
                        <p id="diamond_rate">兌換比例：10000鉆石=1美元</p>
                    </div>
                    <div class="depos-main main-public">
                        <input id="diamondNum" type="number" placeholder="請輸入現金金額">
                        <button class="button pull-right" onclick="CashExchange()">兌換</button>
                    </div>
                    <div class="exchange-tip">每日最高可兌換100美元</div>
                </div>

                <div class="panel wallet">

                    <div class="depos-title">
                        <h1>鉆石投資（限時開放）</h1>
                    </div>
                    <div class="depos-main main-public main-bottom">
                        <input id="diamondInvestedNum" type="number" placeholder="請輸入鉆石數量">
                        <button class="button pull-right" disabled>投資</button>
                    </div>
                    <div class="invest-details">
                        <div>
                            <p>已投資鉆石:<span id="invested">6000</span></p>
                            <p>今日鉆石收益:<span id="today_interest">150</span></p>
                            <p>24小時後收益:<span id="total_interest">150</span></p>
                        </div>
                        <div>
                            <p>
                                <img src="img/myincome/activeicon.png">活跃度：<span id="activity">7</span>
                            </p>
                            <button class="button" onclick="GetDailyInvest()">領取收益</button>
                        </div>
                    </div>
                    <div class="diamond-description">
                        1、鉆石投資後，每日可領取24小時前鎖定鉆石總額的1.5%的收益獎勵。<br>
                        2、活躍度≤0時，不可以領取利息，活躍度每日0時計算。<br>
                        3、投資的鉆石不可以消費，也不可以兌換現金。
                    </div>

                </div>
            </div>
        </div>



        <div id="divBankCardBind" class="mask" hidden>

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
    </div>
</body>
<script>
    $("#payoneer_selected").hide();
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
    // 余额
    var balance
    // 是否第一次提现
    var first = false;
    // 提现方式
    var CashType = 1;
    // 提现金额
    var CashAmount = 0;
    // 兑换1美元所需钻石
    var diamond_rate = 0;
    // 当前钻石数
    var diamonds = 0;
    // 活跃度
    var activity = 0;
    // 当前可领取投资收益
    today_interest = 0;

    if (userTianShen) {
        console.log(userTianShen);
        GetPlayerWallet(userTianShen.accessToken);
    } else {
        console.log("未获取到cookie");
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
                    console.log("取玩家钱包信息");
                    console.log(data);
                    // 余额
                    balance = data.result.balance;
                    first = data.result.first;

                    // 钻石钱包
                    // 兑换1美元所需钻石
                    diamond_rate = data.result.diamond_rate;
                    // 当前钻石数
                    diamonds = data.result.diamonds;
                    // 已投资钻石数
                    var invested = data.result.invested;
                    // 24小时前的投资总数
                    var invested_yesterday = data.result.invested_yesterday;
                    // 活跃度
                    activity = data.result.activity;
                    // 当前可领取投资收益
                    today_interest = data.result.today_interest;
                    // 每天可领取总的投资收益
                    var total_interest = data.result.total_interest;


                    $("#balance").html(balance);
                    // 钻石钱包
                    var usdRate = (diamonds / diamond_rate).toFixed(4);
                    var divDiamonds = '';
                    divDiamonds = diamonds + '<img src="img/myincome/redpacket/zuan.png" class="diamond-icon">(=$' + usdRate + ')';
                    $("#diamonds").html(divDiamonds);

                    $("#diamond_rate").html('兌換比例：' + diamond_rate + '鉆石=1美元');

                    $("#invested").html(invested);
                    $("#today_interest").html(today_interest);
                    $("#total_interest").html(total_interest);
                    $("#activity").html(activity);

                    // 获取app配置
                    GetAppInfo(userTianShen.accessToken);

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

    // 取配置数据
    function GetAppInfo(thisAccessToken) {
        var urlData = {
            "baseNumberDataService.getAppInfo": {}
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
                    console.log("取配置数据");
                    console.log(data);
                    var withdrawAmounts = data['result']['baseNumberDataService.getAppInfo'].result.withdrawAmounts;
                    if (first) {
                        var divHtml = '';
                        divHtml = divHtml + ' <div class="btnselect first"> ';
                        divHtml = divHtml + ' <span>  <img src="img/myincome/selected.png"></span>' + withdrawAmounts[0] + ' <p> ';
                        divHtml = divHtml + ' <img src="img/myincome/first.png"> </p> ';
                        divHtml = divHtml + ' </div> ';
                        divHtml = divHtml + ' <div>' + withdrawAmounts[1] + '</div> ';
                        divHtml = divHtml + ' <div>' + withdrawAmounts[2] + '</div> ';
                        divHtml = divHtml + ' <div>' + withdrawAmounts[3] + '</div> ';
                        divHtml = divHtml + ' <div>' + withdrawAmounts[4] + '</div> ';
                        divHtml = divHtml + ' <div>' + withdrawAmounts[5] + '</div> ';
                        jQuery("#cashAmount").append(divHtml);
                        CashAmount = withdrawAmounts[0];
                    } else {
                        var divHtml = '';
                        divHtml = divHtml + ' <div id="divCashAmount1" onclick="SwitchCashAmount(1)"  class="btnselect first"> <span  id="spanCashAmount1" >  <img src="img/myincome/selected.png"></span> <span id ="withdrawAmount1" > ' + withdrawAmounts[1] + ' </span> </div> ';
                        divHtml = divHtml + ' <div id="divCashAmount2" onclick="SwitchCashAmount(2)" > <span  id="spanCashAmount2" hidden> <img src="img/myincome/selected.png"></span> <span id ="withdrawAmount2">' + withdrawAmounts[2] + ' </span> </div> ';
                        divHtml = divHtml + ' <div id="divCashAmount3" onclick="SwitchCashAmount(3)" > <span  id="spanCashAmount3" hidden> <img src="img/myincome/selected.png"></span> <span id ="withdrawAmount3">' + withdrawAmounts[3] + ' </span> </div> ';
                        divHtml = divHtml + ' <div id="divCashAmount4" onclick="SwitchCashAmount(4)" > <span  id="spanCashAmount4" hidden> <img src="img/myincome/selected.png"></span> <span id ="withdrawAmount4">' + withdrawAmounts[4] + ' </span> </div> ';
                        divHtml = divHtml + ' <div id="divCashAmount5" onclick="SwitchCashAmount(5)" > <span  id="spanCashAmount5" hidden> <img src="img/myincome/selected.png"></span> <span id ="withdrawAmount5">' + withdrawAmounts[5] + ' </span> </div> ';
                        divHtml = divHtml + ' <div id="divCashAmount6" onclick="SwitchCashAmount(6)" > <span  id="spanCashAmount6" hidden> <img src="img/myincome/selected.png"></span> <span id ="withdrawAmount6">' + withdrawAmounts[6] + ' </span> </div> ';
                        jQuery("#cashAmount").append(divHtml);
                        CashAmount = withdrawAmounts[1];
                    }
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

    // 取绑定的银行卡微信
    function GetBankWX(thisAccessToken) {
        var result = false;
        var urlData = {
            "knmGameUserService.getBankWX": {}
        }
        $.ajax({
            url: "https://app.2loveyou.com:443/xboot/test/v1/player",
            dataType: "json",
            type: "POST",
            async: false,
            headers: {
                accessToken: thisAccessToken
            },
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(urlData),
            success: function (data) {
                if (data.code === 200) {
                    console.log(data);
                    // 是否绑定银行卡
                    result = data.result.bank_bind;
                    console.log("是否绑定银行卡：" + result);

                } else {
                    console.log(data.code + "--" + data.message);
                }
            }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                console.log(errorThrown);
            }
        })
        return result;
    }

    // 提现
    function Withdraw() {
        // 验证是否绑定银行卡
        var bank_bind = GetBankWX(userTianShen.accessToken);
        console.log(bank_bind);
        if (bank_bind) {
            // 判断余额是否够
            if (balance < CashAmount) {
                alert("餘額不足");
            } else {
                if (CashType === 1) {
                    console.log("余额足");
                    var urlData = {
                        "playerAccountService.withdraw": {
                            money: CashAmount,
                            way: CashType,
                            reward: []
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
                                console.log("提現");
                                console.log(data);
                                var thisbalance = data.result.balance
                                $("#balance").html(thisbalance);
                            } else {
                                console.log(data.code + "--" + data.message);
                            }
                        }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                            console.log(XMLHttpRequest);
                            console.log(textStatus);
                            console.log(errorThrown);
                        }
                    })
                } else {
                    alert("暫未開放");
                }
            }
            console.log("余额" + balance);
            console.log("提现额" + CashAmount);
            console.log("方式" + CashType);

        } else {
            console.log("未绑定银行卡");

            $("#divBankCardBind").show();
        }
    }

    // 绑定银行卡
    function BankCardBind() {
        var swift = $("#swift").val();
        var bank = $("#bank").val();
        var code = $("#code").val();
        var realName = $("#realName").val();
        if (swift && bank && code && realName) {
            if (IsEnglish(realName)) {
                var urlData = {
                    "knmGameUserService.bindBank": {
                        SWIFT: swift,
                        bank: bank,
                        code: code,
                        realName: realName
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
                            console.log(data);
                            CloseBankCard();

                        } else {
                            console.log(data.code + "--" + data.message);
                        }
                    }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                        console.log(XMLHttpRequest);
                        console.log(textStatus);
                        console.log(errorThrown);
                    }
                })
            } else {
                alert("收款人名稱為英文");
            }
        } else {
            alert("請完善銀行卡信息");
        }
    }

    // 判断是否是英文
    function IsEnglish(txt) {
        var re = /^[a-zA-Z]+$/;
        if (!re.test(txt)) {
            return false;
        }
        return true;
    };

    // 关闭绑定银行卡
    function CloseBankCard() {
        $("#divBankCardBind").hide();
    }

    // 切换提现方式
    function SwitchWithdrawType(type) {
        if (type === 1) {
            $("#bank_selected").show();
            $("#bank_type").attr("class", "btnselect");

            $("#payoneer_selected").hide();
            $("#payoneer_type").attr("class", "payoneer");
            CashType = 1;
        } else {
            $("#bank_selected").hide();
            $("#bank_type").attr("class", "payoneer");

            $("#payoneer_selected").show();
            $("#payoneer_type").attr("class", "payoneer btnselect");
            CashType = 3;
        }
    }

    // 切换提现金额
    function SwitchCashAmount(type) {
        switch (type) {
            case 1:
                $("#spanCashAmount1").show();
                $("#spanCashAmount2").hide();
                $("#spanCashAmount3").hide();
                $("#spanCashAmount4").hide();
                $("#spanCashAmount5").hide();
                $("#spanCashAmount6").hide();
                $("#divCashAmount1").attr("class", "btnselect first");
                $("#divCashAmount2").attr("class", "");
                $("#divCashAmount3").attr("class", "");
                $("#divCashAmount4").attr("class", "");
                $("#divCashAmount5").attr("class", "");
                $("#divCashAmount6").attr("class", "");
                CashAmount = $("#withdrawAmount1").text();
                break;
            case 2:
                $("#spanCashAmount2").show();
                $("#spanCashAmount1").hide();
                $("#spanCashAmount3").hide();
                $("#spanCashAmount4").hide();
                $("#spanCashAmount5").hide();
                $("#spanCashAmount6").hide();
                $("#divCashAmount2").attr("class", "btnselect first");
                $("#divCashAmount1").attr("class", "");
                $("#divCashAmount3").attr("class", "");
                $("#divCashAmount4").attr("class", "");
                $("#divCashAmount5").attr("class", "");
                $("#divCashAmount6").attr("class", "");
                CashAmount = $("#withdrawAmount2").text();
                break;
            case 3:
                $("#spanCashAmount3").show();
                $("#spanCashAmount1").hide();
                $("#spanCashAmount2").hide();
                $("#spanCashAmount4").hide();
                $("#spanCashAmount5").hide();
                $("#spanCashAmount6").hide();
                $("#divCashAmount3").attr("class", "btnselect first");
                $("#divCashAmount1").attr("class", "");
                $("#divCashAmount2").attr("class", "");
                $("#divCashAmount4").attr("class", "");
                $("#divCashAmount5").attr("class", "");
                $("#divCashAmount6").attr("class", "");
                CashAmount = $("#withdrawAmount3").text();
                break;
            case 4:
                $("#spanCashAmount4").show();
                $("#spanCashAmount1").hide();
                $("#spanCashAmount2").hide();
                $("#spanCashAmount3").hide();
                $("#spanCashAmount5").hide();
                $("#spanCashAmount6").hide();
                $("#divCashAmount4").attr("class", "btnselect first");
                $("#divCashAmount1").attr("class", "");
                $("#divCashAmount2").attr("class", "");
                $("#divCashAmount3").attr("class", "");
                $("#divCashAmount5").attr("class", "");
                $("#divCashAmount6").attr("class", "");
                CashAmount = $("#withdrawAmount4").text();
                break;
            case 5:
                $("#spanCashAmount5").show();
                $("#spanCashAmount1").hide();
                $("#spanCashAmount2").hide();
                $("#spanCashAmount3").hide();
                $("#spanCashAmount4").hide();
                $("#spanCashAmount6").hide();
                $("#divCashAmount5").attr("class", "btnselect first");
                $("#divCashAmount1").attr("class", "");
                $("#divCashAmount2").attr("class", "");
                $("#divCashAmount3").attr("class", "");
                $("#divCashAmount4").attr("class", "");
                $("#divCashAmount6").attr("class", "");
                CashAmount = $("#withdrawAmount5").text();
                break;
            case 6:
                $("#spanCashAmount6").show();
                $("#spanCashAmount1").hide();
                $("#spanCashAmount2").hide();
                $("#spanCashAmount3").hide();
                $("#spanCashAmount4").hide();
                $("#spanCashAmount5").hide();
                $("#divCashAmount6").attr("class", "btnselect first");
                $("#divCashAmount1").attr("class", "");
                $("#divCashAmount2").attr("class", "");
                $("#divCashAmount3").attr("class", "");
                $("#divCashAmount4").attr("class", "");
                $("#divCashAmount5").attr("class", "");
                CashAmount = $("#withdrawAmount6").text();
                break;

        }
    }

    /**
    * post 现金兑换
    * @param money 兑换金额
    * @param diamonds 兑换所需钻石
    * @param limit_type 提现限制类型（1每天限制换一次，2每天限制不超过￥100）
    * @param return { diamonds:用户钻石数, balance:兑换后的余额 }
    */
    function CashExchange() {
        var money = $("#diamondNum").val();
        // 不为空
        if (!money) {
            alert("不能為空值");
            return;
        }
        // 1-100验证
        var reg = new RegExp("^([1-9]|[1-9]\\d|100)$");
        if (!reg.test(money)) {
            alert("請輸入1-100的整數");
            return;
        }

        if (diamond_rate === 0) {
            diamond_rate = 10000;
        }
        var changeDiamonds = money * diamond_rate;
        // 判断钻石是否足够
        if (changeDiamonds > diamonds) {
            alert("鉆石不足");
            return;
        }

        var limit_type = 2;
        var urlData = {
            "playerAccountService.diamond2dollar": {
                money: money,
                diamonds: changeDiamonds,
                limit_type: limit_type
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
                    console.log(data);
                    balance = data.result.balance;
                    diamonds = data.result.diamonds;
                    $("#balance").html(balance);
                    // 钻石钱包
                    var usdRate = (diamonds / diamond_rate).toFixed(4);
                    var divDiamonds = '';
                    divDiamonds = diamonds + '<img src="img/myincome/redpacket/zuan.png" class="diamond-icon">(=$' + usdRate + ')';
                    $("#diamonds").html(divDiamonds);
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
    /**
     * post 钻石投资(限时开放，按钮disabled，点击事件未加此方法)
     * @param player_id 
     * @param diamonds 投资钻石数量
     * @param return { diamonds:用户钻石数, invested:已投资钻石数 }
     */
    function DiamondInvested() {
        var diamondInvestedNum = $("#diamondInvestedNum").val();
        // 不为空
        if (!diamondInvestedNum) {
            alert("不能為空值");
            return;
        }
        // 正整数验证
        var reg = /^[1-9]\d*$/;
        if (!reg.test(diamondInvestedNum)) {
            alert("請輸入大於0的整數");
            return;
        }
        // 判断钻石是否足够
        if (diamondInvestedNum > diamonds) {
            alert("鉆石不足");
            return;
        }
        var urlData = {
            "playerAccountService.diamondInvest": {
                player_id: userTianShen.playerId,
                diamonds: diamondInvestedNum
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
                    console.log(data);
                    diamonds = data.result.diamonds;
                    // 钻石钱包
                    var usdRate = (diamonds / diamond_rate).toFixed(4);
                    var divDiamonds = '';
                    divDiamonds = diamonds + '<img src="img/myincome/redpacket/zuan.png" class="diamond-icon">(=$' + usdRate + ')';
                    $("#diamonds").html(divDiamonds);
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
    /**
    * post 领取今日钻石投资收益
    * @param diamonds 今日钻石投资收益
    * @param return { diamonds:用户钻石数 income:222 //今日收益}
    */
    function GetDailyInvest() {
        if (activity < 1) {
            alert("活躍度≤0時，不可以領取利息");
            return;
        }

        var urlData = {
            "playerAccountService.diamondInterest": {
                diamonds: today_interest
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
                    console.log(data);
                    diamonds = data.result.diamonds;
                    // 钻石钱包
                    var usdRate = (diamonds / diamond_rate).toFixed(4);
                    var divDiamonds = '';
                    divDiamonds = diamonds + '<img src="img/myincome/redpacket/zuan.png" class="diamond-icon">(=$' + usdRate + ')';
                    $("#diamonds").html(divDiamonds);
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
