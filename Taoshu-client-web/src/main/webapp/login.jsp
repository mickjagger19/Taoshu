<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%
    String preUrl = request.getHeader("Referer");
    session.setAttribute("preUrl",preUrl);
%>
<!DOCTYPE html>
<!-- saved from url=(0063)${pageContext.request.contextPath }/register.jsp -->
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="cache-control" content="no-cache,no-store, must-revalidate" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <base href="<%=basePath%>">
    <title>页面</title>
    <script src="js/jquery-1.11.1.min.js"></script>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <link type="text/css" rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="js/bootstrap.js"></script>
    <script src="js/login.js"></script>
    <!-- <script src="./js/register.js"></script> -->
    <style>
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

<%--<script>--%>
    <%--window.onload = function(){--%>
        <%--var success = "true";--%>
        <%--if ( ${loginSuccess!=null})--%>
            <%--success= ${loginSuccess!=null};--%>

        <%--console.log("success: " + success);--%>
        <%--if ( success=="false") {--%>
            <%--$(".fail").remove();--%>
            <%--console.log("正在移除中");--%>

        <%--}--%>
    <%--};--%>
<%--</script>--%>
<body>
<div id="wrapper">
    <div id="clearboth"></div>
    <div id="middle" class="col-lg-12">
        <div class="logo_container">
            <img class="logo" src="./images/logo.png" alt="">
            <p class="fail"> 用户名或密码错误！请重试 </p>
        </div>
        <div class="forms">
            <form id="form" action="${pageContext.request.contextPath}/user/login" method="post">
                <div id="clearboth"></div>
                <div class="row">
                    <div id="uaccount" class="form-group has-success has-feedback">
                        <div class="col-lg-9 col-lg-offset-2">
                            <input name="uAccount" class="form-control" style="height:40px;" value="" type="text" placeholder="账号">
                            <span class="form-control-feedback"></span>
                            <label class="control-label"></label>
                        </div>
                    </div>
                    <div id="pwd" class="form-group has-success has-feedback">
                        <div class="col-lg-9 col-lg-offset-2">
                            <input name="uPwd" class="form-control" style="height:40px;" value="" type="password" placeholder="密码">
                            <span class="form-control-feedback"></span> <label class=" control-label"></label>
                        </div>
                    </div>
                </div>
                <div class="row" style="text-align: center">
                    <div>
                        <label>
                            <a href="${pageContext.request.contextPath }/register.jsp" style="color: deepskyblue;font-size: smaller;">还没账号，注册一个&gt;</a>
                        </label>
                    </div>
                    <br>
                    <div id="butt">
                        <button class="btn btn-danger" type="button" value="提交" onclick="checkAgain();">
                            登录
                        </button>
                    </div>
                </div>
            </form>
            <br>
        </div>
    </div>
    <div id="clearboth"></div>
    <br>
</div>
</body>

</html>