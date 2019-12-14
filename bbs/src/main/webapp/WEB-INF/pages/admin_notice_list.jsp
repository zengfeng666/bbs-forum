<%--
  Created by IntelliJ IDEA.
  User: 敖俊
  Date: 2019/12/14
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<html>
<head>
    <title>管理员公告</title>
    <style>
        td{
            width: 200px;
        }
        a:link, hover{
            text-decoration: none;
        }

        #table1{
            width: 800px;
            margin: auto;
            border: 1px blue solid;
        }

        .title{
            width: 800px;
        }
        .time{
            width: 200px;
        }
        .content{
            width: 1000px;
        }
    </style>
</head>
<body>
<div>
    <table id = "table1" class="table table-hover">
        <caption>所有公告如下</caption>
        <c:forEach items = "${noticesList}" var = "notice">
            <tr>
                <td class="title"><div>${notice.title}</div></td>
                <td class="time"><div>${notice.noticeTime}</div></td>
            </tr>
            <tr>
                <td class="content"><div>${notice.content}</div></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
