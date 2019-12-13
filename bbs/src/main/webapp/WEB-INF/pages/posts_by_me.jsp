<%--
  Created by IntelliJ IDEA.
   User: luoChunHui
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

        #table1{
            width: 800px;
            margin: auto;
            border-color: blue;
        }

        #replyNum{
            width: 40px;
        }
    </style>
    <script>
        function deletePost(id){
            if(confirm("你确定要删除这个帖子吗？")){
                location.href = "${pageContext.request.contextPath}/post/deletePost?pid=" + id;
            }
        }
    </script>
</head>
<body>

    <div>
        <table border = "1" rules = "rows" id = "table1" class="table table-hover">
            <caption>我发布的所有帖子</caption>
            <c:forEach items = "${postListByMe}" var = "post">
                <tr>
                    <td id = "replyNum"><div>${post.currentFloor - 1}</div></td>
                    <td>
                        <a href = "${pageContext.request.contextPath}/post/showAllFloors?pid=${post.pid}">
                        <div>${post.title}</div>
                        </a>
                    </td>
                    <td><div>${post.nickName}</div></td>
                    <td>发帖时间：<div>${post.postTime}</div></td>
                    <td>
                        <input class="btn btn-danger" type="button" value = "删除" onclick = "deletePost('${post.pid}')" />
                    </td>
                </tr>
            </c:forEach>

        </table>
    </div>
</body>
</html>
