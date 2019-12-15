<%--
  Created by IntelliJ IDEA.
  User: WangYuYang
  Date: 2019/12/15
  Time: 13:25
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
        <title>帖子搜索结果</title>
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

            #replyNum{
                width: 40px;
            }
        </style>
    </head>
    <body>

        <div>
            <table id = "table1" class="table table-hover">
                <caption>搜索出的帖子如下</caption>
                <c:forEach items = "${posts}" var = "post">
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
