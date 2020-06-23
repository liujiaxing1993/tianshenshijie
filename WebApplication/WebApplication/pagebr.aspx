<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="page.aspx.cs" Inherits="WebApplication.page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

    <link rel="icon" href="favicon.ico" />
    <link rel="stylesheet" href="css/sitebr.css" />
    <title>Tenjin World</title>
    <script src="js/jquery-2.2.4.min.js"></script>

    <meta property="og:site_name" content="www.tianshenshijie.com" />
    <meta property="og:title" content="Tenjin World——Ganhar dinheiro nunca foi tão divertido" />
    <meta property="og:description" content="Tenjin World——Ganhar dinheiro nunca foi tão divertido" />
    <meta property="og:type" content="article" />
    <meta property="article:author" content="https://www.facebook.com/TenjinWorld/" />
    <meta property="og:image" content="https://nothingdb.oss-cn-hongkong.aliyuncs.com/vip/null_w322f2u9.jpg" />
    <meta property="fb:app_id" content="3043813872350493" />
</head>
<body>
    <form id="Form1" runat="server">
        <input type="hidden" runat="server" id="vid" />
    </form>
    <div id="tishi" class="top-tip">Por favor, visite com celurar</div>

    <div class="main">
        <div class="scroll-list">
            <div class="scrollup">
                <div class="withdraw-text">
                    <p>Ana**Solicitou<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Vera**Solicitou<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Sofia**Solicitou<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>João**Solicitou<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Ricardo**Solicitou<span>$100.00</span></p>
                </div>

                <div class="withdraw-text">
                    <p>Tiago**Solicitou<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>André**Solicitou<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Alex**Solicitou<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Bruna****Solicitou<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Bruno****Solicitou<span>$100.00</span></p>
                </div>

                <div class="withdraw-text">
                    <p>Italo****Solicitou<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Sérgio**Solicitou<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Thiago**Solicitou<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Olivia**Solicitou<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Teresa**Solicitou<span>$100.00</span></p>
                </div>

                <div class="withdraw-text">
                    <p>Jessica**Solicitou<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Carlos**Solicitou<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Henrique**Solicitou<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Liliana**Solicitou<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Alice**Solicitou<span>$100.00</span></p>
                </div>

            </div>
        </div>
        <div id="diglogLogin" class="mask" style="">
            <div class="dialog-login">
                <div class="dialog-login-bg">
                    <span class="close-g" onclick="setIdDisplay('diglogLogin','none')"></span>
                    <img class="text" src="img/br/d-login-text.png" />

                    <div class="fb-login-btn">
                        <div id="fb-root_login">
                            <div class="fb-login-button" data-width="" data-size="medium" data-button-type="continue_with"
                                data-auto-logout-link="false" data-use-continue-as="true" onlogin="statusChangeCallback">
                            </div>
                        </div>
                        <p>
                            Login para receber recompensa surpresa
                        </p>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div id="download" class="mask" style="display: none;">
        <%--        非手机访问时显示调试--%>
        <div class="dialog-download">
            <span class="close-g" onclick="setIdDisplay('download','none')"></span>
            <img class="game-avatar" src="img/applogo.jpg" />
            <h2>Download Tenjin World<br>
                e comece sua jornada de ganhar dinheiro imediatamente</h2>
            <div class="down-btn">
                <button onclick="downJump()"></button>
                <p>Vá a APP para receber recompensa</p>
            </div>
        </div>
    </div>

    <%--        非手机访问时显示调试--%>
    <%--  <div class="apple_download">
        <span class="close-g" onclick="setIdDisplay('download','none')"></span>
        <img class="game-avatar" src="img/applogo.jpg" />
        <h2>下載Tenjin World<br>
            立刻開啟你的躺賺之旅</h2>
        <div class="down-btn">
            <button></button>
            <p>蘋果應用正在飛奔向你趕來 </p>
        </div>
    </div>--%>

    <div id="fb-like" class="fb-like" data-href="https://www.facebook.com/TenjinWorld/" data-width=""
        data-layout="button_count" data-action="like" data-size="small" data-share="true">
    </div>
    <div id="logo" class="logo">
        <img src="img/br/logo.png">
    </div>
    <div class="banner"></div>
    <div id="rank1" class="board-list show dialog gogogo">
        <h1 class="title">
            <img src="img/title.png">
            Ranking de saque
                <img src="img/title.png" class="right">
            <span class="close" onclick="setIdDisplay('rank1','none')"></span>
        </h1>
        <table>
            <tr>
                <th>Ranking</th>
                <th>Nome</th>
                <th>Dinheiro retirado</th>
            </tr>
            <tr>
                <td align="center">
                    <img class="crown" src="img/no-1.png"></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/1.jpg">
                    </div>
                    <span class="name">Vera**</span>
                </td>
                <td align="right" class="text-money">$500.00</td>
            </tr>
            <tr>
                <td align="center">
                    <img class="crown" src="img/no-2.png"></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/9.jpg">
                    </div>
                    <span class="name">Bruno**</span>
                </td>
                <td align="right" class="text-money">$500.00</td>
            </tr>
            <tr>
                <td align="center">
                    <img class="crown" src="img/no-3.png"></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/3.jpg">
                    </div>
                    <span class="name">Olivia**</span>
                </td>
                <td align="right" class="text-money">$500.00</td>
            </tr>
            <tr>
                <td align="center"><span class="num">4</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/2.jpg">
                    </div>
                    <span class="name">André****</span>
                </td>
                <td align="right" class="text-money">$500.00</td>
            </tr>
            <tr>
                <td align="center"><span class="num">5</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/4.jpg">
                    </div>
                    <span class="name">João**</span>
                </td>
                <td align="right" class="text-money">$300.00</td>
            </tr>
            <tr>
                <td align="center"><span class="num">6</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/5.jpg">
                    </div>
                    <span class="name">Tiago**</span>
                </td>
                <td align="right" class="text-money">$300.00</td>
            </tr>
            <tr>
                <td align="center"><span class="num">7</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/6.jpg">
                    </div>
                    <span class="name">Carlos****</span>
                </td>
                <td align="right" class="text-money">$300.00</td>
            </tr>
            <tr>
                <td align="center"><span class="num">8</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/7.jpg">
                    </div>
                    <span class="name">Italo**</span>
                </td>
                <td align="right" class="text-money">$300.00</td>
            </tr>
            <tr>
                <td align="center"><span class="num">9</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/8.jpg">
                    </div>
                    <span class="name">Liliana****</span>
                </td>
                <td align="right" class="text-money">$300.00</td>
            </tr>
            <tr>
                <td align="center"><span class="num">10</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/10.jpg">
                    </div>
                    <span class="name">Sérgio****</span>
                </td>
                <td align="right" class="text-money">$200.00</td>
            </tr>
        </table>
    </div>
    <div id="rank2" class="board-list dialog gogogo">
        <h1 class="title">
            <img src="img/title.png">
            Ranking dos amigos
                <img src="img/title.png" class="right">
            <span class="close" onclick="setIdDisplay('rank2','none')"></span>
        </h1>
        <table>
            <thead>
                <tr>
                    <th>Ranking</th>
                    <th>Nome</th>
                    <th>Amigos convidados</th>
                </tr>
            </thead>
            <tr>
                <td align="center">
                    <img class="crown" src="img/no-1.png"></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/1.jpg">
                    </div>
                    <span class="name">Henrique**</span>
                </td>
                <td align="right" class="text-buddy">5036</td>
            </tr>
            <tr>
                <td align="center">
                    <img class="crown" src="img/no-2.png"></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/11.jpg">
                    </div>
                    <span class="name">Jessica****</span>
                </td>
                <td align="right" class="text-buddy">4960</td>

            </tr>
            <tr>
                <td align="center">
                    <img class="crown" src="img/no-3.png"></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/12.jpg">
                    </div>
                    <span class="name">Teresa**</span>
                </td>
                <td align="right" class="text-buddy">4703</td>

            </tr>
            <tr>
                <td align="center"><span class="num">4</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/13.jpg">
                    </div>
                    <span class="name">Olivia****</span>
                </td>
                <td align="right" class="text-buddy">4701</td>

            </tr>
            <tr>
                <td align="center"><span class="num">5</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/14.jpg">
                    </div>
                    <span class="name">Thiago**</span>
                </td>
                <td align="right" class="text-buddy">4518</td>
            </tr>
            <tr>
                <td align="center"><span class="num">6</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/15.jpg">
                    </div>
                    <span class="name">Sérgio**</span>
                </td>
                <td align="right" class="text-buddy">4511</td>
            </tr>
            <tr>
                <td align="center"><span class="num">7</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/16.jpg">
                    </div>
                    <span class="name">Italo****</span>
                </td>
                <td align="right" class="text-buddy">4510</td>

            </tr>
        </table>
    </div>
    <div class="bottom">
        <div class="board-button">
            <ul>
                <li id="button1" class="tab-button" onclick="clickRank('1')"><i>
                    <img
                        src="img/withdraw.png"></i>Ranking de saque</li>
                <li id="button2" class="tab-button" onclick="clickRank('2')"><i>
                    <img src="img/buddy.png"></i>Ranking dos amigos
                </li>
            </ul>
        </div>
        <div class="fb-login">
            <div id="fb-root">
                <div class="fb-login-button" data-width="" data-size="large" data-button-type="continue_with"
                    data-auto-logout-link="false" data-use-continue-as="true" onlogin="statusChangeCallback">
                </div>
            </div>
            <div id="ggg"
                style="display: none; width: 100%; color: aliceblue; text-align: center; font-size: 22px; line-height: 40px;"
                onclick="downJump()">
                Download Tenjin World APP
            </div>
        </div>
        <div class="tip">
            <img src="img/help.png">Login com o Facebook, Interaja com amigos
        </div>
    </div>
</body>
<script>
    //获取会员ID 
    document.getElementById("vid").value = document.location.hash;

    var urlStr = "https://www.tianshenshijie.com/pagebr.aspx";
    var jurl = document.location.search + document.location.hash;
    if (jurl == "") {
        console.log("滴滴滴滴")
        location.href = urlStr + "?pid=960#QJ22113";
    } else {
        if (document.location.hash.indexOf("VIP888") != -1) {
            location.href = urlStr + "?pid=960#QJ22113";
        } else {
            if (document.location.hash == "") {
                location.href = urlStr + document.location.search + "#QJ22113";
            }
        }
    }
    // 判断安卓
    function isAndroid() {
        var u = navigator.userAgent;
        if (u.indexOf("Android") > -1 || u.indexOf("Linux") > -1) {
            return true;
        }
        return false;
    }
    // 判断设备为 ios
    function isIos() {
        var u = navigator.userAgent;
        if (u.indexOf("iPhone") > -1 || u.indexOf("iOS") > -1) {
            return true;
        }
        return false;
    }
    function urlJump() {
        if (isIos()) {
            alert("APP da Apple está em revisão, por favor fique atento");
            //return "https://apps.apple.com/hk/app/id1504376912?l=zh&ls=1";
            return "#";
        }
        else if (isAndroid()) return "https://play.google.com/store/apps/details?id=com.asiaxokj.tssj";
        else return "Aproveite ganho depois do sono, pode ganhar dinheiro jogando";
    }

    function setIdDisplay(id, active) {
        document.getElementById(id).style.display = active;

    }

    function clickRank(idx) {
        var order = idx == '1' ? '2' : '1';
        setIdDisplay('rank' + idx, 'block');
        setIdDisplay('rank' + order, 'none');
        document.getElementById('button' + idx).className = 'tab-button active';
        document.getElementById('button' + order).className = 'tab-button';
    }



    // This is called with the results from from FB.getLoginStatus().
    function statusChangeCallback(response, islogin) {
        console.log('statusChangeCallback');
        console.log(response.name);
        // The response object is returned with a status field that lets the
        // app know the current login status of the person.
        // Full docs on the response object can be found in the documentation
        // for FB.getLoginStatus().
        if (response.status === 'connected') {
            console.log(response.status)
            // Logged into your app and Facebook.
            testAPI(response, islogin);
            if (islogin) {

            } else {
                //Location
            }
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
            statusChangeCallback(response, true);
        });
    }




    window.fbAsyncInit = function () {
        FB.init({
            appId: '3043813872350493',
            status: true,
            cookie: true,  // enable cookies to allow the server to access
            // the session
            xfbml: false,  // parse social plugins on this page
            version: 'v6.0' // use graph api version 2.8
        });


        // document.getElementById('facebook').onclick = function () {//登录
        //     FB.login(function (response) {
        //         if (response.status === 'connected') {
        //             $("#facebook").css("display", "none")
        //             $("#fbLike").css("display", "block")
        //             FB.api('/me', function (response) {
        //                 roleName = encodeURIComponent(response.name);
        //                 FB.getLoginStatus(function (response) {
        //                     statusChangeCallback(response);
        //                 });
        //             });

        //         } else {
        //             console.log('该用户没有登录成功');
        //         }
        //     }, { scope: 'public_profile,email' });
        // };
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
            statusChangeCallback(response, true);
        });

    };
    function GetRequest() {
        var url = location.search; //获取url中"?"符后的字串
        var theRequest = new Object();
        if (url.indexOf("?") != -1) {
            var str = url.substr(1);
            strs = str.split("&");
            for (var i = 0; i < strs.length; i++) {
                theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
            }
        }

        //处理#后参数
        var strDbid = document.getElementById("vid").value;
        var strId;
        if (strDbid.indexOf("/") != -1) {
            strId = strDbid.split("/");
        } else {
            strId = (strDbid + "/").split("/");
        }
        theRequest.invite = strId.length > 0 ? strId[0] : null;
        theRequest.happyCode = strId.length > 1 ? strId[1] : null;
        if (theRequest.invite == "#VIP888") {
            theRequest.invite = "#QJ22113";
        }
        console.log("Len:" + theRequest.invite + "Xxx:" + theRequest.happyCode);

        return theRequest;
    }
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

    // Here we run a very simple test of the Graph API after login is
    // successful.  See statusChangeCallback() for when this call is made.

    function downJump(islogin) {
        var urlJ = urlJump();
        console.log(urlJ);
        if (isIos() || isAndroid()) {
            if (islogin) {
            } else {
                location.href = urlJ;
            }
        } else {
            console.log(urlJ);
            alert("Por favor, visite com celurar");
        }
    }
    function testAPI(loginInfo, islogin) {
        setIdDisplay('download', 'block')
        setIdDisplay('diglogLogin', 'none')//
        setIdDisplay('ggg', 'block')
        setIdDisplay('fb-root', 'none')
        FB.api(
            '/me',
            'GET',
            { "fields": "id,name,picture" },
            function (response) {
                var urlParam = GetRequest();
                if (urlParam.invite) {
                    var urlData = {
                        facebookHeadUrl: response.picture.data.url,
                        facebookNickName: response.name,
                        inviteCode: urlParam.invite.replace("#", ""),
                        facebookId: response.id,
                        facebookToken: loginInfo.authResponse.accessToken
                    }
                    var facebookHeadUrl
                    try {
                        facebookHeadUrl = response.picture.data.url
                    } catch (error) {

                    }
                    if (facebookHeadUrl) {
                        urlData.facebookHeadUrl = facebookHeadUrl;
                    }
                    if (urlParam.happy) {
                        urlData.happyCode = urlParam.happy;
                    }
                    console.log(urlData.facebookHeadUrl + "|" + urlData.facebookId + "|" + urlData.facebookNickName + "|" + urlData.facebookToken + "|" + urlData.inviteCode + "|" + urlData.happyCode);
                    $.ajax({
                        url: "https://pt.2loveyou.com:443/xboot/test/v1/initWeb",
                        dataType: "json",
                        type: "POST",
                        contentType: 'application/json;charset=UTF-8',
                        data: JSON.stringify(urlData),
                        success: function (data) {
                            console.log(data.message);
                            downJump(islogin);
                        }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                            console.log(XMLHttpRequest);
                            console.log(textStatus);
                            console.log(errorThrown);
                        }
                    })
                }
            }
        );
    }

    console.log(isIos() + "||" + isAndroid());

    if (isAndroid() || isIos()) {
        document.getElementById("tishi").style.display = "none";
        document.getElementById("fb-like").className = "fb-like";
        document.getElementById("logo").className = "logo";
    } else {
        document.getElementById("fb-like").className = "fb-like top40";
        document.getElementById("logo").className = "logo top40";
    }
    //alert(isIos());
    if (isAndroid()) {
        SendEnjoyData();
    }
    // 欢享网提交数据的接口
    function SendEnjoyData() {
        var fid = location.hash.replace("#", "");
        var gid = "3043813872350493";
        var qid = location.search.replace("?pid=", "");
        var userid = 0;
        console.log("fid=" + fid + " qid=" + qid);

        var sendUrl = "https://stat.fbquickgames.com/stat/in";

        if (fid && qid) {
            // 判断fid是否是数字
            if (!isNaN(fid)) {
                console.log("是数字");
                var isSend = getCookie("userSendEnjoy");
                if (isSend == "send") {
                    console.log("发送了");
                } else {
                    $.get(sendUrl, { fid: fid, gid: gid, qid: qid, userid: userid }, function (data) {
                        console.log("欢享网提交数据的接口: " + data);
                        setCookie("userSendEnjoy", "send", 1);
                    }, "text");
                }

            } else {
                console.log("不是数字");
            }

        } else {
            console.log("数据为空");
        }
    }

    // 设置cookie   
    function setCookie(c_name, value, expiredays) {
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + expiredays);
        document.cookie = c_name + "=" + escape(value) + ";expires=" + exdate.toGMTString();
        path = "/";
    }

    // 读取cookie   
    function getCookie(c_name) {
        if (document.cookie.length > 0) {
            c_start = document.cookie.indexOf(c_name + "=")
            if (c_start != -1) {
                c_start = c_start + c_name.length + 1
                c_end = document.cookie.indexOf(";", c_start)
                if (c_end == -1)
                    c_end = document.cookie.length
                return unescape(document.cookie.substring(c_start, c_end))
            }
        }
        return ""
    }
</script>

<script async defer crossorigin="anonymous"
    src="https://connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v6.0&appId=3043813872350493&autoLogAppEvents=1"></script>
<script src="https://count.xxxssk.com?1216"></script>

</html>
