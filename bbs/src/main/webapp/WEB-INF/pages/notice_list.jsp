<%--
  Created by IntelliJ IDEA.
  User: 敖俊
  Date: 2019/12/15
  Time: 15:56
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
    <title>公告</title>
    <style>
        #table1{
            width: 1000px;
            margin: auto;
        }
        #table1 .title{
            width: 850px;
        }
        #table1 .time{
            width: 150px;
            font-weight: 100;
            font-size: 0.7em;
        }
        #table1 .content{
            width: 1000px;
            white-space: pre-line;
        }
        #table1 .th_tr{
            height: 30px;
            background-color: #F0F0EE;
        }
        #table1 .content{
            width: 984px;
            white-space: pre-wrap;
        }
    </style>
</head>
<body>
<c:if test="${USER_SESSION.uid == 1}">
    <jsp:include page="../../admin_top.jsp"></jsp:include>
</c:if>
<c:if test="${USER_SESSION.uid!=1}">
    <jsp:include page="../../top.jsp"></jsp:include>
</c:if>
<table id = "table1" class="table table-hover">
    <caption>所有公告如下</caption>
    <c:forEach items = "${noticesList}" var = "notice">
        <tr class="th_tr">
            <th class="title"><div>${notice.title}</div></th>
            <th class="time"><div>${notice.noticeTime}</div></th>
        </tr>
        <tr class="td_tr">
            <td colspan="2"><div class="content">${notice.content}</div></td>
        </tr>
    </c:forEach>
</table>
<jsp:include page="../../bottom.jsp"></jsp:include>
</body>
</html>
