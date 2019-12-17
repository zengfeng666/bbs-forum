<%--
  Created by IntelliJ IDEA.
  User: luoChunHui
  Date: 2019/12/9
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
<link href = "${pageContext.request.contextPath}/css/post.css" rel = "stylesheet" type = "text/css"/>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<html>
<head>
    <title>Title</title>
    <style>

        a:link, hover{
            text-decoration: none;
        }


        .topAndGood{
            float: left;
            margin: 3px;
        }
        #KindInfo{
            width: 1000px;
            margin: auto;
            border: 3px red solid;
        }
        #KindInfoContent{
            height: 200px;
        }
        #KindInfoTime{
            height: 30px;
            text-align: right;
        }


        td{
            border-bottom: 1px solid #c2d5e3;
        }
        .title{
            font-family: Tahoma,'Microsoft Yahei','Simsun';
            font-size: 14px;
            color: #666;
            width: 600px;
            text-align: left;
        }

        .td_icn{
            padding-left: 5px;
            width: 25px;
            text-align: left;
        }

        .icn{
            width: 25px;
            height: 25px;
        }

        a {
            color: black;
            text-decoration: none;
        }

        .time{
            margin-top: 1px;
            margin-bottom: 1px;
            font-size: 10px;
        }

        .replyNum{
            width: 40px;
            font-size: 14px;
        }

        td{
            line-height: 35px;
        }

        .td5{
            width: 100px;
            padding-top: 1px;
            padding-bottom: 1px;
        }
        .td5_1{
            font-size: 12px;
        }
        .td_2{
            color: #999;
        }
    </style>
</head>
<body>
<jsp:include page="../../top.jsp"></jsp:include>
    <div>
        <table id="KindInfo">
            <tr>
                <td id="KindInfoContent">${kindInfo.content}</td>
            </tr>
            <tr>
                <td id="KindInfoTime">最后编辑于：${kindInfo.time}</td>
            </tr>
        </table>
    </div>
    <div id = "content">

        <table id = "table1" class="table table-hover" rules = "rows">
            <caption>该板块所有帖子如下</caption>
            <c:forEach items = "${postsList}" var = "post">
                <tr>
                    <td class = "td_icn"><img src = "${pageContext.request.contextPath}/images/p1.png" class = "icn"/></td>
                    <td class = "title">

                       <div>
                           <c:if test="${post.isTop == 1}">
                               <img class="topAndGood" src="../images/top.jpg">
                           </c:if>
                           <c:if test="${post.isGood == 1}">
                               <img class="topAndGood" src="../images/good.jpg">
                           </c:if>
                           <a href = "${pageContext.request.contextPath}/post/showAllFloors?pid=${post.pid}">
                               <div>${post.title}</div>
                           </a>
                       </div>
                    </td>
                    <td class = "td5">
                        <div class = "td5_1">${post.nickName}</div>
                        <div class = "td_2 time"><fmt:formatDate value="${post.postTime}" pattern="yyyy-MM-dd HH:mm"/></div>
                    </td>
                    <td class = "replyNum"><div>${post.currentFloor - 1}</div></td>
                    <td class = "td5">
                        <div class = "td5_1">最新回复时间</div>
                        <div class = "time td_2">
                        <fmt:formatDate value="${post.lastActiveTime}" pattern="yyyy-MM-dd HH:mm"/></div>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </div>
</body>
</html>
