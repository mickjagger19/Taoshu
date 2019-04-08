<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    int sum = 0;
%>
<!DOCTYPE html>
<!DOCTYPE html>

<head>
    <base href="<%=basePath%>">
    <title>我的购物车</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keyword" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/first_page.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="css/first_page.css"/>
    <link type="text/css" rel="stylesheet" href="css/product_view.css"/>
    <link rel="stylesheet" href="css/hend_photo.css"/>
    <link type="text/css" rel="stylesheet" href="css/shopping.css"/>

    <!-- <script type="text/javascript" src="js/shoppingCar.js"></script> -->
    <!-- shoppingcar.js STAR -->
    <script type="text/javascript">
        function deleteProduct(product_id, u_id) {

            var f = confirm('是否删除该商品？');
            if (f) {
                $.post('ajax/deleteShopFromShoppingcar.do', {'p_id': product_id,'u_id':u_id},{function (data) {
                    if (data > 0) {
                        $(product_id).remove();
                        productCount();
                    } else {
                        /*alert("删除失败！");*/
                        $.alert({
                            title: '小提示：',
                            content: '删除失败！',
                            confirmButton: '确认',
                            confirmButtonClass: 'btn-info',
                            animation: 'bottom',
                            icon: 'fa fa-check',
                            backgroundDismiss: true
                        });
                    }

                }}, 'html');
            }

            window.location.reload();
        }

        /*
         * 全选商品
         * */
        var flag = true; //全选的标识
        /**
         * 全选
         */
        function checkAll() {

            var pcbs = $("input[name='p_checkedbox']");
            if (flag) {
                for (var i = 0; i < pcbs.length; i++) {
                    pcbs[i].checked = "checked";
                }
                flag = false;
            } else {
                for (var i = 0; i < pcbs.length; i++) {
                    pcbs[i].checked = "unchecked";
                }
                flag = true;
            }
            productCount();

        }

        /**
         * 批量删除商品
         */


        function deleteChecked() {

            var arrs = [];
            var count = 0; //作为数组的下标
            var pcbs = $("input[name='p_checkedbox']");
            //alert(pcbs.length)
            for (var i = 0; i < pcbs.length; i++) {
                var f = pcbs[i].checked;

                if (f == true) { //如果选中了，记录下选中的value值,value设置成S_ID
                    arrs[count] = pcbs[i].value;

                    // console.log(pcbs[i].value)
                    count++;
                }
            }


            if (count > 0) { //如果count>0说明选择了商品可以删除，否则不删除

                var f = confirm('确认删除商品吗?');
                if (f) {
                    //执行删除才进入ajax
                    /*alert(arrs.length);*/
                    $.post('ajax/deleteSomeShopFromShoppingcarAjax.do', {
                        's_ids': arrs.toString()
                    }, function (data) {

                        if (data > 0) {
                            /* alert('删除成功啦！');*/
                            for (var i = 0; i < arrs.length; i++) {
                                $('#product_id_' + arrs[i]).remove();
                                productCount();
                            }
                        } else {
                            /*alert("不知道什么原因，删除失败啦！");*/
                            $.alert({
                                title: '小提示：',
                                content: '不知道什么原因，删除失败啦！',
                                confirmButton: '确认',
                                confirmButtonClass: 'btn-info',
                                animation: 'bottom',
                                icon: 'fa fa-check',
                                backgroundDismiss: true
                            });

                        }
                    }, 'json');
                }

            }
        }


        /*改变所购商品的数量*/
        function changeNum(numId, flag, s_id) { /*numId表示对应商品数量的文本框ID，flag表示是增加还是减少商品数量*/
            var numId = document.getElementById(numId);

            if (flag === "minus") { /*减少商品数量*/
                if (numId.value <= 1) {
                    /*alert("宝贝数量必须是大于0");*/
                    $.alert({
                        title: '小提示：',
                        content: '宝贝数量必须是大于0~',
                        confirmButton: '确认',
                        confirmButtonClass: 'btn-info',
                        animation: 'bottom',
                        icon: 'fa fa-check',
                        backgroundDismiss: true
                    });
                    return false;
                } else {
                    $.post('ajax/addOrCutDownShoppingcar.do', {'s_id': s_id, 'flag': flag}, function (data) {
                        if (data > 0) {
                            numId.value = parseInt(numId.value) - 1;
                            productCount();
                        } else {
                            /*alert("不知道什么原因，出错啦！");*/
                            $.alert({
                                title: '小提示：',
                                content: '不知道什么原因，出错啦！',
                                confirmButton: '确认',
                                confirmButtonClass: 'btn-info',
                                animation: 'bottom',
                                icon: 'fa fa-check',
                                backgroundDismiss: true
                            });
                        }
                    });
                }

            } else { /*flag为add，增加商品数量*/
                $.post('ajax/addOrCutDownShoppingcar.do', {'s_id': s_id, 'flag': flag}, function (data) {
                    if (data > 0) {
                        numId.value = parseInt(numId.value) + 1;
                        productCount();
                    } else {
                        /*alert("不知道什么原因，出错啦！");*/
                        $.alert({
                            title: '小提示：',
                            content: '不知道什么原因，出错啦~',
                            confirmButton: '确认',
                            confirmButtonClass: 'btn-info',
                            animation: 'bottom',
                            icon: 'fa fa-check',
                            backgroundDismiss: true
                        });
                    }
                });
            }
        }

        /*自动计算商品的总金额、总共节省的金额和积分*/
        function productCount() {

            var total = 0; //商品金额总计
            var price; //每一行商品的单价
            var number; //每一行商品的数量
            /*访问ID为shopping表格中所有的行数*/

            var myTableTr = document.getElementById("buy_table").getElementsByTagName("tr");

            if (myTableTr.length > 0) {
                for (var i = 1; i < myTableTr.length; i++) { //从1开始，第一行的标题不计算
                    if (myTableTr[i].getElementsByTagName("input")[0].checked) {
                        /*alert(myTableTr[i].getElementsByTagName("input")[0].value);*/
                        if (myTableTr[i].getElementsByTagName("td").length > 1) { //从第二行算起

                            //单价
                            price = myTableTr[i].getElementsByTagName("td")[4].getElementsByTagName("span")[0].innerHTML;

                            //数量
                            // number = myTableTr[i].getElementsByTagName("td")[4].getElementsByTagName("input")[1].value;

                            number = 1;
                            total += price * number;

                            // myTableTr[i].getElementsByTagName("td")[5].getElementsByTagName("span")[0].innerHTML = price * number;

                        } else {
                            myTableTr.remove(myTableTr[i]);
                        }
                    }
                }
                document.getElementById("total").innerHTML = total;
                // document.getElementById("total2").value = total;


            }
        }

        window.onload = productCount;

        //将购物车中商品‘前往结算’
        function ChangeS_states() {
            var arrs = [];
            var count = 0; //作为数组的下标
            var pcbs = $("input[name='p_checkedbox']");
            //alert(pcbs.length)
            for (var i = 0; i < pcbs.length; i++) {
                var f = pcbs[i].checked;

                if (f == true) { //如果选中了，记录下选中的value值,value设置成S_ID
                    arrs[count] = pcbs[i].value;

                    // console.log(pcbs[i].value)
                    count++;
                }
            }

            if (count > 0) {
                $('#my_sids').val(arrs.toString());
                $('#shopping').submit();
            } else {
                /*alert ("购物车里没东西哟，快去买买买吧~");*/
                $.alert({
                    title: '小提示：',
                    content: '购物车里没东西哟，快去买买买吧~',
                    confirmButton: '确认',
                    confirmButtonClass: 'btn-info',
                    animation: 'bottom',
                    icon: 'fa fa-check',
                    backgroundDismiss: true
                });
            }

        }
    </script>
    <!-- shoppingcar.js END -->
    <!-- 引入弹框 -->
    <link rel="stylesheet" type="text/css" href="css/jquery-confirm.css"/>
    <script type="text/javascript" src="js/jquery-confirm.js"></script>
</head>

<body>
<div id="globa">
    <div id="top">
        <form id="keywordform" action="${pageContext.request.contextPath }/index/searchResult" method="post">
            <div id="logo" style="margin-top: 19px">
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
                <li class="active">购物车</li>
            </ul>
        </div>
        <form id="shopping" action="${pageContext.request.contextPath }/user/sumBeforeServlet" method="post">
            <div id="buy_table_div" class="buy_table">
                <table id="buy_table" class="table table-bordered table-hover table-condensed">
                    <tr>
                        <td></td>
                        <td>图片</td>
                        <td>商品名称</td>
                        <td>商品价格</td>
                        <td>总价</td>
                        <td>操作</td>
                    </tr>
                    <c:forEach var="product" items="${productList}" varStatus="index">
                        <tr style="vertical-align: middle">
                            <td>
                                <div>
                                    <label>
                                        <input type="checkbox" value="${product }" name="p_checkedbox"
                                               checked="checked" class="checkbox1" onclick="productCount();">
                                    </label>
                                </div>
                            </td>
                            <td style="width:4px">
                                <img src="http://${product.pPicture}" width="100px"
                                     height="100px" alt="">
                            </td>
                            <td>
                                <span style="text-align:center">${product.pName.length()>20?product.pName.substring(0,20):product.pName}</span>
                            </td>
                            <!--单价-->
                            <td style="font-size: 20px;color: red;font-weight: bold">
                                <div>
                                    ￥<span>${product.pPrice }</span>
                                </div>
                            </td>
                            <td style="font-size: 20px;color: red;font-weight: bold">
                                <div>
                                    ￥<span>${product.pPrice}</span>
                                </div>
                            </td>
                            <td>
                                <div>
                                    <a onclick="deleteProduct('${product.pId}','${user.uId}')">删除</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <div style="margin-top: 88px;margin-left: 28px">
                </div>
            </div>
            <div class="buy_picture ">
                <div>
                    商品总价（不含运费）：<label id="total" name="total"
                                      style="font-size: 20px;color: red;font-weight: bold"></label>元
                </div>
                <input id="my_sids" type="hidden" name="my_sids" value="">
                <img src="img/sum_shopping.jpg" width="179" height="42" onclick="ChangeS_states();">
            </div>

        </form>
        <div id="clearboth"></div>
        <div id="footer">Copyright © 2018 Mick All Rights Reserved.</div>
    </div>
</div>
</body>

</html>
