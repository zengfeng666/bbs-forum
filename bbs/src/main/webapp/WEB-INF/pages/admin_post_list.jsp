<%--
  Created by IntelliJ IDEA.
  User: 324014978
  Date: 2019/12/9
  Time: 18:48
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
    <title>所有帖子</title>
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

        .topAndGood{
            float: left;
            margin: 3px;
        }
        #KindInfo{
            width: 1200px;
            margin: auto;
            border: 3px red solid;
        }
        #KindInfoContent{
            height: 600px;
        }
        #KindInfoTime{
            height: 30px;
            text-align: right;
        }
        textarea{
            width: 520px;
            height: 500px;
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

<jsp:include page="../../admin_top.jsp" ></jsp:include>
<div>
    <table id="KindInfo">
        <tr>
            <td colspan="2" id="KindInfoContent">${kindInfo.content}</td>
        </tr>
        <tr>
            <td><button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#kindInfoModal">编辑版块信息</button></td>
            <td id="KindInfoTime">最后编辑于：${kindInfo.time}</td>
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
            <div class="modal-body"><textarea name="content"></textarea></div>
                <input hidden="hidden" type="text" name="kind" value="${kindInfo.kind}">
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <input type="submit" class="btn btn-primary" value="保存更改">
            </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div>
    <table id = "table1" class="table table-hover">
        <caption>该板块所有帖子如下</caption>
        <c:forEach items = "${postsList}" var = "post">
            <tr>
                <td id = "replyNum"><div>${post.currentFloor - 1}</div></td>
                <td>
                    <c:if test="${post.isTop == 1}">
                        <img class="topAndGood" src="../images/top.jpg">
                    </c:if>
                    <c:if test="${post.isGood == 1}">
                        <img class="topAndGood" src="../images/good.jpg">
                    </c:if>
                    <a href = "${pageContext.request.contextPath}/admin/lookP?pid=${post.pid}">
                        <div>${post.title}</div>
                    </a>
                </td>
                <td><div>${post.nickName}</div></td>
                <td><div>${post.lastActiveTime}</div></td>
                <td><div><button onclick="delP('${post.pid}','${post.kind}')" value="删除">删除</button></div></td>
                <td><div>
                    <c:if test="${post.isTop == 0}">
                        <button onclick="isTopP('${post.pid}','${post.kind}')" value="置顶">置顶</button>
                    </c:if>
                    <c:if test="${post.isTop == 1}">
                        <button onclick="notTopP('${post.pid}','${post.kind}')" value="取消置顶">取消置顶</button>
                    </c:if>
                </div></td>
                <td><div>
                    <c:if test="${post.isGood == 0}">
                        <button onclick="isGoodP('${post.pid}','${post.kind}')" value="加精">加精</button>
                    </c:if>
                    <c:if test="${post.isGood == 1}">
                        <button onclick="notGoodP('${post.pid}','${post.kind}')" value="取消加精">取消加精</button>
                    </c:if>
                </div></td>
            </tr>
        </c:forEach>

    </table>
</div>
</body>
</html>
