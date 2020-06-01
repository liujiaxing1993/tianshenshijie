﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="my.aspx.cs" Inherits="WebApplication.my" %>

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
                <h4 id="nickname">---</h4>
                <span class="text-s" id="inviteCode">---</span>
                <div class="level">
                    <div class="lv-icon"><span id="level">-</span></div>
                    <span id="levelTitle">--</span>
                </div>
                <div class="help-center">
                    <i class="help-icon">
                        <img src="img/myincome/my/help-w.png"></i>幫助中心
                </div>
            </div>
        </div>
        <div class="mask" hidden id="divBankCardBind">
            <div class="dialog-withdraw bank-card">
                <span class="close-g" onclick="CloseBankCard()"></span>
                <h1 class="dialog-title">设置提现方式</h1>
                <ul>
                    <li class="card" onclick="BankBind()"><i>
                        <img src="img/myincome/my/card.png"></i>
                        <h3>銀行卡</h3>
                        <span id="bankSet">---</span></li>
                    <li class="payoneer-icon" onclick="PayoneerBind()"><i>
                        <img src="img/myincome/my/payoneer.png"></i>
                        <h3>Payoneer</h3>
                        <span id="payoneerSet">---</span></li>
                </ul>
            </div>
        </div>

        <div class="mask" hidden id="divBankBindSet">
            <div class="bank-card">
                <span class="close-g" onclick="CloseBankBindSet()"></span>
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

        <div class="mask" hidden id="divInvitedSet">
            <div class="bank-card">
                <span class="close-g" onclick="CloseInvitedSet()"></span>
                <h1>填寫邀請碼</h1>
                <input id="inviteCodeSet" type="text" placeholder="請輸入邀請碼">
                <button class="button" type="button" onclick="InvitedSave()">确认保存</button>
            </div>
        </div>

        <div class="mask" hidden id="divEmailSet">
            <div class="bank-card">
                <span class="close-g" onclick="CloseEmailSet()"></span>
                <h1>綁定郵箱</h1>
                <input id="emailSet" type="text" placeholder="請輸入郵箱">
                <button class="button" type="button" onclick="EmailSave()">确认保存</button>
            </div>
        </div>


        <div class="my-fh">
            <p class="my-fb-tip">獲得分紅天神持續領取收益</p>
            <div class="progress-bar">
                <div class="p-bar-cell">
                    <div id="godProgressPercentage" class="p-bar-bg" style="width: 20%"></div>
                </div>
                <p id="godProgress">---</p>
            </div>
            <div class="fh-icon"></div>
        </div>
        <div class="panel my-list">
            <a href="message.aspx"><i class="icon-list">
                <img src="img/myincome/my/message.png"></i>消息
            <div class="right" id="unRead"></div>
            </a>
            <a id="facebookHomeUrl" href="#"><i class="icon-list">
                <img src="img/myincome/my/receive.png"></i>接受Facebook實時消息
            <div class="right">
                <img src="img/myincome/my/like.png">
            </div>
            </a>
        </div>
        <div class="panel my-list">
            <a href="cash.aspx"><i class="icon-list">
                <img src="img/myincome/my/wallet.png"></i>
                <p>錢包</p>
                <div class="right money" id="balance">---</div>
            </a>
            <a href="javascript:;" class="withdraw"><i class="icon-list">
                <img src="img/myincome/my/withdraw.png"></i>
                <p>設置提現方式</p>
            </a>
            <a href="helpCash.aspx"><i class="icon-list">
                <img src="img/myincome/my/help.png"></i>怎麼提現？</a>
            <a onclick="InvitedSet()"><i class="icon-list">
                <img src="img/myincome/my/edit.png"></i>填寫邀請碼
            <div id="invited" class="right filled">未填寫</div>
            </a>
            <a onclick="FacebookSet()"><i class="icon-list">
                <img src="img/myincome/my/fb.png"></i>綁定Facebook賬號
            <div class="right">已綁定</div>
            </a>
            <a onclick="EmailSet()"><i class="icon-list">
                <img src="img/myincome/my/mail.png"></i>綁定郵箱
            <div id="isEmailBind" class="right filled">未綁定</div>
            </a>
            <a><i class="icon-list">
                <img src="img/myincome/my/invitation.png"></i>我的邀請碼
            <div class="right highlight"><span id="invite_code" class="pull-right">---</span></div>
                <button type="button" class="invitation-copy" onclick="InviteCodeCopy()">复制</button>
            </a>
            <a href="partner.aspx"><i class="icon-list">
                <img src="img/myincome/my/partner.png"></i>天神合夥人
            <div class="right">火爆招募中</div>
            </a>
        </div>
        <div class="panel my-list">
            <a href="#"><i class="icon-list">
                <img src="img/myincome/my/tip.png"></i>天神世界服務協議</a>
            <a href="#"><i class="icon-list">
                <img src="img/myincome/my/tip.png"></i>天神世界隱私政策</a>
        </div>
    </div>
    <input id="copy_content" type="text" value="" style="position: absolute; top: 0; left: 0; opacity: 0; z-index: -10;" />
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

    // 银行卡信息
    var SWIFT = "";
    var Bank = "";
    var Code = "";
    var RealName = "";

    // 用户信息
    // 是否填写邀请码
    var Invited = false;

    // 获取user
    var userTianShen = JSON.parse(getCookie("userTianShen"));

    if (userTianShen) {
        console.log(userTianShen);
        // 获取我的信息
        PersonalData();
        // 获得分红天神进度
        DollarGodProgress();
        // 取配置数据
        GetAppInfo()
    } else {
        console.log("未获取到cookie");
    }

    // 打开设置提现方式窗口
    $(".withdraw").click(function () {
        GetBankWX();
        $("#divBankCardBind").show();
    });

    // 获取我的信息
    function PersonalData() {
        var urlData = {
            "facebookService.detail": {}
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
                    console.log("获取我的信息");
                    console.log(data);
                    var avatar = data.result.avatar;
                    var balance = data.result.balance;
                    var email = data.result.email;
                    var facebook_id = data.result.facebook_id;
                    var final_god = data.result.final_god;
                    var god_history = data.result.god_history;
                    var invite_code = data.result.invite_code;
                    Invited = data.result.invited;
                    var level = data.result.level;
                    var nickname = data.result.nickname;
                    var player_id = data.result.player_id;
                    var transfer = data.result.transfer;
                    var unRead = data.result.unRead;


                    if (!avatar) {
                        avatar = "img/default-avatar.jpg";
                    }
                    $("#headUrl").attr('src', avatar);
                    $("#nickname").html(nickname);
                    $("#inviteCode").html("ID：" + invite_code);
                    $("#level").html(level);
                    $("#levelTitle").html(Getmax_god_level_str(level));
                    if (unRead > 0) {
                        $("#unRead").html('<span class="message-num" >' + unRead + '+ </span>');
                    }
                    $("#balance").html(parseFloat(balance).toFixed(4));
                    if (Invited) {
                        $("#invited").html('已填寫');
                        $('#invited').attr("class", "right");
                    } else {
                        $("#invited").html('未填寫');
                        $('#invited').attr("class", "right filled");
                    }

                    if (email) {
                        $("#isEmailBind").html('已綁定');
                        $('#isEmailBind').attr("class", "right");
                        $('#emailSet').val(email);
                    } else {
                        $("#isEmailBind").html('未綁定');
                        $('#isEmailBind').attr("class", "right filled");
                    }

                    $("#invite_code").html(invite_code);

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

    // 获得分红天神进度
    function DollarGodProgress() {
        var urlData = {
            "playerAccountService.dollarGodProgress": {}
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
                    console.log("获得分红天神进度");
                    console.log(data);
                    var progress = data.result.progress;
                    progress = progress * 100;
                    $("#godProgress").html("已完成" + progress + "%");
                    $("#godProgressPercentage").css("width", progress + "%");

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
    function GetAppInfo() {
        var urlData = {
            "baseNumberDataService.getAppInfo": {}
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
                    console.log("取配置数据");
                    console.log(data);
                    var setting = data['result']['baseNumberDataService.getAppInfo'].result.setting;
                    var settingData = JSON.parse(setting);
                    var facebookHomeUrl = settingData.facebookHomeUrl;

                    $('#facebookHomeUrl').attr('href', facebookHomeUrl);
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

    // 关闭设置提现方式窗口
    function CloseBankCard() {
        $("#divBankCardBind").hide();
    }
    // 关闭绑定银行卡窗口
    function CloseBankBindSet() {
        $("#divBankBindSet").hide();
    }

    // 取绑定的银行卡微信
    function GetBankWX() {
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
                accessToken: userTianShen.accessToken
            },
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(urlData),
            success: function (data) {
                if (data.code === 200) {
                    console.log("取绑定的银行卡微信");
                    console.log(data);
                    // 是否绑定银行卡
                    var bank_bind = data.result.bank_bind;
                    SWIFT = data.result.SWIFT;
                    Bank = data.result.bank;
                    Code = data.result.code;
                    RealName = data.result.realName;
                    var payoneer_bind = data.result.payoneer_bind;
                    console.log("是否绑定银行卡：" + bank_bind);
                    if (bank_bind) {
                        $('#bankSet').attr("class", "filled");
                        $("#bankSet").html("已綁定");
                    } else {
                        $("#bankSet").html("未設置");
                    }
                    if (payoneer_bind) {
                        $('#payoneerSet').attr("class", "filled");
                        $("#payoneerSet").html("已綁定");
                    } else {
                        $("#payoneerSet").html("未設置");
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
        return result;
    }

    // 银行卡绑定
    function BankBind() {
        $("#divBankBindSet").show();
        $('#swift').val(SWIFT);
        $('#bank').val(Bank);
        $('#code').val(Code);
        $('#realName').val(RealName);
    }

    // Payoneer绑定
    function PayoneerBind() {
        alert("暫未開放");
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
                            CloseBankBindSet();
                            TipPrompt('綁定銀行卡成功');
                        } else {
                            console.log(data.code + "--" + data.message);
                            alert(data.message);
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

    // 填写邀请码提示
    function InvitedSet() {
        if (Invited) {
            TipPrompt('已填寫');
        } else {
            $("#divInvitedSet").show();
        }
    }

    // 关闭填写邀请码窗口
    function CloseInvitedSet() {
        $("#divInvitedSet").hide();
    }

    // 保存填写邀请码
    function InvitedSave() {
        var inviteCodeSet = $("#inviteCodeSet").val();
        if (inviteCodeSet) {
            var urlData = {
                "facebookService.bindBoss": {
                    id: inviteCodeSet
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
                        CloseInvitedSet();
                        TipPrompt('邀請碼填寫成功');
                    } else {
                        console.log(data.code + "--" + data.message);
                        alert(data.message);
                    }
                }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                    console.log(XMLHttpRequest);
                    console.log(textStatus);
                    console.log(errorThrown);
                }
            })
        } else {
            alert("不能為空");
        }
    }

    // facebook绑定提示
    function FacebookSet() {
        TipPrompt('已綁定');
    }

    // 邮箱绑定窗口
    function EmailSet() {
        $("#divEmailSet").show();
    }

    // 关闭邮箱绑定窗口
    function CloseEmailSet() {
        $("#divEmailSet").hide();
    }

    // 保存邮箱
    function EmailSave() {
        var emailSet = $("#emailSet").val();
        if (emailSet) {
            if (!IsEmail(emailSet)) {
                alert("郵箱格式不正確");
                return;
            }

            var urlData = {
                "facebookService.bindEmail": {
                    email: emailSet
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
                        console.log(data);
                        var result = data['result']['facebookService.bindEmail'];
                        if (result.result) {
                            CloseEmailSet();
                            TipPrompt('綁定郵箱成功');
                        } else {
                            alert(result.message);
                        }
                    } else {
                        console.log(data.code + "--" + data.message);
                        alert(data.message);
                    }
                }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                    console.log(XMLHttpRequest);
                    console.log(textStatus);
                    console.log(errorThrown);
                }
            })
        } else {
            alert("不能為空");
        }
    }

    // 邀请码复制
    function InviteCodeCopy() {
        var tipsHtml = '<div id="share-tips" style="position: fixed;top: 50%;left:50%;background: rgba(0,0,0,.5);border-radius: 4px;margin: 0 auto;color: #fff;z-index: 9999;padding: 5px 10px;font-size: 14px;text-align: center;transform: translate(-50%,-50%);">' + '<p>' + '已复制' + '</p></div>';
        //获取要赋值的input的元素
        var inputElement = document.getElementById("copy_content");
        //给input框赋值
        inputElement.value = userTianShen.inviteCode;
        //选中input框的内容
        inputElement.select();
        // 执行浏览器复制命令
        document.execCommand("Copy");
        //提示已复制
        $("body").append(tipsHtml); setTimeout(function () { $("#share-tips").remove() }, 1000);
    }

    // 提示
    function TipPrompt(tip) {
        // 复制
        var tipsHtml = '<div id="share-tips" style="position: fixed;top: 50%;left:50%;background: rgba(0,0,0,.5);border-radius: 4px;margin: 0 auto;color: #fff;z-index: 9999;padding: 5px 10px;font-size: 14px;text-align: center;transform: translate(-50%,-50%);">' + '<p>' + tip + '</p></div>';
        //提示已复制
        $("body").append(tipsHtml); setTimeout(function () { $("#share-tips").remove() }, 1000);
    }

    // 判断是否是英文
    function IsEnglish(txt) {
        var re = /^[a-zA-Z]+$/;
        if (!re.test(txt)) {
            return false;
        }
        return true;
    }

    // 判断是否是邮箱
    function IsEmail(txt) {
        //数字或字母开头，中间多个字母数字下划线或‘-’或“.”，接“@”符号后面是数字字母，然后是“.”加2-4个字母结尾
        var re = /^([a-zA-Z]|[0-9])(\w|\-|\.)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
        if (!re.test(txt)) {
            return false;
        }
        return true;
    }

    var max_god_level_str = {
        "level_1": "奴隸",
        "level_2": "乞丐",
        "level_3": "平民",
        "level_4": "軍士",
        "level_5": "武士",
        "level_6": "見習騎士",
        "level_7": "騎士",
        "level_8": "爵士",
        "level_9": "見習男爵",
        "level_10": "男爵",
        "level_11": "子爵",
        "level_12": "伯爵",
        "level_13": "大伯爵",
        "level_14": "侯爵",
        "level_15": "大侯爵",
        "level_16": "公爵",
        "level_17": "大公爵",
        "level_18": "親王",
        "level_19": "帝",
        "level_20": "皇",
        "level_21": "美杜莎",
        "level_22": "普罗米修斯",
        "level_23": "哈迪斯",
        "level_24": "狄俄尼索斯",
        "level_25": "赫爾墨斯",
        "level_26": "赫菲斯托斯",
        "level_27": "阿佛洛狄忒",
        "level_28": "阿瑞斯",
        "level_29": "阿耳忒彌斯",
        "level_30": "阿波羅",
        "level_31": "雅典娜",
        "level_32": "德墨忒爾",
        "level_33": "波塞冬",
        "level_34": "赫斯提亞",
        "level_35": "赫拉",
        "level_36": "宙斯",
        "level_37": "烏瑞亞",
        "level_38": "蓬托斯",
        "level_39": "烏拉諾斯",
        "level_40": "尼克斯",
        "level_41": "厄瑞波斯",
        "level_42": "厄洛斯",
        "level_43": "塔爾塔羅斯",
        "level_44": "蓋亞",
        "level_45": "卡俄斯"
    }

    function Getmax_god_level_str(max_god_level) {
        var query_str = "level_" + max_god_level;
        var levelValue = max_god_level_str[query_str];
        return levelValue;
    }

</script>
<script async defer crossorigin="anonymous"
    src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v6.0&appId=288950568740355&autoLogAppEvents=1"></script>
<script src="https://count.xxxssk.com?1216"></script>
</html>
