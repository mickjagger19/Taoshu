<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keyword" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
	<meta charset="UTF-8">
	<title>商品查看</title>
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/first_page.js"></script>
	<link rel="stylesheet" href="css/marketingWebsite.css">
	<link rel="stylesheet" href="css/first_page.css" />
	<link rel="stylesheet" href="css/bootstrap.css" />
	<link rel="stylesheet" href="css/product_view.css" />
	<link rel="stylesheet" href="css/hend_photo.css" />
	<script src="js/bootstrap.js"></script>
	<!-- 引入弹框 -->
	<link rel="stylesheet" type="text/css" href="css/jquery-confirm.css" />
	<script type="text/javascript" src="js/jquery-confirm.js"></script>
	<script type="text/javascript">
		function addShoppingCar(u_id, p3_id) {
			$.post('ajax/addProductToShoppingCar.do', {
				'u_id': u_id,
				'p3_id': p3_id
			}, function(data) {
				if (data > 0) {
					/* alert('商品已放入购物车，快去看看吧！'); */
					$.alert({
						title: '小提示：',
						content: '商品已放入购物车，快去看看吧！',
						confirmButton: '确认',
						confirmButtonClass: 'btn-info',
						animation: 'bottom',
						icon: 'fa fa-check',
						backgroundDismiss: true
					});
				} else {
					$.alert({
						title: '小提示：',
						content: '加入购物车失败啦！',
						confirmButton: '确认',
						confirmButtonClass: 'btn-info',
						animation: 'bottom',
						icon: 'fa fa-check',
						backgroundDismiss: true
					});
				}

			}, 'json');

		}

		function addAttention(p3_id) {

			$.post('ajax/addAttentionServlet.do', { 'p3_id': p3_id }, function(data) {
				if (data > 0) {

					$("#att_but").attr("disabled", true);
					$("#att_but").html('已关注');
					/* alert("添加关注成功"); */
					$.alert({
						title: '小提示：',
						content: '添加关注成功！',
						confirmButton: '确认',
						confirmButtonClass: 'btn-info',
						animation: 'bottom',
						icon: 'fa fa-check',
						backgroundDismiss: true
					});
				} else {
					/* alert("添加关注失败了~~"); */
					$.alert({
						title: '小提示：',
						content: '添加关注失败了~~',
						confirmButton: '确认',
						confirmButtonClass: 'btn-info',
						animation: 'bottom',
						icon: 'fa fa-check',
						backgroundDismiss: true
					});
				}

			}, 'html');

		}
	</script>
	<style>
		.w a:link {
			color: #A0A0A0;
		}

		.w a:visited {
			color: #A0A0A0;
		}

		.w a:hover {
			color: red;
		}

		.button,
		.buy_now{
			font-size: 15px;
			color:#FF0036;
			text-align: center;
			width:178px;
			height:38px;
			background-color:#ffeded;
			border:1px solid #FF0036;
		}
	</style>
</head>

<body>
<div id="globa">
	<div id="top">
		<form id="keywordform" action="${pageContext.request.contextPath }/index/searchResult" method="post">
			<div id="logo" style="margin-top: 0px">
				<a href="${pageContext.request.contextPath }/index/indexServlet">
					<img src="./images/logo.png" style="margin-top:15px">
				</a>
			</div>
			<div id="find" class="input-group">
				<input id="keyword" name="keyword" type="text" class="form-control" placeholder="搜索书籍" value="" />
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
			<div id="clearboth"></div>
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
	<div id="clearboth"></div>
	<div id="middle">
		<div>
			您现在的位置：
			<ul class="breadcrumb">
				<li><a href="#">首页</a></li>
				<li class="active">商品浏览</li>
			</ul>
		</div>
		<c:forEach var="p_info" items="${productionById }">
			<div id="center" style="width: 1190px">
				<div id="left">
					<div class="product_picture">
						<img src="http://${p_info.pPicture }" width="418" height="418">
					</div>
				</div>
				<div class="product">
					<h3>${p_info.pName }</h3>
					<button id="att_but" class="btn btn-danger btn-sm" style="margin-left: 500px;margin-top: -30px" onclick="addAttention(${p_info.pId })">关注</button>
					<!-- <hr style="height:1px;border:none;border-top:1px dashed #A0A0A0;"/> -->
					<div class="picture_describe">
						<ul>
							<li>价格: <label style="font-weight:bold;color: red;font-size: 25px;margin-left:70px">￥${p_info.pPrice }</label></li>
							<li>本地区有货</li>
						</ul>
					</div>
					<div class="product_content">
						<label style="font-size: 18px;font-family: '微软雅黑'; font-weight: bold; margin-top:20px">商品详情</label>
						<hr style="height: 2px; background-color:#A0A0A0;" />
					</div>
					<div class="product_content2">
						<ul>
							<li style="width:300px;">商品描述：${p_info.pIntro.length()>100?p_info.pIntro.substring(0,100):p_info.pIntro}</li>
							<li>商品类别：${p_info.pCategory }</li>
							<li>商品库存：${p_info.pStock }</li>
							<li>添加日期：${p_info.pTime }</li>
						</ul>
					</div>
					<div class="buy_product" >
						<a href="${pageContext.request.contextPath }/product/immediatelyBuy?u_id=${user.uId}&p3_id=${p_info.pId }" style="display: inline-block;">
							<div class="buy_now" >
								<h1 style="font-size:15px;margin-top:10px">现在购买</h1>
							</div>
						</a>
						<button class="button" type="button" style="display: inline-block;font-color:#FFFFFF"; onclick="addShoppingCar('${user.uId}','${p_info.pId }')">放入购物车</button>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div id="clearboth"></div>
	<div id="service-2017">
		<div class="w">
		</div>
		<div class="jd-help">
			<div class="w">
				<div class="wrap">
					<dl class="fore1">
						<dt>购物指南</dt>
						<dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-29.html">购物流程</a>
						</dd>
						<dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-151.html">会员介绍</a>
						</dd>
						<dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-297.html">生活旅行/团购</a>
						</dd>
						<dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue.html">常见问题</a></dd>
						<dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-136.html">大家电</a>
						</dd>
						<dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/index.html">联系客服</a></dd>
					</dl>
					<dl class="fore2">
						<dt>配送方式</dt>
						<dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-81-100.html">上门自提</a>
						</dd>
						<dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-81.html">211限时达</a>
						</dd>
						<dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/103-983.html">配送服务查询</a>
						</dd>
						<dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/109-188.html">配送费收取标准</a>
						</dd>
						<dd><a target="_blank" href="//en.jd.com/chinese.html">海外配送</a></dd>
					</dl>
					<dl class="fore3">
						<dt>支付方式</dt>
						<dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-172.html">货到付款</a>
						</dd>
						<dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-173.html">在线支付</a>
						</dd>
						<dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-176.html">分期付款</a>
						</dd>
						<dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-174.html">邮局汇款</a>
						</dd>
						<dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-175.html">公司转账</a>
						</dd>
					</dl>
					<dl class="fore4">
						<dt>售后服务</dt>
						<dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/321-981.html">售后政策</a>
						</dd>
						<dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-132.html">价格保护</a>
						</dd>
						<dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/130-978.html">退款说明</a>
						</dd>
						<dd><a rel="nofollow" target="_blank" href="//myjd.jd.com/repair/repairs.action">返修/退换货</a>
						</dd>
						<dd><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-50.html">取消订单</a>
						</dd>
					</dl>
					<dl class="fore5">
						<dt>特色服务</dt>
						<dd>
							<a target="_blank" href="//help.jd.com/user/issue/list-133.html">夺宝岛</a>
						</dd>
						<dd>
							<a target="_blank" href="//help.jd.com/user/issue/list-134.html">DIY装机</a>
						</dd>
						<dd>
							<a rel="nofollow" target="_blank" href="//fuwu.jd.com/">延保服务</a>
						</dd>
						<dd>
							<a rel="nofollow" target="_blank" href="//o.jd.com/market/index.action">TS卡</a>
						</dd>
						<dd>
							<a rel="nofollow" target="_blank" href="//mobile.jd.com/">TS通信</a>
						</dd>
						<dd>
							<a rel="nofollow" target="_blank" href="//s.jd.com/">TS+</a>
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
				<p><a href="//about.jd.com" target="_blank">关于我们</a><span class="copyright_split">|</span><a href="//about.jd.com/contact/" target="_blank">联系我们</a><span class="copyright_split">|</span><a href="//help.jd.com/user/custom.html" target="_blank">联系客服</a><span class="copyright_split">|</span><a href="//vc.jd.com/cooperation.html" target="_blank">合作招商</a><span class="copyright_split">|</span><a href="//helpcenter.jd.com/venderportal/index.html" target="_blank">商家帮助</a><span class="copyright_split">|</span><a href="//jzt.jd.com" target="_blank">营销中心</a><span class="copyright_split">|</span><a href="//app.jd.com/" target="_blank">手机Taoshu</a><span class="copyright_split">|</span><a href="//club.jd.com/links.aspx" target="_blank">友情链接</a><span class="copyright_split">|</span><a href="//media.jd.com/" target="_blank">销售联盟</a><span class="copyright_split">|</span><a href="//club.jd.com/" target="_blank">Taoshu社区</a><span class="copyright_split">|</span><a href="//sale.jd.com/act/FTrWPesiDhXt5M6.html" target="_blank">风险监测</a><span class="copyright_split">|</span><a href="//about.jd.com/privacy/" target="_blank">隐私政策</a><span class="copyright_split">|</span><a href="//gongyi.jd.com" target="_blank">Taoshu公益</a>
				</p>
			</div>
			<div class="copyright_info">
				<p><a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11000002000088" target="_blank">京公网安备
					11000002000088号</a><span class="copyright_split">|</span><span>京AICP证23333号</span><span class="copyright_split">|</span><a href="//img14.360buyimg.com/da/jfs/t256/349/769670066/270505/3b03e0bb/53f16c24N7c04d9e9.jpg" target="_blank">互联网药品信息服务资格证编号(京)-经营性-2018-8888</a><span class="copyright_split">|</span><span>新出发京零&nbsp;字第大120007号</span>
				</p>
				<p><span>互联网出版许可证编号新出网证(京)字150号</span><span class="copyright_split">|</span><a href="//sale.jd.com/act/pQua7zovWdJfcIn.html" target="_blank">出版物经营许可证</a><span class="copyright_split">|</span><a href="//misc.360buyimg.com/wz/wlwhjyxkz.jpg" target="_blank">网络文化经营许可证京网文[2333]233-233号</a><span class="copyright_split">|</span><span>违法和不良信息举报电话：0123456789</span></p>
				<p><span class="copyright_text">Copyright&nbsp;&copy;&nbsp;2004&nbsp;-&nbsp;<em id="copyright_year">2017</em>&nbsp;&nbsp;Taoshu.com&nbsp;版权所有</span><span class="copyright_split">|</span><span>消费者维权热线：4006067733</span><a href="//sale.jd.com/act/7Y0Rp81MwQqc.html" target="_blank" class="copyright_license">经营证照</a>
				</p>
				<p><span>Taoshu旗下网站：</span><a href="https://www.baidu.com/" target="_blank">钱包</a><span class="copyright_split">|</span><a href="http://www.baidu.com" target="_blank">淘书云</a>
				</p>
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
</div>
</div>
</body>

</html>