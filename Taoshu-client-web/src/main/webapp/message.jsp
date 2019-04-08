<%--
  Created by IntelliJ IDEA.
  User: mick
  Date: 2019-04-04
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

%>
<!DOCTYPE html>

<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <title>淘书网</title>
    <script src="js/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="css/marketingWebsite.css">
    <link rel="stylesheet" href="css/first_page.css" />
    <link rel="stylesheet" href="css/app.css">
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/hend_photo.css" />
    <link rel="stylesheet" href="css/news20120221.css" />
    <link rel="stylesheet" href="css/message.css" />
    <script src="js/first_page.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/release.js"></script>
    <script type="text/javascript">
        window.pageConfig = {
            compatible: true
        };

        function sendmessage() {
            if (document.getElementById("text").value === "") alert("私信内容不能为空！");
            else if (!(/[0-9]?/.test(document.getElementById("u2_id").value)) || document.getElementById("u2_id").value === "") alert("用户ID只能为纯数字！");
            else $("#messageform").submit();
        }
    </script>
    <script type="text/javascript" src="js/base.js" source="combo"></script>
    <style>
        h3 {
            color: #989898;
            text-align: center;
        }

        a:link {
            color: #A0A0A0;
            text-decoration: none;
        }

        a:visited {
            color: #A0A0A0;
            text-decoration: none;
        }

        a:active {
            text-decoration: none;
        }

        a:hover {
            color: red;
        }
    </style>
</head>

<body>
<div id="globa">
    <div id="top">
        <form id="keywordsform" action="${pageContext.request.contextPath }/index/searchResult" method="post">
            <div id="logo" style="margin-top: 15px">
                <a href="${pageContext.request.contextPath }/index/indexServlet" style="text-decoration: none;">
                    <img src="./images/logo.png">
                </a>
            </div>
            <div id="find" class="input-group">
                <input id="keywords" name="keywords" type="text" class="form-control" placeholder="搜索二手书籍" value="" />
                <span class="input-group-btn">
                        <button type="button" class="btn btn-danger" onclick="checkKeywords();">查询</button>
                    </span>
            </div>
            <div id="fourlist">
                <a href="${pageContext.request.contextPath }/user/shoppingCar">购物车</a>&nbsp;&nbsp;
                <a href="${pageContext.request.contextPath }/user/myInformation?u_id=${user.uId}&user_name=${user.uName}">我的关注</a>&nbsp;&nbsp;
                <a href="${pageContext.request.contextPath }/register.jsp">注册</a>&nbsp;&nbsp;
                <a href="${pageContext.request.contextPath }/login.jsp">登录</a>&nbsp;&nbsp;
                <a href="${pageContext.request.contextPath }/user/sendmessage">留言</a>
            </div>
        </form>
    </div>
    <div style="margin-left: 1030px">
        亲爱的<a href="${pageContext.request.contextPath }/user/myInformation?u_id=${user.uId}">${user.uName}
    </a>,欢迎回来！ <a href="${pageContext.request.contextPath }/user/loginout">退出</a>
    </div>
    <div id="navigation">
        <!-- <div style=" width: 100%;height: 2px"> </div> -->
        <ul>
            <li><a href="${pageContext.request.contextPath }/index/indexServlet">首页</a></li>
            <li><a href="${pageContext.request.contextPath }/login.jsp">登录</a></li>
            <li><a href="${pageContext.request.contextPath }/register.jsp">注册</a></li>
            <li><a href="${pageContext.request.contextPath }/user/release">发布</a></li>
            <li><a href="${pageContext.request.contextPath }/user/shoppingCar">购物车</a></li>
            <li><a href="${pageContext.request.contextPath }/user/sendmessage">留言</a></li>
            <li><a href="#">全球购</a></li>
        </ul>
    </div>
    <script src="js/Carousel.js"></script>
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/Carousel.js"></script>
    <script>Carousel.init($('.carousel'));
    </script>
    <script src="js/public.min.js"></script>
    <div id="middle">
        <div class="message">
            <div class="message-head">
                <div class="message-content">
                    <div class="column">Id</div>
                    <div class="column">内容</div>
                    <div class="column">日期</div>
                </div>
                <c:forEach var="message" items="${listOfMessage}">
                    <div class="message-content">
                        <div class="column">${message.u1Id}</div>
                        <div class="column">${message.message}</div>
                        <div class="column">${message.time}}</div>
                    </div>
                </c:forEach>
            </div>
            <div class="message-window">
                <div class="message-window-content">
                </div>
                <form id="messageform" action="${pageContext.request.contextPath }/user/messagee" method="post">
                    <div class="message-window-input">
                        <textarea id="text" name="message" cols="160" rows="7" placeholder="请输入您想要发送的私信内容"></textarea>
                        <br>
                        <br>
                        <textarea id="u2_id" name="u2_id" cols="40" rows="2" placeholder="请输入您想要发送的用户ID"></textarea>
                        <span class="input-group-btn">
                                <button style="position:relative;left:930px;top:-30px" class="btn btn-danger" type="button" onclick="sendmessage();">发送</button>
                            </span>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div id="service-2017">
    <div class="w">
    </div>
    <div class="jd-help">
        <div class="w">
            <div class="wrap">
                <dl class="fore1">
                    <dt>购物指南</dt>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-29.html">购物流程</a>
                    </dd>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-151.html">会员介绍</a>
                    </dd>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-297.html">生活旅行/团购</a>
                    </dd>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//help.jd.com/user/issue.html">常见问题</a>
                    </dd>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-136.html">大家电</a>
                    </dd>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//help.jd.com/user/index.html">联系客服</a>
                    </dd>
                </dl>
                <dl class="fore2">
                    <dt>配送方式</dt>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-81-100.html">上门自提</a>
                    </dd>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-81.html">211限时达</a>
                    </dd>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/103-983.html">配送服务查询</a>
                    </dd>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/109-188.html">配送费收取标准</a>
                    </dd>
                    <dd>
                        <a target="_blank" href="//en.jd.com/chinese.html">海外配送</a>
                    </dd>
                </dl>
                <dl class="fore3">
                    <dt>支付方式</dt>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-172.html">货到付款</a>
                    </dd>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-173.html">在线支付</a>
                    </dd>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-176.html">分期付款</a>
                    </dd>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-174.html">邮局汇款</a>
                    </dd>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-175.html">公司转账</a>
                    </dd>
                </dl>
                <dl class="fore4">
                    <dt>售后服务</dt>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/321-981.html">售后政策</a>
                    </dd>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-132.html">价格保护</a>
                    </dd>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/130-978.html">退款说明</a>
                    </dd>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//myjd.jd.com/repair/repairs.action">返修/退换货</a>
                    </dd>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-50.html">取消订单</a>
                    </dd>
                </dl>
                <span class="clr"></span>
            </div>
        </div>
    </div>
</div>
<div id="footer-2017">
    <div class="w">
        <div class="copyright_links">
            <p>
                <a href="//about.jd.com" target="_blank">关于我们</a><span class="copyright_split">|</span><a href="//about.jd.com/contact/" target="_blank">联系我们</a><span class="copyright_split">|</span><a href="//help.jd.com/user/custom.html" target="_blank">联系客服</a><span class="copyright_split">|</span><a href="//vc.jd.com/cooperation.html" target="_blank">合作招商</a><span class="copyright_split">|</span><a href="//helpcenter.jd.com/venderportal/index.html" target="_blank">商家帮助</a><span class="copyright_split">|</span><a href="//jzt.jd.com" target="_blank">营销中心</a><span class="copyright_split">|</span><a href="//app.jd.com/" target="_blank">手机Taoshu</a><span class="copyright_split">|</span><a href="//club.jd.com/links.aspx" target="_blank">友情链接</a><span class="copyright_split">|</span><a href="//media.jd.com/" target="_blank">销售联盟</a><span class="copyright_split">|</span><a href="//club.jd.com/" target="_blank">Taoshu社区</a><span class="copyright_split">|</span><a href="//sale.jd.com/act/FTrWPesiDhXt5M6.html" target="_blank">风险监测</a><span class="copyright_split">|</span><a href="//about.jd.com/privacy/" target="_blank">隐私政策</a><span class="copyright_split">|</span><a href="//gongyi.jd.com" target="_blank">Taoshu公益</a><span class="copyright_split">|</span><a href="//en.jd.com/" target="_blank">English Site</a><span class="copyright_split">|</span><a href="//en.jd.com/help/question-58.html" target="_blank">Contact
                Us</a>
            </p>
        </div>
        <div class="copyright_info">
            <p>
                <a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11000002000088" target="_blank">京公网安备 11000002000088号</a><span class="copyright_split">|</span><span>京AICP证23333号</span><span class="copyright_split">|</span><a href="//img14.360buyimg.com/da/jfs/t256/349/769670066/270505/3b03e0bb/53f16c24N7c04d9e9.jpg" target="_blank">互联网药品信息服务资格证编号(京)-经营性-2018-8888</a><span class="copyright_split">|</span><span>新出发京零&nbsp;字第大120007号</span>
            </p>
            <p>
                <span>互联网出版许可证编号新出网证(京)字150号</span><span class="copyright_split">|</span><a href="//sale.jd.com/act/pQua7zovWdJfcIn.html" target="_blank">出版物经营许可证</a><span class="copyright_split">|</span><a href="//misc.360buyimg.com/wz/wlwhjyxkz.jpg" target="_blank">网络文化经营许可证京网文[2333]233-233号</a><span class="copyright_split">|</span><span>违法和不良信息举报电话：0123456789</span>
            </p>
            <p>
                    <span class="copyright_text">Copyright&nbsp;&copy;&nbsp;2004&nbsp;-&nbsp;<em id="copyright_year">2017</em>&nbsp;&nbsp;淘书网Taoshu.com&nbsp;版权所有
                    </span><span class="copyright_split">|</span><span>消费者维权热线：4006067733</span><a href="//sale.jd.com/act/7Y0Rp81MwQqc.html" target="_blank" class="copyright_license">经营证照</a>
            </p>
            <p>
                <span>淘书网旗下网站：</span><a href="https://www.baidu.com/" target="_blank">淘书钱包</a><span class="copyright_split">|</span><a href="http://www.baidu.com" target="_blank">淘书云</a>
            </p>
        </div>
        <p class="copyright_auth">
            <a class="copyright_auth_ico copyright_auth_ico_1" href="http://www.hd315.gov.cn/beian/view.asp?bianhao=010202007080200026" target="_blank">经营性网站备案中心</a>
            <script type="text/JavaScript">function CNNIC_change(eleId) {
                var str = document.getElementById(eleId).href;
                var str1 = str.substring(0, (str.length - 6));
                str1 += CNNIC_RndNum(6);
                document.getElementById(eleId).href = str1;
            }
            function CNNIC_RndNum(k) {
                var rnd = "";
                for (var i = 0; i < k; i++) rnd += Math.floor(Math.random() * 10);
                return rnd;
            }
            ;
            (function() {
                var d = new Date;
                document.getElementById("copyright_year").innerHTML = d.getFullYear()
            })();
            </script>
            <a id="urlknet" class="copyright_auth_ico copyright_auth_ico_2" onclick="CNNIC_change('urlknet')" oncontextmenu="return false;" name="CNNIC_seal" href="https://ss.knet.cn/verifyseal.dll?sn=2008070300100000031&amp;ct=df&amp;pa=294005" target="_blank">可信网站信用评估</a><a class="copyright_auth_ico copyright_auth_ico_3" href="http://www.cyberpolice.cn/" target="_blank">网络警察提醒你</a><a class="copyright_auth_ico copyright_auth_ico_4" href="https://search.szfw.org/cert/l/CX20120111001803001836" target="_blank">诚信网站</a><a class="copyright_auth_ico copyright_auth_ico_5" href="http://www.12377.cn" target="_blank">中国互联网举报中心</a><a class="copyright_auth_ico copyright_auth_ico_6" href="http://www.12377.cn/node_548446.htm" target="_blank">网络举报APP下载</a>
        </p>
    </div>
</div>
<div id="clearboth"></div>
<br />
</body>

</html>
