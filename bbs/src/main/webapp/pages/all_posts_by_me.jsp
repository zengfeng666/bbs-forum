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
    <style>
        td{
            width: 200px;
        }
    </style>
</head>
<body>

    <div>
        <table>
            <caption>我发布的所有帖子</caption>
            <c:forEach items = "${posstListByMe}" var = "post">
                <tr>
                    <td><div>${post.title}</div></td>
                    <td><div>${post.nickName}</div></td>
                    <td><div>${post.lastActiveTime}</div></td>
                    <td><div>${post.currentFloor - 1}</div></td>
                </tr>
            </c:forEach>

        </table>

    </div>

</body>
</html>
