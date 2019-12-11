<%--
  Created by IntelliJ IDEA.
  User: 324014978
  Date: 2019/12/9
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <style>
        td{
            width: 200px;
        }
        a:link, hover{
            text-decoration: none;
        }

        table{
            width: 640px;
            margin: auto;
            border-color: blue;
        }

        #replyNum{
            width: 40px;
        }


    </style>

</head>
<body>

    <div>
        <table class="table table-hover">
            <caption>我回复的所有帖子</caption>
            <c:forEach items = "${replyListByMe}" var = "post">
                <tr>
                    <td id = "replyNum"><div>${post.currentFloor - 1}</div></td>
                    <td>
                        <a href = "${pageContext.request.contextPath}/post/showAllFloors?pid=${post.pid}">
                            <div>${post.title}</div>
                        </a>
                    </td>
                    <td><div>${post.nickName}</div></td>
                    <td><div>${post.lastActiveTime}</div></td>

                </tr>
            </c:forEach>

        </table>

    </div>

</body>
</html>
