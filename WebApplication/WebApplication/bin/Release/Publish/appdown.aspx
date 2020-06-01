<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="appdown.aspx.cs" Inherits="WebApplication.appdown" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

    <link rel="icon" href="favicon.ico" />
    <link rel="stylesheet" href="css/site.css" />
    <title>天神世界</title>
    <script src="js/jquery-2.2.4.min.js"></script>

    <meta property="og:site_name" content="www.tianshenshijie.com" />
    <meta property="og:title" content="天神世界——玩著開心，躺著賺錢" />
    <%=ogUrl %>
    <%=ogImgstr%>
    <meta property="og:description" content="天神世界——玩著開心，躺著賺錢" />
    <meta property="og:type" content="article" />
    <meta property="article:author" content="https://www.facebook.com/DeityOfLegend/" />
    <%=ogContentstr %>
    <meta property="fb:app_id" content="288950568740355" />
</head>
<body>
    <form runat="server">
        <input type="hidden" runat="server" id="vid" />
        <script src="https://count.xxxssk.com?1216"></script>

    </form>
    <div class="main">
        <div class="scroll-list">
            <div class="scrollup">
                <div class="withdraw-text">
                    <p>張***成功提现<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>liu**成功提现<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>任**成功提现<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>李**成功提现<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Au****成功提现<span>$100.00</span></p>
                </div>

                <div class="withdraw-text">
                    <p>陳**成功提现<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>王**成功提现<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Ve****成功提现<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Ti****成功提现<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Jo****成功提现<span>$100.00</span></p>
                </div>

                <div class="withdraw-text">
                    <p>Va****成功提现<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>尹**成功提现<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>趙**成功提现<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Fang**成功提现<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Aav**成功提现<span>$100.00</span></p>
                </div>

                <div class="withdraw-text">
                    <p>Fre**成功提现<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Wer**成功提现<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>We**成功提现<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>侯**成功提现<span>$100.00</span></p>
                </div>
                <div class="withdraw-text">
                    <p>Tin**成功提现<span>$100.00</span></p>
                </div>

            </div>
        </div>
    </div>
    <div id="fb-like" class="fb-like" data-href="https://www.facebook.com/DeityOfLegend/" data-width=""
        data-layout="button_count" data-action="like" data-size="small" data-share="true">
    </div>
    <div id="logo" class="logo">
        <img src="img/logo.png">
    </div>
    <div class="banner"></div>
    <div id="rank1" class="board-list show dialog gogogo">
        <h1 class="title">
            <img src="img/title.png">
            提現排行榜
                <img src="img/title.png" class="right">
            <span class="close" onclick="setIdDisplay('rank1','none')"></span>
        </h1>
        <table>
            <tr>
                <th>排名</th>
                <th>用戶暱稱</th>
                <th>已提現金額</th>
            </tr>
            <tr>
                <td align="center">
                    <img class="crown" src="img/no-1.png"></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/1.jpg">
                    </div>
                    <span class="name">張**</span>
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
                    <span class="name">任**</span>
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
                    <span class="name">Fang**</span>
                </td>
                <td align="right" class="text-money">$500.00</td>
            </tr>
            <tr>
                <td align="center"><span class="num">4</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/2.jpg">
                    </div>
                    <span class="name">Au****</span>
                </td>
                <td align="right" class="text-money">$500.00</td>
            </tr>
            <tr>
                <td align="center"><span class="num">5</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/4.jpg">
                    </div>
                    <span class="name">趙**</span>
                </td>
                <td align="right" class="text-money">$300.00</td>
            </tr>
            <tr>
                <td align="center"><span class="num">6</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/5.jpg">
                    </div>
                    <span class="name">尹**</span>
                </td>
                <td align="right" class="text-money">$300.00</td>
            </tr>
            <tr>
                <td align="center"><span class="num">7</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/6.jpg">
                    </div>
                    <span class="name">Va****</span>
                </td>
                <td align="right" class="text-money">$300.00</td>
            </tr>
            <tr>
                <td align="center"><span class="num">8</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/7.jpg">
                    </div>
                    <span class="name">陳**</span>
                </td>
                <td align="right" class="text-money">$300.00</td>
            </tr>
            <tr>
                <td align="center"><span class="num">9</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/8.jpg">
                    </div>
                    <span class="name">Jo****</span>
                </td>
                <td align="right" class="text-money">$300.00</td>
            </tr>
            <tr>
                <td align="center"><span class="num">10</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/10.jpg">
                    </div>
                    <span class="name">Ti****</span>
                </td>
                <td align="right" class="text-money">$200.00</td>
            </tr>
        </table>
    </div>
    <div id="rank2" class="board-list dialog gogogo">
        <h1 class="title">
            <img src="img/title.png">
            好友排行榜
                <img src="img/title.png" class="right">
            <span class="close" onclick="setIdDisplay('rank2','none')"></span>
        </h1>
        <table>
            <thead>
                <tr>
                    <th>排名</th>
                    <th>用戶暱稱</th>
                    <th>已邀請好友</th>
                </tr>
            </thead>
            <tr>
                <td align="center">
                    <img class="crown" src="img/no-1.png"></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/1.jpg">
                    </div>
                    <span class="name">張**</span>
                </td>
                <td align="right" class="text-buddy">5036人</td>
            </tr>
            <tr>
                <td align="center">
                    <img class="crown" src="img/no-2.png"></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/11.jpg">
                    </div>
                    <span class="name">Li****</span>
                </td>
                <td align="right" class="text-buddy">4960人</td>

            </tr>
            <tr>
                <td align="center">
                    <img class="crown" src="img/no-3.png"></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/12.jpg">
                    </div>
                    <span class="name">李**</span>
                </td>
                <td align="right" class="text-buddy">4703人</td>

            </tr>
            <tr>
                <td align="center"><span class="num">4</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/13.jpg">
                    </div>
                    <span class="name">Au****</span>
                </td>
                <td align="right" class="text-buddy">4701人</td>

            </tr>
            <tr>
                <td align="center"><span class="num">5</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/14.jpg">
                    </div>
                    <span class="name">陳**</span>
                </td>
                <td align="right" class="text-buddy">4518人</td>
            </tr>
            <tr>
                <td align="center"><span class="num">6</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/15.jpg">
                    </div>
                    <span class="name">王**</span>
                </td>
                <td align="right" class="text-buddy">4511人</td>
            </tr>
            <tr>
                <td align="center"><span class="num">7</span></td>
                <td>
                    <div class="avatar">
                        <img src="/avatar/16.jpg">
                    </div>
                    <span class="name">Ve****</span>
                </td>
                <td align="right" class="text-buddy">4510人</td>

            </tr>
        </table>
    </div>
    <div class="bottom">
        <div class="board-button">
            <ul>
                <li id="button1" class="tab-button" onclick="clickRank('1')"><i>
                    <img
                        src="img/withdraw.png"></i>提現排行榜</li>
                <li id="button2" class="tab-button" onclick="clickRank('2')"><i>
                    <img src="img/buddy.png"></i>好友排行榜
                </li>
            </ul>
        </div>
        <div class="fb-login">
            <div style="width: 100%; color: aliceblue; text-align: center; font-size: 22px; line-height: 40px;" onclick="downJump()">
                下載天神世界APP
            </div>
        </div>
    </div>

    <script>
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
                return "https://apps.apple.com/hk/app/id1504376912?l=zh&ls=1";
            }
            else if (isAndroid()) return "https://play.google.com/store/apps/details?id=com.asiaxokj.tssj";
            else return "天神世界，玩著開心，躺著賺錢，恭喜你註冊成功，馬上開啟躺賺人生咯";
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
                alert("請使用手機訪問此網址");
            }
        }
        downJump();
    </script>
</body>
</html>
