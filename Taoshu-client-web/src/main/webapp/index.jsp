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
    <meta http-equiv="keyword" content="keyword1,keyword2,keyword3">
    <title>淘书网</title>
    <script src="js/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="css/marketingWebsite.css">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/first_page.css"/>
    <link rel="stylesheet" href="css/app.css">
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <script src="js/first_page.js"></script>
    <script src="js/bootstrap.js"></script>
    <script type="text/javascript">
        window.pageConfig = {
            compatible: true
        };
    </script>
    <link rel="stylesheet" href="css/hend_photo.css"/>
    <link rel="stylesheet" href="css/news20120221.css"/>
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
<c:if test="${specialOffer ==null}">
    <c:redirect url="/index/indexServlet"></c:redirect>
</c:if>
<body>


<div id="globa">
    <div id="top">
        <form id="keywordform" action="${pageContext.request.contextPath }/index/searchResult" method="post">
            <div id="logo" style="margin-top: 15px">
                <a href="${pageContext.request.contextPath }/index/indexServlet" style="text-decoration: none;">
                    <img src="./images/logo.png">
                </a>
            </div>
            <div id="find" class="input-group">
                <input id="keyword" name="keyword" type="text" class="form-control" placeholder="搜索二手书籍" value=""/>
                <span class="input-group-btn">
                        <button type="button" class="btn btn-danger" onclick="checkkeyword();">查询</button>
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

    <div class="user_info" style="margin-left: 1030px">
        <c:if test="${!empty user}">
            亲爱的<a href="${pageContext.request.contextPath}/user/myInformation?u_id=${user.uId}"> ${user.uName} </a>
            ,欢迎回来！
            <a href="${pageContext.request.contextPath }/user/loginout">退出</a>
        </c:if>
    </div>

    <div id=clearboth></div>
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
    <div id="show-6" class="show">
        <div class="center">
            <div class="poster-main carousel" data-setting="{
                                 &quot;width&quot;:960,
                                 &quot;height&quot;:350,
                                 &quot;posterWidth&quot;:686,
                                 &quot;posterHeight&quot;:350,
                                 &quot;verticalAlign&quot;:&quot;middle&quot;,
                                 &quot;autoPlay&quot;:true,
                                 &quot;speed&quot;:1000,
                                 &quot;delay&quot;:3000,
                                 &quot;scale&quot;:0.8
                        }" style="width: 960px; height: 350px;">
                <div class="poster-btn poster-prev-btn" style="width: 137px; height: 350px; z-index: 3;"></div>
                <ul class="poster-list" style="width: 960px; height: 350px;">
                    <c:forEach var="x" begin="1" end="5">
                        <li class="list-item"
                            style="width: 686px; height: 350px; left: 137px; z-index: 2; opacity: 1; ">
                            <a href="${pageContext.request.contextPath }/product/productview?u_id=${user.uId}&p3_id=${posterProduct.get(x).pId }">
                                <img src="http://${posterProduct.get(x).pPicture}">
                            </a>
                        </li>
                        <li class="list-item"
                            style="width: 548px; height: 280px; z-index: 1; opacity: 1; left: 342.7px; top: 35px;">
                            <a href="${pageContext.request.contextPath }/product/productview?u_id=${user.uId}&p3_id=${posterProduct.get(x).pId }">
                                <img src="http://${posterProduct.get(x).pPicture}">
                            </a>
                        </li>
                        <li class="list-item"
                            style="width: 439px; height: 224px; z-index: 0; opacity: 0.5; left: 520.96px; top: 63px;">
                            <a href="${pageContext.request.contextPath }/product/productview?u_id=${user.uId}&p3_id=${posterProduct.get(x).pId }">
                                <img src="http://${posterProduct.get(x).pPicture}">
                            </a>
                        </li>
                        <li class="list-item"
                            style="width: 439px; height: 224px; z-index: 0; opacity: 0.5; left: 0px; top: 63px;">
                            <a href="${pageContext.request.contextPath }/product/productview?u_id=${user.uId}&p3_id=${posterProduct.get(x).pId }">
                                <img src="http://${posterProduct.get(x).pPicture}">
                            </a>
                        </li>
                        <li class="list-item"
                            style="width: 548px; height: 280px; z-index: 1; opacity: 1; left: 68.5px; top: 35px;">
                            <a href="${pageContext.request.contextPath }/product/productview?u_id=${user.uId}&p3_id=${posterProduct.get(x).pId }">
                                <img src="http://${posterProduct.get(x).pPicture}">
                            </a>
                        </li>
                    </c:forEach>
                </ul>
                <div class="poster-btn poster-next-btn" style="width: 137px; height: 350px; z-index: 3;"></div>
            </div>
            <p>
                <a href="https://www.baidu.com/s?wd=${posterProduct.get(0).pName}"> 了解更多...
                </a>
            </p>
        </div>
    </div>
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/Carousel.js"></script>
    <script>Carousel.init($('.carousel'));
    </script>
    <script src="js/public.min.js"></script>
    <div id="middle">
        <div id="left">
            <div class="production">
                <c:forEach var="p3_name" items="${productAll}">
                    <div class="homeuse">
                        <h3>${p3_name.p3Name }</h3>
                        <c:forEach var="p2_name" items="${p3_name.list2}">
                            <ul>
                                <li><span><img src="img/li.png"/></span>&nbsp; <a
                                        href="${pageContext.request.contextPath }/index/searchResult?keyword=${p2_name.p2Name}&flag=true">${p2_name.p2Name }</a>：
                                    <c:forEach var="p_name" items="${p2_name.list1 }">
                                        |<a href="${pageContext.request.contextPath }/product/productview?u_id=${user.uId}&p3_id=${p_name.pId }">${p_name.pName }</a>
                                    </c:forEach>
                                </li>
                            </ul>
                        </c:forEach>
                    </div>
                </c:forEach>
            </div>
            <%--<div class="history">--%>
            <%--<h3>最近浏览</h3>--%>
            <%--<ul>--%>
            <%--<c:forEach var="history_info" items="${history }">--%>
            <%--<li style="border: 2px solid honeydew;margin-left: 0px">--%>
            <%--<div class="homeuse"--%>
            <%--style="width:146px;height: 146px;margin:0px auto/* ;border: 1px solid honeydew; */">--%>
            <%--<a href="${pageContext.request.contextPath }/product/productview?u_id=${user.uId}&p3_id=${history_info.p_id }">--%>
            <%--<span><img src="${history_info.p_picture }" width="146px" height="146px"--%>
            <%--alt="还没登录，没有浏览信息哦！"/></span>&nbsp;--%>
            <%--</a>--%>
            <%--</div>--%>
            <%--<div>--%>
            <%--<h3 style="font-size: 18px">${history_info.p_name }</h3>--%>
            <%--<h3 style="font-size: 18px">价格：￥${history_info.p_price }</h3>--%>
            <%--</div>--%>
            <%--</li>--%>
            <%--</c:forEach>--%>
            <%--</ul>--%>
            <%--</div>--%>
            <div id=clearboth></div>
        </div>
        <div id="center">
            <div class="tejia" style="margin:0 auto;width:90%">
                <br/> <span><img src="img/result.png" style="width:20px">&nbsp;</span>
                <h4 style="color: mediumvioletred;font-size: 18px">新品热卖</h4>
                <br>
                <div id="clearboth"></div>
                <hr color="orange" size="2">
                <c:forEach var="hotproduct" items="${newHotProduct}">
                    <a href="${pageContext.request.contextPath }/product/productview?u_id=${user.uId}&p3_id=${hotproduct.pId }">
                        <div class="find_commodity"
                             style="float:left;margin: 22px 0 0 35px;border: 1px solid silver; width:220px; height: 360px">
                            <img href="${pageContext.request.contextPath }/product/productview?u_id=${user.uId}&p3_id=${hotproduct.pId }"
                                 src="http://${hotproduct.pPicture}" style="width:220px; height:224px" alt=""/>
                            <p style="font-size:16px;color:red;text-align:left;font-weight:Bold;margin-left:5px;margin-top:10px">
                                ￥${hotproduct.pPrice }</p>
                            <p style="font-size:12px;text-align:left;color:#000000;margin-left:5px;margin-top:15px;height:55px">${hotproduct.pName.length()>40?hotproduct.pName.substring(0,40):hotproduct.pName }</p>
                            <p style="font-size:12px;text-align:left;color:#666;margin-left:5px;"> ${hotproduct.pCategory}</p>
                        </div>
                    </a>
                </c:forEach>
                <div id=clearboth></div>
                <br/>

                <br/>
                <span>
                    <img src="img/result.png" style="width:20px">
                </span>
                <h4 style="color: mediumvioletred;font-size: 18px">今日特价</h4>
                <br>
                <div id="clearboth"></div>
                <hr color="orange" size="2">
                <c:forEach var="special_Offer" items="${specialOffer}">
                    <a href="${pageContext.request.contextPath }/product/productview?u_id=${user.uId}&p3_id=${special_Offer.pId }">
                        <div class="find_commodity"
                             style="float:left;margin: 22px 0 0 35px;border: 1px solid silver; width:220px; height: 360px">
                            <img href="${pageContext.request.contextPath }/product/productview?u_id=${user.uId}&p3_id=${special_Offer.pId }"
                                 src="http://${special_Offer.pPicture}" style="width:220px; height:224px"/>
                            <p style="font-size:16px;color:red;text-align:left;font-weight:Bold;margin-left:5px;margin-top:10px">
                                ￥${special_Offer.pPrice }</p>
                            <p style="font-size:12px;text-align:left;color:#000000;margin-left:5px;margin-top:15px;height:55px">${special_Offer.pName.length()>40?special_Offer.pName.substring(0,40):special_Offer.pName }</p>
                            <p style="font-size:12px;text-align:left;color:#666;margin-left:5px;"> ${special_Offer.pCategory}</p>
                        </div>
                    </a>
                </c:forEach>

            </div>
        </div>
    </div>
    <div id="clearboth"></div>
    <br/>
    <div id="service-2017">
        <div class="w">
            <!--<ol class="slogen">
            <li class="item fore1">
                <i>买</i>品类齐全，轻松购物
            </li>
            <li class="item fore2">
                <i>个</i>多仓直发，极速配送
            </li>
            <li class="item fore3">
                <i>神</i>正品行货，精致服务
            </li>
            <li class="item fore4">
                <i>马</i>天天低价，畅选无忧
            </li>
        </ol>-->
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
    <!--serviceint end-->
    <!--footer start-->
    <div id="footer-2017">
        <div class="w">
            <div class="copyright_links">
                <p>
                    <a href="//about.jd.com" target="_blank">关于我们</a><span class="copyright_split">|</span><a
                        href="//about.jd.com/contact/" target="_blank">联系我们</a><span class="copyright_split">|</span><a
                        href="//help.jd.com/user/custom.html" target="_blank">联系客服</a><span
                        class="copyright_split">|</span><a href="//vc.jd.com/cooperation.html"
                                                           target="_blank">合作招商</a><span
                        class="copyright_split">|</span><a href="//helpcenter.jd.com/venderportal/index.html"
                                                           target="_blank">商家帮助</a><span
                        class="copyright_split">|</span><a href="//jzt.jd.com" target="_blank">营销中心</a><span
                        class="copyright_split">|</span><a href="//app.jd.com/" target="_blank">手机Taoshu</a><span
                        class="copyright_split">|</span><a href="//club.jd.com/links.aspx" target="_blank">友情链接</a><span
                        class="copyright_split">|</span><a href="//media.jd.com/" target="_blank">销售联盟</a><span
                        class="copyright_split">|</span><a href="//club.jd.com/" target="_blank">Taoshu社区</a><span
                        class="copyright_split">|</span><a href="//sale.jd.com/act/FTrWPesiDhXt5M6.html"
                                                           target="_blank">风险监测</a><span
                        class="copyright_split">|</span><a href="//about.jd.com/privacy/" target="_blank">隐私政策</a><span
                        class="copyright_split">|</span><a href="//gongyi.jd.com" target="_blank">Taoshu公益</a><span
                        class="copyright_split">|</span><a href="//en.jd.com/" target="_blank">English Site</a><span
                        class="copyright_split">|</span><a href="//en.jd.com/help/question-58.html" target="_blank">Contact
                    Us</a>
                </p>
            </div>
            <div class="copyright_info">
                <p>
                    <a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11000002000088"
                       target="_blank">京公网安备 11000002000088号</a><span
                        class="copyright_split">|</span><span>京AICP证23333号</span><span
                        class="copyright_split">|</span><a
                        href="//img14.360buyimg.com/da/jfs/t256/349/769670066/270505/3b03e0bb/53f16c24N7c04d9e9.jpg"
                        target="_blank">互联网药品信息服务资格证编号(京)-经营性-2018-8888</a><span class="copyright_split">|</span><span>新出发京零&nbsp;字第大120007号</span>
                </p>
                <p>
                    <span>互联网出版许可证编号新出网证(京)字150号</span><span class="copyright_split">|</span><a
                        href="//sale.jd.com/act/pQua7zovWdJfcIn.html" target="_blank">出版物经营许可证</a><span
                        class="copyright_split">|</span><a href="//misc.360buyimg.com/wz/wlwhjyxkz.jpg" target="_blank">网络文化经营许可证京网文[2333]233-233号</a><span
                        class="copyright_split">|</span><span>违法和不良信息举报电话：0123456789</span>
                </p>
                <p>
                        <span class="copyright_text">Copyright&nbsp;&copy;&nbsp;2004&nbsp;-&nbsp;<em
                                id="copyright_year">2017</em>&nbsp;&nbsp;淘书网Taoshu.com&nbsp;版权所有
                        </span><span class="copyright_split">|</span><span>消费者维权热线：4006067733</span><a
                        href="//sale.jd.com/act/7Y0Rp81MwQqc.html" target="_blank" class="copyright_license">经营证照</a>
                </p>
                <p>
                    <span>淘书网旗下网站：</span><a href="https://www.baidu.com/" target="_blank">淘书钱包</a><span
                        class="copyright_split">|</span><a href="http://www.baidu.com" target="_blank">淘书云</a>
                </p>
            </div>
            <p class="copyright_auth">
                <a class="copyright_auth_ico copyright_auth_ico_1"
                   href="http://www.hd315.gov.cn/beian/view.asp?bianhao=010202007080200026"
                   target="_blank">经营性网站备案中心</a>
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

                (function () {
                    var d = new Date;
                    document.getElementById("copyright_year").innerHTML = d.getFullYear()
                })();
                </script>
                <a id="urlknet" class="copyright_auth_ico copyright_auth_ico_2" onclick="CNNIC_change('urlknet')"
                   oncontextmenu="return false;" name="CNNIC_seal"
                   href="https://ss.knet.cn/verifyseal.dll?sn=2008070300100000031&amp;ct=df&amp;pa=294005"
                   target="_blank">可信网站信用评估</a><a class="copyright_auth_ico copyright_auth_ico_3"
                                                  href="http://www.cyberpolice.cn/" target="_blank">网络警察提醒你</a><a
                    class="copyright_auth_ico copyright_auth_ico_4"
                    href="https://search.szfw.org/cert/l/CX20120111001803001836" target="_blank">诚信网站</a><a
                    class="copyright_auth_ico copyright_auth_ico_5" href="http://www.12377.cn"
                    target="_blank">中国互联网举报中心</a><a class="copyright_auth_ico copyright_auth_ico_6"
                                                    href="http://www.12377.cn/node_548446.htm"
                                                    target="_blank">网络举报APP下载</a>
            </p>
        </div>
    </div>
</div>

<div id="clearboth"></div>
</body>

</html>
