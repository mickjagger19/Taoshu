<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/4
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>


<html>
<head>
    <base href="<%=basePath%>">
    <title>跳转页面</title>
    <script src="js/jquery-1.11.1.min.js"></script>
    <script language="javascript">
        function tiao(){
            window.location.href="${pageContext.request.contextPath }/index/indexServlet";
            window.open('index.jsp',"_self");
        }
        setTimeout("tiao()",3000);
        function changSec(){
            $("myspan").innerText=parseInt($("myspan").innerText)-1;
        }
        var mytime=setInterval("changSec()",1000);
        function $(id){
            return document.getElementById(id);
        }
    </script>
</head>
<body>
<h2>注册成功！  &nbsp;<span id="myspan">3</span>&nbsp;&nbsp;秒后自动跳转到首页......</h2>
</body>
</html>
