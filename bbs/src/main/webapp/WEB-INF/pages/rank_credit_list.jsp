<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>排行榜</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style type="text/css">
        td {
            font-size: 14px;
            border-width: 0px;
        }

        a {
            text-decoration: none;
        }

        #table-div {
            border: 1px solid #CDCDCD;
            margin: auto;
            width: 1000px;
        }

        .td1 {
            width: 780px;
            text-align: left;
        }

        .td2 {
            text-align: right;
        }

        #img_ask {
            width: 76px;
            height: 32px;
            margin: 5px;
            margin-left: 259px;
        }
    </style>
</head>
<body>
<jsp:include page="../../top.jsp"></jsp:include>
<div id="table-div">
    <table class="table table-hover">
        <tr>
            <td>
                排名
            </td>
            <td>
                昵称
            </td>
            <td>
                性别
            </td>
            <td>
                积分
            </td>
            <td>
                等级
            </td>
        </tr>

        <c:forEach items="${list}" var="list" varStatus="vs">
            <tr>
                <td>
                        ${vs.count}
                </td>
                <td >
                        ${list.nickname}
                </td>
                <td>
                        ${list.sex}
                </td>
                <td>
                        ${list.credit}
                </td>
                <td>
                        ${list.rank}
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
