<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>

<head>
    <base href="<%=basePath%>">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keyword" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta charset="utf-8" />
    <script src="js/jquery-1.11.1.min.js"></script>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">


    <link rel="stylesheet" href="css/marketingWebsite.css">
    <link rel="stylesheet" href="css/first_page.css" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/hend_photo.css" />

    <link rel="stylesheet" href="css/news20120221.css" />
    <link rel="stylesheet" type="text/css" href="css/jquery-confirm.css" />


    <link rel="stylesheet" href="css/app.css">
    <script src="js/first_page.js"></script>
    <script src="js/bootstrap.js"></script>
    <script type="text/javascript">
        window.pageConfig = { compatible: true };
    </script>
    <script type="text/javascript" src="js/jquery-confirm.js"></script>
    <script type="text/javascript" src="js/base.js" source="combo"></script>
    <script type="text/javascript">
        //删除关注的记录
        function deleteMy_attation(ma_uid) {

            var f = confirm("不再关注？");
            if (f) {

                $.post('ajax/deleteMyattatioinOrOrderformServlet.do', { ma_uid: ma_uid }, function(data) {

                    if (data == "false") {
                        alert("不知道什么原因，删除失败啦！");
                        /* $.alert({
                              title: '小提示：',
                              content: '不知道什么原因，不知道什么原因，删除失败啦~~',
                              confirmButton: '确认',
                              confirmButtonClass: 'btn-info',
                              animation: 'bottom',
                              icon: 'fa fa-check',
                              backgroundDismiss: true
                            });*/
                    } else {
                        $("#my_at" + ma_uid).remove();
                    }

                }, 'html');
            }


        }


        //删除已完成订单
        function deleteOrderForm(o_id) {
            var f = confirm("是否删除？");
            if (f) {
                $.post('ajax/deleteMyattatioinOrOrderformServlet.do', { o_id: o_id }, function(data) {
                    if (data == "false") {
                        alert("不知道什么原因，删除失败啦~");
                        /* $.alert({
                              title: '小提示：',
                              content: '不知道什么原因，删除失败啦~~',
                              confirmButton: '确认',
                              confirmButtonClass: 'btn-info',
                              animation: 'bottom',
                              icon: 'fa fa-check',
                              backgroundDismiss: true
                            });*/
                    } else {
                        $("#my_of" + o_id).remove();
                    }

                }, 'html');

            }
        }
    </script>
    <title>我的淘书</title>
    <script type="text/javascript">
        window.pageConfig = { jdfVersion: '2.0.0' };
    </script>
    <script type="text/javascript" src="js/base.js"></script>
    <script type="text/javascript" src="js/basepath.js"></script>
    <link type="text/css" rel="stylesheet" href="css/julikecss.css">
    <link href="//www.jd.com/favicon.ico" rel="shortcut icon">
</head>

<body>
<div id=globa>
    <div id="top">
        <form id="keywordform" action="${pageContext.request.contextPath }/index/searchResult" method="post">
            <div id="logo" style="margin-top: 15px">
                <a href="${pageContext.request.contextPath }/index/indexServlet" style="text-decoration: none;">
                    <img src="./images/logo.png">
                </a>
            </div>
            <div id="find" class="input-group">
                <input id="keyword" name="keyword" type="text" class="form-control" placeholder="搜索二手书籍" value="" />
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
    <div style="margin-left: 1030px">
        亲爱的<a href="${pageContext.request.contextPath }/user/myInformation?u_id=${user.uId}">${user.uName}
    </a>,欢迎回来！ <a href="${pageContext.request.contextPath }/user/loginout">退出</a>
    </div>
    <div id="navigation">
        <!-- <div style=" width: 100%;height: 2px"> </div> -->
        <ul>
            <li><a href="${pageContext.request.contextPath }/login.jsp">登录</a></li>
            <li><a href="${pageContext.request.contextPath }/register.jsp">注册</a></li>
            <li><a href="${pageContext.request.contextPath }/release">发布</a></li>
            <li><a href="${pageContext.request.contextPath }/user/shoppingCar">购物车</a></li>
            <li><a href="${pageContext.request.contextPath }/user/sendmessage">留言</a></li>
            <li><a href="#">全球购</a></li>
            <li><a href="#">全球购</a></li>
        </ul>
    </div>
    <div id=clearboth></div>
    <!-- main -->
    <div style="margin-top: -35px">
        <div id="container">
            <!--获取服务器时间 -->
            <input id="serverTime" type="hidden" value="1510144679" />
            <div class="w">
                <div id="content">
                    <div id="sub">
                        <!--  /widget/menu/menu.tpl -->
                        <div id="menu-ads">
                        </div>
                        <!--/ /widget/menu/menu.tpl -->
                    </div>
                    <div id="main">
                        <!--home-media 首页响应式布局 start-->
                        <div class="lyt-c-0">
                            <div id="fc-msg-link" class="fc-msg" data-vip="false">
                                <!-- span 标签内包含圆角空格，用于占取链接这一行的空间-->
                                <span>　</span>
                                <!--js 异步获取后台配置，包括，链接，埋点，链接名称-->
                            </div>
                            <!-- 用户信息 -->
                            <!--  /widget/userinfo/userinfo.tpl -->
                            <div id="user-info" class="user-info">
                                <div class="info-lcol">
                                    <div class="u-pic" clstag="homepage|keycount|home2013|Hometxlogo">
                                        <img alt="用户头像" src="//storage.jd.com/i.imageUpload/cbb5bac3b2bbb7d6c0eb3230313231343337373935303737363333_mid.jpg">
                                        <a id="accountImg" href="//i.jd.com/user/userinfo/showImg.html">
                                            <div class="mask"></div>
                                        </a>
                                    </div>
                                    <div class="info-m">
                                        <div class="u-name" clstag="homepage|keycount|home2013|Homeinname">
                                            <a href="//me.jd.com" target="_blank">${user.uName}<em class="rank r3 ml5"><s title="普通会员"></s></em></a>
                                        </div>
                                        <div class="u-level" id="home-u-level" data-id-u-level="61" data-id-u-levelname="银牌会员">
                                            <!--<span class="rank jxz" clstag="homepage|keycount|home2013|Homeindj"> <a
                                    href="//vip.jd.com/" target="_blank"
                                    clstag="homepage|keycount|home2013|Homevip">
                                <s title=""></s> </a>
                            </span>-->
                                        </div>
                                        <div class="u-safe" clstag="homepage|keycount|home2013|Homeinsafe">
                                            <a id="accountSafe" href="//safe.jd.com/user/paymentpassword/safetyCenter.action"><span>账户安全：</span></a>
                                            <i id="cla" class="safe-rank04"></i>
                                            <strong id="rank-text" class="rank-text ftx-01">中</strong>
                                            <a id="up" href="//safe.jd.com/user/paymentpassword/safetyCenter.action">提升</a>
                                        </div>
                                        <div class="clr mb10"></div>
                                        <div class="u-medal" clstag="homepage|keycount|home2013|Homexunzhang">
                                            <a href="#" target="_blank">账户余额：${user.uBalance}</a>
                                        </div>
                                        <div class="info-line">
                                            <span class="top-icon"></span>
                                            <span class="bottom-icon"></span>
                                            <span class="left-icon"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-rcol">
                                    <div class="user-counts">
                                        <ul>
                                            <li>
                                                <div class="count-item">
                                                    <a href="//order.jd.com/center/list.action?s=1" target="_self" clstag="homepage|keycount|home2013|Homedfkk">
                                                        <i class="count-icon count-icon01"></i> 待付款
                                                        <em id="waitPay">0</em>
                                                    </a>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="count-item">
                                                    <a href="//order.jd.com/center/list.action?s=128" target="_self" clstag="homepage|keycount|home2013|Homedsh">
                                                        <i class="count-icon count-icon02"></i> 待收货
                                                        <em id="waitReceive">0</em>
                                                    </a>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="count-item">
                                                    <a href="//order.jd.com/center/list.action?s=32" target="_self" clstag="homepage|keycount|home2013|Homedzt">
                                                        <i class="count-icon count-icon03"></i> 待自提
                                                        <em id="waitPick">0</em>
                                                    </a>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="count-item">
                                                    <a href="//club.jd.com/mycomments.aspx" clstag="homepage|keycount|home2013|Homedpj">
                                                        <i class="count-icon count-icon04"></i> 待评价
                                                        <em id="productCount">0</em>
                                                    </a>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!--/ /widget/userinfo/userinfo.tpl -->
                        </div>
                        <div style="margin-left: 230px;margin-top: 35px">
                            <div class="lyt-c-1">
                                <!-- 我的订单 -->
                                <!--  /widget/order-list/order-list.tpl -->
                                <!-- economical-->
                                <div class="mod-main">
                                    <div class="mt">
                                        <h3>我的订单</h3>
                                        <div></div>
                                        <div class="extra-r"><a href="//order.jd.com/center/list.action" target="_self" clstag="homepage|keycount|home2013|Homeckddk"></a>
                                        </div>
                                    </div>
                                    <div class="mc">
                                        <div id="tb-order" class="tb-order">
                                            <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                                <tr>
                                                    <td>编号</td>
                                                    <td>商品</td>
                                                    <td>下单时间</td>
                                                    <td>单价</td>
                                                    <td>数量</td>
                                                    <td>总价</td>
                                                    <td>状态</td>
                                                    <td>操作</td>
                                                </tr>
                                                <c:forEach var="my_orderform" items="${userOrderform }" varStatus="index">
                                                    <tr id="my_of${my_orderform.o_id }">
                                                        <td>${index.count }</td>
                                                        <td><img src="${my_orderform.p_picture }" width="66" height="66">
                                                            <p>${my_orderform.p_name }</p>
                                                        </td>
                                                        <td>${my_orderform.o_time }</td>
                                                        <td>￥：${my_orderform.p_price }</td>
                                                        <td>${my_orderform.o_pcounts }</td>
                                                        <td>${my_orderform.o_sum }</td>
                                                        <td>已完成</td>
                                                        <td><button type="button" class="btn btn-danger btn-sm" onclick="deleteOrderForm('${my_orderform.o_id }')">删除</button></td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                            <div class="nocont-box nocont-order"><b class="icon-order"></b>您买的东西就这些啦，要不再去挑选些合适的商品吧！
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="lyt-c-1">
                                <!-- 我的订单 -->
                                <div class="mod-main">
                                    <div class="mt">
                                        <h3>我关注的商品</h3>
                                        <div class="extra-r"><a href="//order.jd.com/center/list.action" target="_self" clstag="homepage|keycount|home2013|Homeckddk"></a>
                                        </div>
                                    </div>
                                    <div class="mc">
                                        <div class="tb-order">
                                            <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                                <tr>
                                                    <td>编号</td>
                                                    <td>商品</td>
                                                    <td>关注时间</td>
                                                    <td>单价</td>
                                                    <td>操作</td>
                                                </tr>
                                                <c:forEach var="my_attation" items="${userAttention }" varStatus="index2">
                                                    <tr id="my_at${my_attation.maId }">
                                                        <td>${index2.count }</td>
                                                        <td><img src="${my_attation.product.pPicture }" width="66" height="66">
                                                            <p>${my_attation.product.pName }</p>
                                                        </td>
                                                        <td>${my_attation.maTime }</td>
                                                        <td>￥：${my_attation.product.pPrice }</td>
                                                        <td><button type="button" class="btn btn-info btn-sm" onclick="deleteMy_attation('${my_attation.maId }')">不再关注</button></td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- economical -->
                            <!--/ /widget/order-list/order-list.tpl -->
                        </div>
                    </div>
                </div>
                <div class="backpanel-inner">
                    <div class="bp-item " id="bp-research">
                        <a class="research" target="_blank" href="#"><b></b>返回顶部</a>
                    </div>
                    <!--<div class="bp-item " id="bp-gotop">
                    <a title="使用快捷键T也可返回顶部哦！" class="gotop" href="#" target="_self"><b></b>返回顶部</a>
                </div>-->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /main -->
<!--serviceint start-->
<div id="service-2017">
    <div class="w">
    </div>
    <div class="jd-help">
        <div class="w">
            <div class="wrap">
                <dl class="fore1">
                    <dt>购物指南</dt>
                    <dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-29.html">购物流程</a></dd>
                    <dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-151.html">会员介绍</a></dd>
                    <dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-297.html">生活旅行/团购</a></dd>
                    <dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue.html">常见问题</a></dd>
                    <dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-136.html">大家电</a></dd>
                    <dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/index.html">联系客服</a></dd>
                </dl>
                <dl class="fore2">
                    <dt>配送方式</dt>
                    <dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-81-100.html">上门自提</a></dd>
                    <dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-81.html">211限时达</a></dd>
                    <dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/103-983.html">配送服务查询</a></dd>
                    <dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/109-188.html">配送费收取标准</a></dd>
                    <dd><a target="_blank" href="//en.jd.com/chinese.html">海外配送</a></dd>
                </dl>
                <dl class="fore3">
                    <dt>支付方式</dt>
                    <dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-172.html">货到付款</a></dd>
                    <dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-173.html">在线支付</a></dd>
                    <dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-176.html">分期付款</a></dd>
                    <dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-174.html">邮局汇款</a></dd>
                    <dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-175.html">公司转账</a></dd>
                </dl>
                <dl class="fore4">
                    <dt>售后服务</dt>
                    <dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/321-981.html">售后政策</a></dd>
                    <dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-132.html">价格保护</a></dd>
                    <dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/130-978.html">退款说明</a></dd>
                    <dd><a rel="nofollow" target="_blank" href="//myjd.jd.com/repair/repairs.action">返修/退换货</a></dd>
                    <dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-50.html">取消订单</a></dd>
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
            <p><a href="//about.jd.com" target="_blank">关于我们</a><span class="copyright_split">|</span><a href="//about.jd.com/contact/" target="_blank">联系我们</a><span class="copyright_split">|</span><a href="//help.jd.com/user/custom.html" target="_blank">联系客服</a><span class="copyright_split">|</span><a href="//vc.jd.com/cooperation.html" target="_blank">合作招商</a><span class="copyright_split">|</span><a href="//helpcenter.jd.com/venderportal/index.html" target="_blank">商家帮助</a><span class="copyright_split">|</span><a href="//jzt.jd.com" target="_blank">营销中心</a><span class="copyright_split">|</span><a href="//app.jd.com/" target="_blank">手机Taoshu</a><span class="copyright_split">|</span><a href="//club.jd.com/links.aspx" target="_blank">友情链接</a><span class="copyright_split">|</span><a href="//media.jd.com/" target="_blank">销售联盟</a><span class="copyright_split">|</span><a href="//club.jd.com/" target="_blank">Taoshu社区</a><span class="copyright_split">|</span><a href="//sale.jd.com/act/FTrWPesiDhXt5M6.html" target="_blank">风险监测</a><span class="copyright_split">|</span><a href="//about.jd.com/privacy/" target="_blank">隐私政策</a><span class="copyright_split">|</span><a href="//gongyi.jd.com" target="_blank">Taoshu公益</a><span class="copyright_split">|</span><a href="//en.jd.com/" target="_blank">English Site</a><span class="copyright_split">|</span><a href="//en.jd.com/help/question-58.html" target="_blank">Contact
                Us</a></p>
        </div>
        <div class="copyright_info">
            <p><a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11000002000088" target="_blank">京公网安备
                11000002000088号</a><span class="copyright_split">|</span><span>京AICP证23333号</span><span class="copyright_split">|</span><a href="//img14.360buyimg.com/da/jfs/t256/349/769670066/270505/3b03e0bb/53f16c24N7c04d9e9.jpg" target="_blank">互联网药品信息服务资格证编号(京)-经营性-2018-8888</a><span class="copyright_split">|</span><span>新出发京零&nbsp;字第大120007号</span>
            </p>
            <p><span>互联网出版许可证编号新出网证(京)字150号</span><span class="copyright_split">|</span><a href="//sale.jd.com/act/pQua7zovWdJfcIn.html" target="_blank">出版物经营许可证</a><span class="copyright_split">|</span><a href="//misc.360buyimg.com/wz/wlwhjyxkz.jpg" target="_blank">网络文化经营许可证京网文[2333]233-233号</a><span class="copyright_split">|</span><span>违法和不良信息举报电话：0123456789</span></p>
            <p><span class="copyright_text">Copyright&nbsp;&copy;&nbsp;2004&nbsp;-&nbsp;<em id="copyright_year">2017</em>&nbsp;&nbsp;买神马Taoshu.com&nbsp;版权所有</span><span class="copyright_split">|</span><span>消费者维权热线：4006067733</span><a href="//sale.jd.com/act/7Y0Rp81MwQqc.html" target="_blank" class="copyright_license">经营证照</a></p>
            <p><span>神马Taoshu旗下网站：</span><a href="https://www.baidu.com/" target="_blank">神马钱包</a><span class="copyright_split">|</span><a href="http://www.baidu.com" target="_blank">神马云</a></p>
        </div>
        <p class="copyright_auth"><a class="copyright_auth_ico copyright_auth_ico_1" href="http://www.hd315.gov.cn/beian/view.asp?bianhao=010202007080200026" target="_blank">经营性网站备案中心</a>
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
            })();</script>
            <a id="urlknet" class="copyright_auth_ico copyright_auth_ico_2" onclick="CNNIC_change('urlknet')" oncontextmenu="return false;" name="CNNIC_seal" href="https://ss.knet.cn/verifyseal.dll?sn=2008070300100000031&amp;ct=df&amp;pa=294005" target="_blank">可信网站信用评估</a><a class="copyright_auth_ico copyright_auth_ico_3" href="http://www.cyberpolice.cn/" target="_blank">网络警察提醒你</a><a class="copyright_auth_ico copyright_auth_ico_4" href="https://search.szfw.org/cert/l/CX20120111001803001836" target="_blank">诚信网站</a><a class="copyright_auth_ico copyright_auth_ico_5" href="http://www.12377.cn" target="_blank">中国互联网举报中心</a><a class="copyright_auth_ico copyright_auth_ico_6" href="http://www.12377.cn/node_548446.htm" target="_blank">网络举报APP下载</a>
        </p>
    </div>
</div>
</body>

</html>
