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
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link href = "${pageContext.request.contextPath}/css/post.css" rel = "stylesheet" type = "text/css"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <style>

        .margin {
            margin-top: 10px;
            color: black;
        }

        a:link, hover {
            text-decoration: none;
        }

        #contentDiv .title1{
            width: 500px;
            font-size: 16px;
            color: black;
        }


        .nickname {
            width: 100px;
            font-size: 15px;
        }

        .date_1 {
            font-size: 13px;
            width: 100px;
        }

        .replyNum {
            font-size: 14px;
            width: 50px;
        }


        .td1_1 {

            width: 20px;
            height: 20px;
        }


        #post{

            padding-top: 5px;
            padding-bottom: 5px;
            width: 1000px;
            margin: auto;
        }

        .deletePost{
            width: 80px;
            font-size: 14px;
            text-align: right;
        }


    </style>
    <script>
        function deletePost(id){
            if(confirm("你确定要删除这个帖子吗？")){
                location.href = "${pageContext.request.contextPath}/post/deletePost?pid=" + id;
            }
        }

        function postPosting(){
            location.href = "${pageContext.request.contextPath}/page/post_post";
        }
    </script>
</head>
<body>
<c:if test="${USER_SESSION.uid == 1}">
    <jsp:include page="../../admin_top.jsp"></jsp:include>
</c:if>
<c:if test="${USER_SESSION.uid!=1}">
    <jsp:include page="../../top.jsp"></jsp:include>
</c:if>
    <div id="post">
        <input class="btn btn-info" type="button" value="发帖" onclick="postPosting()">
    </div>
<div id = "contentDiv">

        <table rules = "rows" id = "table1" class="table table-hover">

            <c:forEach items = "${postListByMe}" var = "post">
                <tr>

                    <td>
                        <div  class = "title1 margin">
                            <img src = "${pageContext.request.contextPath}/images/p3.png" class = "td1_1">&nbsp;
                            <a href = "${pageContext.request.contextPath}/post/showAllFloors?pid=${post.pid}">${post.title} </a></div>
                    </td>
                    <td><div class = "nickname margin">${post.nickName}</div></td>
                    <td ><div class = "replyNum margin">回复(${post.currentFloor - 1})</div></td>
                    <td>
                        <div class = "date_1">
                        <fmt:formatDate value="${post.postTime}" pattern = "yyy-MM-dd HH:MM:ss"/>
                    </div></td>
                    <td>
                        <div class = "deletePost margin"><a href = "${pageContext.request.contextPath}/page/post_post">删除</a></div>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </div>
<jsp:include page="../../bottom.jsp"></jsp:include>
</body>
</html>
