<%--
  Created by IntelliJ IDEA.
  User: 324014978
  Date: 2019/12/9
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
<link href = "${pageContext.request.contextPath}/css/post.css" rel = "stylesheet" type = "text/css"/>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<html>
<head>
    <title>所有帖子</title>
    <style>
        a:link, hover{
            text-decoration: none;
        }

        #kindInfoModal textarea{
            width: 568px;
            height: 400px;
        }


        .topAndGood{
            float: left;
            margin: 3px;
        }
        #KindInfo{
            width: 1000px;
            margin: 5px auto;
            padding: 15px;
            border-radius: 15px;
            border: 1px #BCD5E4 dotted;
        }
        #KindInfoContent{
            height: 200px;
            border: 0px;
        }
        #KindInfoTime{
            height: 30px;
            text-align: right;
            border: 0px;
        }
        #KindInfoContentDiv{
            padding: 20px;
            white-space: pre-wrap;
        }


        td{
            border-bottom: 0px solid #c2d5e3;
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
            line-height: 19px;
        }

        .td5{
            width: 300px;
            padding-top: 1px;
            padding-bottom: 1px;
        }
        .td5_1{
            font-size: 12px;
        }
        .td_2{
            color: #999;
        }
        #div1{
            width: 200px;
        }
        #div2{
            width: 80px;
        }
        #div3{
            width:80px;
        }
        #div4{
            width: 80px;
        }

        #table1 button{
            width: 82px;
        }

    </style>
</head>
<body>

<script>
    function delP(pid,kind) {
        if(confirm("您确定要将这个帖子删除吗？"))
        location.href = "${pageContext.request.contextPath}/admin/deletePost?pid=" + pid+"&kind="+kind;
    }
    function isTopP(pid,kind) {
        if(confirm("您确定要将这个帖子置顶吗？"))
            location.href = "${pageContext.request.contextPath}/admin/isTopPost?pid=" + pid+"&kind="+kind;
    }
    function isGoodP(pid,kind) {
        if(confirm("您确定要将这个帖子加精吗？"))
            location.href = "${pageContext.request.contextPath}/admin/isGoodPost?pid=" + pid+"&kind="+kind;
    }
    function notTopP(pid,kind) {
        if(confirm("您确定要将这个帖子取消置顶吗？"))
            location.href = "${pageContext.request.contextPath}/admin/notTopPost?pid=" + pid+"&kind="+kind;
    }
    function notGoodP(pid,kind) {
        if(confirm("您确定要将这个帖子取消加精吗？"))
            location.href = "${pageContext.request.contextPath}/admin/notGoodPost?pid=" + pid+"&kind="+kind;
    }
</script>

<c:if test="${USER_SESSION.uid == 1}">
    <jsp:include page="../../admin_top.jsp"></jsp:include>
</c:if>
<c:if test="${USER_SESSION.uid!=1}">
    <jsp:include page="../../top.jsp"></jsp:include>
</c:if>
<div>
    <table id="KindInfo">
        <tr>
            <td colspan="2" id="KindInfoContent"><div id="KindInfoContentDiv">${kindInfo.content}</div></td>
        </tr>
        <tr>
            <td><button id="changeKindInfoBtn" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#kindInfoModal">编辑版块信息</button></td>
            <td id="KindInfoTime">最后编辑于：<fmt:formatDate value="${kindInfo.time}" pattern="yyyy-MM-dd HH:mm"/></td>
        </tr>
    </table>
</div>
<div class="modal fade" id="kindInfoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">请输入版块信息</h4>
            </div>
            <form action="${pageContext.request.contextPath}/admin/changeKindInfo" method="post">
            <div class="modal-body"><textarea maxlength="3000" placeholder="请输入版块信息(不超过3000字)" name="content"></textarea></div>
                <input hidden="hidden" type="text" name="kind" value="${kindInfo.kind}">
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <input type="submit" class="btn btn-primary" value="保存更改">
            </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div id = "contentDiv">

    <table id = "table1" class="table table-hover" rules = "rows">
        <caption>该板块所有帖子如下</caption>
        <c:forEach items = "${postsList}" var = "post">
            <tr>
                <td class = "td_icn"><img src = "${pageContext.request.contextPath}/images/p1.png" class = "icn"/></td>
                <td class = "title">

                    <div id="div1">
                        <c:if test="${post.isTop == 1}">
                            <img class="topAndGood" src="../images/top.jpg">
                        </c:if>
                        <c:if test="${post.isGood == 1}">
                            <img class="topAndGood" src="../images/good.jpg">
                        </c:if>
                        <a href = "${pageContext.request.contextPath}/admin/lookP?pid=${post.pid}">
                            <div>${post.title}</div>
                        </a>
                    </div>
                </td>
                <td><div id="div2"><button  class="btn btn-danger" onclick="delP('${post.pid}','${post.kind}')" value="删除">删除</button></div></td>
                <td><div id="div3">
                    <c:if test="${post.isTop == 0}">
                        <button class="btn btn-info" onclick="isTopP('${post.pid}','${post.kind}')" value="置顶">置顶</button>
                    </c:if>
                    <c:if test="${post.isTop == 1}">
                        <button class="btn btn-info" onclick="notTopP('${post.pid}','${post.kind}')" value="取消置顶">取消置顶</button>
                    </c:if>
                </div></td>
                <td><div id="div4">
                    <c:if test="${post.isGood == 0}">
                        <button class="btn btn-info" onclick="isGoodP('${post.pid}','${post.kind}')" value="加精">加精</button>
                    </c:if>
                    <c:if test="${post.isGood == 1}">
                        <button class="btn btn-info" onclick="notGoodP('${post.pid}','${post.kind}')" value="取消加精">取消加精</button>
                    </c:if>
                </div></td>
                <td class = "td5">
                    <div class = "td5_1">${post.nickName}</div>
                    <div class = "td_2 time"><fmt:formatDate value="${post.postTime}" pattern="yyyy-MM-dd HH:mm"/></div>
                </td>
                <td class = "replyNum"><div id="replyNumDiv">${post.currentFloor - 1}</div></td>
                <td class = "td5">
                    <div class = "td5_1">最新回复时间</div>
                    <div class = "td_2 time">
                        <fmt:formatDate value="${post.lastActiveTime}" pattern="yyyy-MM-dd HH:mm"/></div>
                </td>
            </tr>
        </c:forEach>

    </table>
</div>
<jsp:include page="../../bottom.jsp" ></jsp:include>
</body>
</html>
