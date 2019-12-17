<%--
  Created by IntelliJ IDEA.
  User: 敖俊
  Date: 2019/12/17
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style type="text/css">
        #bottomDiv{
            width: 100%;
            height: 130px;
            text-align: center;
        }
        .bottom_title1{
            margin: 20px;
        }

    </style>
</head>
<body>
<div id="bottomDiv">
    <br><br><br>
    <span class="bottom_title1"><a href="https://github.com/MeCelestial/bbs-forum">开源地址</a></span>|
    <span class="bottom_title1"><a target="_blank" href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=w7ml8fD28fX18vfy94OlrLuuoqqv7aCsrg">给我写信</a></span>|
    <span class="bottom_title1"><a  href="${pageContext.request.contextPath}/index.jsp">回到首页</a></span>|
    <span class="bottom_title1"><a href="javascript:scroll(0,0)">返回顶部</a></span>
    <br>
    <span class="bottom_title2">CopyRight©2019-2020 NCU. All Right Reserved</span>

</div>
</body>
</html>
