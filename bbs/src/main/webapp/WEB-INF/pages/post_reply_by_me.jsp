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
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <link href = "${pageContext.request.contextPath}/css/post.css" rel = "stylesheet" type = "text/css"/>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <style>

        a:link, hover{
            text-decoration: none;
        }

        .postInfo{
            background-color: #d9edf7;
            font-size: 14px;
            border: 1px blue solid;

            height: 70px;
            line-height: 70px;
            padding-left: 18px;
        }

        .td1{
            font-size: 20px;
        }

        .td1_1{
            width: 200px;
            float: left;
        }
        .td1_2{
            width: 200px;
            float: right;
            font-size: 15px;
            color: gray;
        }

        .content3{
            clear: both;
            font-size: 15px;
        }

        .refer{
            font-size:45px;
            color: gray;
           margin-bottom: -50px;
        }

        #content2{
            margin-top: 0px;
        }

        .td1_5{
            width: 650px;
            float: left;
        }
        .td1_6{
            width: 100px;
            float: left;
        }
        .td1_7{
            width: 150px;
            float: left;
        }

        #post{
            padding-top: 5px;
            padding-bottom: 5px;
            width: 1000px;
            margin: auto;
        }
    </style>

    <script>
        function postPosting(){
            location.href = "${pageContext.request.contextPath}/page/post_post";
        }
    </script>
</head>
<body>
<jsp:include page="../../top.jsp"></jsp:include>
<div id = "post">
    <input class="btn btn-info" type="button" value="发帖" onclick = "postPosting()">
</div>
    <div id = "content">
        <table id="table1" rules = "rows">
            <c:forEach items = "${replyMapByMe}" var = "replyMap">
                <tr>
                    <td>
                        <div style = "margin-top: 15px; margin-bottom: 20px;">
                            <div class = "td1">
                                <div class = "td1_1"><a href = "#">${USER_SESSION.nickname}</a>&nbsp;回复</div>
                                <div class = "td1_2">
                                    <fmt:formatDate value="${replyMap.value.replyTime}" pattern = "yyy-MM-dd"/>
                                </div>

                            </div>
                           <div class = "content3">
                               <span class = "refer">“</span><span id = "content2">${replyMap.value.content}</span><span class = "refer">”</span><span>回复</span></div>
                            <div class = "postInfo">
                                <div class = "td1_5"><a href = "${pageContext.request.contextPath}/post/showAllFloors?pid=${replyMap.key.pid}">${replyMap.key.title}</a></div>
                                <div class = "td1_6">&nbsp;&nbsp;回复(${replyMap.key.currentFloor - 1})</div>
                               <div class = "td1_7">来自&nbsp;<a href = "#"> --&nbsp;&nbsp;${replyMap.key.nickName}</a></div>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>

        </table>

    </div>
<jsp:include page="../../bottom.jsp"></jsp:include>
</body>
</html>
