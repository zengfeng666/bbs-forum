<%--
  Created by IntelliJ IDEA.
  User: zengfeng
  Date: 2019/12/7
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>BBS论坛首页</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <jsp:include page="../../top.jsp"></jsp:include>
        <div class="header">
            欢迎你，${USER_SESSION.nickname}
            <button type="button" class="login1"><a href="${pageContext.request.contextPath}/page/login">登录</a></button>
            <button type="button" class="register1"><a href="${pageContext.request.contextPath}/page/register">注册</a></button>
            <button type="button" class="register1"><a href="${pageContext.request.contextPath}/user/logout">注销</a></button>
        </div>
    </body>
</html>