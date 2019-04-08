<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <base href="<%=basePath%>">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keyword" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>淘书网结算界面</title>
    <script src="js/jquery-1.11.1.min.js"></script>


    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/bootstrap.css" >
    <link rel="stylesheet" href="css/base.css" />
    <link rel="stylesheet" href="css/checkOut.css" />
    <link rel="stylesheet" href="css/hend_photo.css" />


    <script src="js/bootstrap.js"></script>
    <script src="js/first_page.js"></script>
    <script src="js/distpicker.data.js"></script>
    <script src="js/distpicker.js"></script>
    <script src="js/main.js"></script>
    <script type="text/javascript">
        /**
         * Created by Administrator on 2017/11/17 0017.
         */
        $(document).ready(function() {

            $("#AddresFormHidden").hide();


        });

        function showNewAddress() {
            if ($('#AddresFormHidden').is(':hidden')) {
                $('#AddresFormHidden').show(1000);

            } else {
                $('#AddresFormHidden').hide(1000);
            }
        }

        //用户添加新的收货地址
        function addAddress() {

            var uname = $('#AddresFormHidden p:eq(0) input').val(); //收货人
            var na_label = $('#AddresFormHidden p:eq(1) input').val(); //地址标签
            var na_tel = $('#AddresFormHidden p:eq(2) input').val(); //手机号
            var na_province = $('#AddresFormHidden div:eq(1) div:eq(0) select').val(); //省
            var na_city = $('#AddresFormHidden div:eq(1) div:eq(1) select').val(); //市
            var na_district = $('#AddresFormHidden div:eq(1) div:eq(2) select').val(); //（区/县）
            var particular = $('#AddresFormHidden p:eq(3) input').val(); //详细地址

            $.post('ajax/addaddressServlet.do', {
                'uname': uname,
                'na_label': na_label,
                'na_tel': na_tel,
                'na_province': na_province,
                'na_city': na_city,
                'na_district': na_district,
                'particular': particular
            }, function(data) {
                if (data > 0) {
                    //把隐藏表单的内容放入显示区
                    $('#addnewaddress span:eq(0)').html(uname);
                    $('#addnewaddress span:eq(1)').html(na_label);
                    $('#addnewaddress span:eq(2)').html(na_tel);
                    $('#addnewaddress span:eq(3)').html(na_province + "&nbsp;" + na_city + "&nbsp;" + na_district);
                    $('#addnewaddress span:eq(4)').html(particular);
                } else {
                    /*alert("不知道什么原因，新的收货地址并没有创建~~");*/
                    $.alert({
                        title: '小提示：',
                        content: '不知道什么原因，新的收货地址并没有创建~~',
                        confirmButton: '确认',
                        confirmButtonClass: 'btn-info',
                        animation: 'bottom',
                        icon: 'fa fa-check',
                        backgroundDismiss: true
                    });
                }

            }, 'json');

            $('#AddresFormHidden').hide(1000);
        }

        //提交订单
        function submitOrderForm(sids) {

            $.post('ajax/submitOrderForm.do', { sids: sids.toString(), 'abc': '大海航行靠舵手' }, function(data) {
                if (data > 0) {
                    alert("下单成功啦~");
                    window.location.href = '/user/myInformation';
                    /*$.alert({
                          title: '小提示：',
                          content: '下单成功啦~',
                          confirmButton: '确认',
                          confirmButtonClass: 'btn-info',
                          animation: 'bottom',
                          icon: 'fa fa-check',
                          backgroundDismiss: true
                      });*/



                } else {
                    $.alert({
                        title: '小提示：',
                        content: '下单失败啦~',
                        confirmButton: '确认',
                        confirmButtonClass: 'btn-info',
                        animation: 'bottom',
                        icon: 'fa fa-check',
                        backgroundDismiss: true
                    });
                    /*alert ("下单失败了~");*/
                }
            }, 'json');




        }
    </script>
    <!-- SunAndPay.js END -->
    <!-- 引入弹框 -->
    <link rel="stylesheet" type="text/css" href="css/jquery-confirm.css" />
    <script type="text/javascript" src="js/jquery-confirm.js"></script>
</head>

<body>
<!--顶部快捷菜单-->
<div class="shortcut_v2013 alink_v2013">
    <div class="w">
        <ul class="fl 1h">
            <li class="fl">
                <div class="menu_hd"><a href="${pageContext.request.contextPath }/user/myInformation?u_id=${user.uId}">[ ${user.uName} ]</a>您好，欢迎来到淘书网！</div>
            </li>
            <li class="fl">
                <div class="menu_hd"><a href="${pageContext.request.contextPath }/user/loginout">退出登录</a></div>
            </li>
            <li class="fl">
                <div class="menu_hd"><a href="${pageContext.request.contextPath }/register.jsp">免费注册</a></div>
            </li>
        </ul>
        <ul class="fr 1h">
            <li class="fl">
                <div class="menu_hd"><a href="${pageContext.request.contextPath }/user/myInformation?u_id=${user.uId}">我的订单</a></div>
            </li>
            <li class="fl"><i class="shortcut_s"></i></li>
            <li class="fl">
                <div class="menu_hd"><a href="${pageContext.request.contextPath }/user/myInformation?u_id=${user.uId}">我的淘书</a></div>
            </li>
        </ul>
        <span class="clr"></span>
    </div>
</div>
<!--顶部快捷菜单-->
<!--顶部Logo及搜索-->
<div class="header_2013">
    <div class="w">
        <div class="logo_v2013">
            <a href="#">
                <img src="./images/logo.png" style="width: 40%">
            </a>
        </div>
        <div class="header_searchbox">
            <form action="#">
                <input name="search" type="text" style="height: auto" class="header_search_input" default_val="淘书网三期上线全场五折" autocomplete="off" x-webkit-speech="" x-webkit-grammar="builtin:search" lang="zh">
                <button type="submit" class="header_search_btn">搜索</button>
            </form>
        </div>
        <div id="cart_box" class="cart_box">
            <a id="cart" class="cart_link" href="${pageContext.request.contextPath }/shop/shoppingCarServlet.do?u_id=${user.uId}" rel="nofollow">
                <span class="text">回购物车</span>
                <img src="images/shopping_icon.png" width="24" height="24">
                <!-- 购物车没有物品时，隐藏此num -->
                <span class="num" style="margin-left: 2px"></span>
                <s class="icon_arrow_right"></s>
            </a>
        </div>
        <span class="clr"></span>
    </div>
</div>
<!--顶部Logo及搜索-->
<!--  导航条    start-->
<div class="yHeader">
    <div class="shop_Nav">
        <div class="pullDown">
            <h2 class="pullDownTitle"><i></i>全部商品分类</h2>
        </div>
        <ul class="Menu_box">
            <li><a href="" target="_blank" class="yMenua">首页</a></li>
            <li><a href="" target="_blank">大划算</a></li>
            <li><a href="" target="_blank">抢拍</a></li>
            <li><a href="" target="_blank">Taoshu专场</a></li>
            <li><a href="" target="_blank">Toashu超市</a></li>
        </ul>
        <div class="fr r_icon"><i class="i01"></i><span>30天退货</span><i class="i02"></i><span>满59包邮</span></div>
    </div>
</div>
<!--  导航条    end-->
<div class="banner_red_top">
</div>
<!--收货地址body部分开始-->
<div class="container">
    <div class="checkout-box">
        <form id="checkoutForm" action="#" method="post">
            <div class="checkout-box-bd">
                <div id="checkoutPayment">
                    <!-- 支付方式 -->
                    <div class="xm-box">
                        <div class="box-hd ">
                            <h2 class="title">支付方式</h2>
                        </div>
                        <div class="box-bd">
                            <ul id="checkoutPaymentList" class="checkout-option-list clearfix J_optionList">
                                <li class="item selected">
                                    <input type="radio" name="Checkout[pay_id]" checked="checked" value="1">
                                    <p>
                                        在线支付 <span></span>
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- 支付方式 END-->
                    <div class="xm-box">
                        <div class="box-hd ">
                            <h2 class="title">配送方式</h2>
                        </div>
                        <div class="box-bd">
                            <ul id="checkoutShipmentList" class="checkout-option-list clearfix J_optionList">
                                <li class="item selected">
                                    <input type="radio" data-price="0" name="Checkout[shipment_id]" checked="checked" value="1">
                                    <p>
                                        快递配送（免运费） <span></span>
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- 送货时间 -->
                <div class="xm-box">
                    <div class="box-hd">
                        <h2 class="title">送货时间</h2>
                    </div>
                    <div class="box-bd">
                        <ul class="checkout-option-list clearfix J_optionList">
                            <li class="item selected"><input type="radio" checked="checked" name="Checkout[best_time]" value="1" onclick="checked();">
                                <p>不限送货时间<span>周一至周日</span></p>
                            </li>
                            <li class="item "><input type="radio" name="Checkout[best_time]" value="2" onclick="checked();">
                                <p>工作日送货（目前不支持选择送货时间，敬请谅解）<span>周一至周五</span></p>
                            </li>
                            <li class="item "><input type="radio" name="Checkout[best_time]" value="3" onclick="checked();">
                                <p>双休日、假日送货（目前不支持选择送货时间，敬请谅解）<span>周六至周日</span></p>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- 送货时间 END-->
                <!-- 发票信息 -->
                <div id="checkoutInvoice">
                    <div class="xm-box">
                        <div class="box-hd">
                            <h2 class="title">发票信息</h2>
                        </div>
                        <div class="box-bd">
                            <ul class="checkout-option-list checkout-option-invoice clearfix J_optionList J_optionInvoice">
                                <li class="hide">
                                    电子个人发票4
                                </li>
                                <li class="item selected">
                                    <!--<label><input type="radio"  class="needInvoice" value="0" name="Checkout[invoice]">不开发票</label>-->
                                    <input type="radio" checked="checked" value="4" name="Checkout[invoice]">
                                    <p>电子发票（非纸质）</p>
                                </li>
                                <li class="item ">
                                    <input type="radio" value="1" name="Checkout[invoice]">
                                    <p>普通发票（纸质）（目前不开具普通发票，敬请谅解）</p>
                                </li>
                            </ul>
                            <p id="eInvoiceTip" class="e-invoice-tip ">
                                电子发票是税务局认可的有效凭证，可作为售后维权凭据，不随商品寄送。开票后不可更换纸质发票，如需报销请选择普通发票。<a href="http://bbs.xiaomi.cn/thread-9285999-1-1.html" target="_blank">什么是电子发票？</a>
                            </p>
                            <div class="invoice-info nvoice-info-1" id="checkoutInvoiceElectronic" style="display:none;">
                                <p class="tip">电子发票目前仅对个人用户开具，不可用于单位报销 ，不随商品寄送</p>
                                <p>发票内容：购买商品明细</p>
                                <p>发票抬头：个人</p>
                                <p>
                                    <span class="hide"><input type="radio" value="4" name="Checkout[invoice_type]" checked="checked" id="electronicPersonal" class="invoiceType"></span>
                                <dl>
                                    <dt>什么是电子发票?</dt>
                                    <dd>&#903; 电子发票是纸质发票的映像，是税务局认可的有效凭证，与传统纸质发票具有同等法律效力，可作为售后维权凭据。</dd>
                                    <dd>&#903; 开具电子服务于个人，开票后不可更换纸质发票，不可用于单位报销。</dd>
                                    <dd>&#903; 您在订单详情的"发票信息"栏可查看、下载您的电子发票。<a href="http://bbs.xiaomi.cn/thread-9285999-1-1.html" target="_blank">什么是电子发票？</a>
                                    </dd>
                                </dl>
                                </p>
                            </div>
                            <div class="invoice-info invoice-info-2" id="checkoutInvoiceDetail" style="display:none;">
                                <p>发票内容：购买商品明细</p>
                                <p>
                                    发票抬头：请确认单位名称正确,以免因名称错误耽搁您的报销。注：合约机话费仅能开个人发票
                                </p>
                                <ul class="type clearfix J_invoiceType">
                                    <li class="hide">
                                        <input type="radio" value="0" name="Checkout[invoice_type]" id="noNeedInvoice">
                                    </li>
                                    <li class="">
                                        <input class="invoiceType" type="radio" id="commonPersonal" name="Checkout[invoice_type]" value="1">
                                        个人
                                    </li>
                                    <li class="">
                                        <input class="invoiceType" type="radio" name="Checkout[invoice_type]" value="2">
                                        单位
                                    </li>
                                </ul>
                                <div id='CheckoutInvoiceTitle' class=" hide  invoice-title">
                                    <label for="Checkout[invoice_title]">单位名称：</label>
                                    <input name="Checkout[invoice_title]" type="text" maxlength="49" value="" class="input"> <span class="tip-msg J_tipMsg"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 发票信息 END-->
            </div>
            <div>
                <div>
                    <h4 class="title" style="color: black">收货地址</h4>
                    <hr>
                </div>
                <div>
                    <div id="addnewaddress" style="border: 1px solid gainsboro;width: 40%">
                        <c:forEach var="add_list" items="${rectenlyAddress }">
                            <h3 style="margin-left: 35px">收件人：<span class="label label-info" style="margin-left: 5px">${add_list.naName }</span></h3><br>
                            <h4 style="margin-left: 35px">地址标签：<span class="label label-info" style="margin-left: 5px">家</span></h4><br>
                            <h4 style="margin-left: 35px">手机号：<span class="label label-info" style="margin-left: 5px">${add_list.naTel }</span></h4><br>
                            <h4 style="margin-left: 35px">所在省市：<span class="label label-info" style="margin-left: 5px">${add_list.naProvince }&nbsp;${add_list.naCity }&nbsp;${add_list.naDistrict }</span></h4><br>
                            <h4 style="margin-left: 35px">详细地址：<span class="label label-info" style="margin-left: 5px">${add_list.particularAddress }</span></h4><br>
                        </c:forEach>
                        <input class="btn btn-danger" style="margin-left: 150px;margin-bottom: 20px" type="button" value="使用新地址" onclick="showNewAddress();">
                    </div>
                    <!--点击弹出新增/收货地址界面start-->
                    <script src="js/bootstrap.js"></script>
                    <script src="js/distpicker.data.js"></script>
                    <script src="js/distpicker.js"></script>
                    <script src="js/main.js"></script>
                    <div id="AddresFormHidden" style="width:30%;border: 1px solid gainsboro;margin-left: 100px">
                        <h5 style="margin-top: 10px">请编辑您的新收货信息:</h5>
                        <form id="getaddress_form" class="form-inline" action="myInformationServlet.do" method="post">
                            <div class="input-group input-group-lg">
                                <p>姓名：<input class="form-control" id="get_name" value="" style="margin-top: 5px;"></p><br>
                                <p>地址标签（家/公司/学校）：<input id="get_label" class="form-control" value=""></p><br>
                                <p>联系方式（手机号）：<input id="get_number" class="form-control" value=""></p>
                            </div>
                            <div data-toggle="distpicker" style="margin-top: 10px">
                                <div class="form-group">
                                    <label class="sr-only" for="province2">Province</label>
                                    <select class="form-control" id="province2" data-province="---- 选择省 ----"></select>
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="city2">City</label>
                                    <select class="form-control" id="city2" data-city="---- 选择市 ----"></select>
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="district2">District</label>
                                    <select class="form-control" id="district2" data-district="---- 选择区 ----"></select>
                                </div>
                            </div>
                            <p>详细地址：<input class="form-control" id="particular" value=""></p>
                            <input type="button" class="btn btn-success" onclick="addAddress();" value="保存">&nbsp;<input type="reset" class="btn btn-success" value="重置" />
                        </form>
                        <script src="js/distpicker.data.js"></script>
                        <script src="js/distpicker.js"></script>
                        <script src="js/main.js"></script>
                    </div>
                    <!--点击弹出新增/收货地址界面end-->
                </div>
            </div>
            <!-- 收货地址 END-->
            <div class="checkout-box-ft">
                <!-- 商品清单 -->
                <div id="checkoutGoodsList" class="checkout-goods-box">
                    <div class="xm-box">
                        <div class="box-hd">
                            <h2 class="title">确认订单信息</h2>
                        </div>
                        <div class="box-bd">
                            <dl class="checkout-goods-list">
                                <dt class="clearfix">
                                    <span class="col col-1">商品名称</span>
                                    <span class="col col-2">购买价格</span>
                                    <span class="col col-3">购买数量</span>
                                    <span class="col col-4">小计（元）</span>
                                </dt>
                                <c:forEach var="s_resultList" items="${productInSumAndPay }">
                                    <dd class="item clearfix">
                                        <div class="item-row">
                                            <div class="col col-1">
                                                <div class="g-pic">
                                                    <img src="${s_resultList.productList.pPicture }" width="40" height="40" />
                                                </div>
                                                <div class="g-info">
                                                    <a href="#">
                                                            ${s_resultList.productList.pName } </a>
                                                </div>
                                            </div>
                                            <div class="col col-2">${s_resultList.productList.pPrice }</div>
                                            <div class="col col-3">${s_resultList.sPcounts }</div>
                                            <div class="col col-4">${s_resultList.productList.pPrice*s_resultList.sPcounts }</div>
                                        </div>
                                    </dd>
                                </c:forEach>
                            </dl>
                            <div class="checkout-count clearfix">
                                <div class="checkout-count-extend xm-add-buy">
                                    <h3 class="title">会员留言</h3></br>
                                    <input type="text" value="在这里写东西其实没用的啦！额 -。-；" />
                                </div>
                                <!-- checkout-count-extend -->
                                <div class="checkout-price">
                                    <ul>
                                        <li>
                                            订单总额：<span>${total}元</span>
                                        </li>
                                        <li>
                                            活动优惠：<span>-0元</span>
                                            <script type="text/javascript">
                                                checkoutConfig.activityDiscountMoney = 0;
                                                checkoutConfig.totalPrice = 244.00;
                                            </script>
                                        </li>
                                        <li>
                                            优惠券抵扣：<span id="couponDesc">-0元</span>
                                        </li>
                                        <li>
                                            运费：<span id="postageDesc">0元</span>
                                        </li>
                                    </ul>
                                    <p class="checkout-total">可获积分：<span><strong id="totalPrice">${integral}</strong></span></p>
                                    <p class="checkout-total">应付总额：<span><strong id="totalPrice">${total} </strong>元</span></p>
                                </div>
                                <!--  -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 商品清单 END -->
                <input type="hidden" id="couponType" name="Checkout[couponsType]">
                <input type="hidden" id="couponValue" name="Checkout[couponsValue]">
                <div class="checkout-confirm">
                    <a href="/user/shoppingCar" class="btn btn-lineDakeLight btn-back-cart">返回购物车</a>
                    <button class="btn btn-primary" value="立即下单" id="checkoutToPay" onclick="submitOrderForm(${sids})">立即下单</button>
                </div>
            </div>
        </form>
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
                        <a rel="nofollow" target="_blank" href="//o.jd.com/market/index.action">TaoshuE卡</a>
                    </dd>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//mobile.jd.com/">Taoshu通信</a>
                    </dd>
                    <dd>
                        <a rel="nofollow" target="_blank" href="//s.jd.com/">Taoshu+</a>
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
            (function() {
                var d = new Date;
                document.getElementById("copyright_year").innerHTML = d.getFullYear()
            })();
            </script>
            <a id="urlknet" class="copyright_auth_ico copyright_auth_ico_2" onclick="CNNIC_change('urlknet')" oncontextmenu="return false;" name="CNNIC_seal" href="https://ss.knet.cn/verifyseal.dll?sn=2008070300100000031&amp;ct=df&amp;pa=294005" target="_blank">可信网站信用评估</a><a class="copyright_auth_ico copyright_auth_ico_3" href="http://www.cyberpolice.cn/" target="_blank">网络警察提醒你</a><a class="copyright_auth_ico copyright_auth_ico_4" href="https://search.szfw.org/cert/l/CX20120111001803001836" target="_blank">诚信网站</a><a class="copyright_auth_ico copyright_auth_ico_5" href="http://www.12377.cn" target="_blank">中国互联网举报中心</a><a class="copyright_auth_ico copyright_auth_ico_6" href="http://www.12377.cn/node_548446.htm" target="_blank">网络举报APP下载</a>
        </p>
    </div>
</div>
<!-- 底部 -->
<script src="js/jquery-1.11.1-min.js"></script>
</body>

</html>
