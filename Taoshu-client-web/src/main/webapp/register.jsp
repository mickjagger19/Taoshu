<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="cache-control" content="no-cache,no-store, must-revalidate"/>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <!--<base href="${pageContext.request.contextPath }/">-->
    <base href=".">
    <title>注册页面</title>
    <script src="./js/jquery-1.11.1.min.js"></script>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keyword" content="keyword1,keyword2,keyword3">
    <link type="text/css" rel="stylesheet" href="css/register.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="js/bootstrap.js"></script>
    <script src="js/register.js"></script>
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

<body>
<div id="wrapper">
    <div id="middle" class="col-lg-12">
        <div class="logo_container">
            <img class="logo" src="./images/logo.png">
        </div>
        <div class="forms">
            <form id="reg_form1" action="${pageContext.request.contextPath }/user/register"
                  method="post">
                <div class="row">
                    <div id="uname" class="form-group has-success has-feedback" style="margin-top:40px">
                        <div class="col-lg-9 col-lg-offset-2">
                            <input name="uName" class="form-control" style="height:40px;" value="" type="text"
                                   placeholder="昵称"
                                   onblur="checkemail_Any($(&#39;#uname&#39;),$(&#39;#uname; eq(1)&#39;),$(&#39;#uname; eq(0)&#39;),/^([\u4e00-\u9fa5]|[\w+]){1,8}$/;)">
                            <span class="form-control-feedback"></span> <label class="control-label"></label>
                        </div>
                    </div>
                    <div id="uaccount" class="form-group has-success has-feedback">
                        <div class="col-lg-9 col-lg-offset-2">
                            <input name="uAccount" class="form-control" style="height:40px;" value="" type="text"
                                   placeholder="账号(6~12个非中文字符)"
                                   onblur="checkemail_Any($(&#39;#uaccount&#39;),$(&#39;#uaccount; eq(1)&#39;),$(&#39;#uaccount; eq(0)&#39;),/^[\w+]{6,12}$/;)">
                            <span class="form-control-feedback"></span>
                            <label class=" control-label"></label>
                        </div>
                    </div>
                    <div id="pwd" class="form-group has-success has-feedback">
                        <div class="col-lg-9 col-lg-offset-2">
                            <input name="uPwd" class="form-control" style="height:40px;" value="" type="password"
                                   placeholder="密码(6~12个非中文字符)"
                                   onblur="checkemail_Any($(&#39;#pwd&#39;),$(&#39;#pwd; eq(1)&#39;),$(&#39;#pwd; eq(0)&#39;),/^[\w+]{6,12}$/;)">
                            <span class="form-control-feedback"></span> <label class=" control-label"></label>
                        </div>
                    </div>
                    <div id="pwd2" class="form-group has-success has-feedback">
                        <div class="col-lg-9 col-lg-offset-2">
                            <input class="form-control" style="height:40px;" value="" type="password"
                                   placeholder="再次输入密码" onblur="checkpwd();">
                            <span class="form-control-feedback"></span> <label class=" control-label"></label>
                        </div>
                    </div>
                    <div id="email" class="form-group has-success has-feedback">
                        <div class="col-lg-9 col-lg-offset-2">
                            <input name="uEmail" class="form-control" style="height:40px;" value="" type="email"
                                   placeholder="邮箱"
                                   onblur="checkemail_Any($(&#39;#email&#39;),$(&#39;#email; eq(1)&#39;),$(&#39;#email; eq(0)&#39;),/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+$/;)">
                            <span class="form-control-feedback"></span>
                            <label class=" control-label"></label>
                        </div>
                    </div>
                    <div id="tel" class="form-group has-success has-feedback">
                        <div class="col-lg-9 col-lg-offset-2">
                            <input name="uTel" class="form-control" style="height:40px;" value="" type="tel"
                                   placeholder="手机号"
                                   onblur="checkemail_Any($(&#39;#tel&#39;),$(&#39;#tel; eq(1)&#39;),$(&#39;#tel; eq(0)&#39;),/^1(3|4|5|6|7|8)[0-9]{9}$/;)">
                            <span class="form-control-feedback"></span> <label class=" control-label"></label>
                        </div>
                    </div>
                </div>
                <div id="argee_reg">
                    <input type="checkbox" value="1" onclick="argee_reg()"> <label>我已同意<a
                        href="${pageContext.request.contextPath }/#" class="text-primary"
                        style="color: deepskyblue;font-size: smaller">《淘书网用户使用协议》</a> 和<a
                        href="${pageContext.request.contextPath }/#" class="text-primary"
                        style="color: deepskyblue;font-size: smaller">《淘书网账号中心规范》</a></label>
                </div>
                <div class="row" style="text-align: center">
                    <div>
                        <label> <a href="${pageContext.request.contextPath }/login.jsp"
                                   style="color: deepskyblue;font-size: smaller;">已有账号，直接登录&gt;</a>
                        </label>
                    </div>
                    <br>
                    <div id="butt" style="text-align: center">
                        <button class="btn btn-danger" type="button" value="提交" onclick="checkAgain();"
                                disabled="disabled">
                            注册
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