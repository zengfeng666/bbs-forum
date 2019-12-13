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
        body{
            text-align: center;

        }

        a:link, hover{
            text-decoration: none;
        }

        table{
            width: 700px;
            margin: auto;
            border-color: blue;
        }

        #postInfo{
            background-color: #d9edf7;
            font-size: 14px;
            border: 1px blue solid;
            width: 80%;
            height: 70px;
            line-height: 70px;
            padding-left: 18px;
        }

        #firstRow1{
            font-size: 20px;
        }

        #content{
            font-size: 15px;

        }

        .refer{
            font-size:45px;
            color: gray;
           margin-bottom: -50px;
        }

        #date{
            font-size: 15px;
            color: gray;
        }

        #div1{
            width: 800px;
            display: block;
        }

        #content2{
            margin-top: 0px;
        }
    </style>

</head>
<body>

    <div id = "div1">
        <table class="table">
            <caption>我回复的所有帖子</caption>
            <c:forEach items = "${replyMapByMe}" var = "replyMap">
                <tr>
                   <%-- <td id = "replyNum"><div>${post.currentFloor - 1}</div></td>
                    <td>
                        <a href = "${pageContext.request.contextPath}/post/showAllFloors?pid=${post.pid}">
                            <div>${post.title}</div>
                        </a>
                    </td>
                    <td><div>${post.nickName}</div></td>
                    <td><div>${post.lastActiveTime}</div></td>--%>

                    <td>
                        <div style = "margin-top: 15px; margin-bottom: 20px;">
                            <div id = "firstRow1">
                                <span><a href = "#">${USER_SESSION.nickname}</a>&nbsp;回复</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span id = "date">${replyMap.value.replyTime}</span>

                            </div>
                           <div id = "content">
                               <span class = "refer">“</span><span id = "content2">${replyMap.value.content}</span><span class = "refer">”</span><span>回复</span></div>
                            <div id = "postInfo">
                                <span><a href = "${pageContext.request.contextPath}/post/showAllFloors?pid=${replyMap.key.pid}">${replyMap.key.title}</a></span>
                                <span>回复(${replyMap.key.currentFloor - 1})</span>
                                --&nbsp;&nbsp;<span>来自&nbsp;<a href = "#">${replyMap.key.nickName}</a></span>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>

        </table>

    </div>

</body>
</html>
