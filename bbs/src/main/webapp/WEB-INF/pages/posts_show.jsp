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
<link href = "${pageContext.request.contextPath}/css/post_page.css" rel = "stylesheet" type = "text/css"/>
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


        td{
            border-bottom: 0px solid #c2d5e3;
        }
        .title{
            font-family: Tahoma,'Microsoft Yahei','Simsun';
            font-size: 15px;
            color: #666;
            width: 600px;
            text-align: left;
            padding-top: 20px;
        }


        .span_icn{
            margin-top: 20px;
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
            width: 80px;
            font-size: 14px;
        }

        td{
            line-height: 19px;
        }

        .td5{
            width: 130px;
            padding-top: 1px;
            padding-bottom: 1px;
        }
        .td5_1{
            font-size: 12px;
        }
        .td_2{
            color: #999;
        }
        #KindInfoContentDiv{
            padding: 20px;
            white-space: pre-wrap;
        }




    </style>

    <script>
        function postPosting(){
            location.href = "${pageContext.request.contextPath}/page/post_post";
        }
        /*$(function(){
                if("${postSuccess}" == true){
                    $("#myModal").modal('show')
                    setTimeout(function(){
                        $('#myModal').modal('hide');

                        // 判断是否升级
                        // 获取model中rank的值， 判断是否升级
                        var rank = "${rank}";
                        if(rank > 0){
                            // 如果等级提升，则延迟跳转
                            $("#myModal2").modal('show');
                            setTimeout("$('#myModal2').modal('hide')", 1000);
                        }

                    },1000);
                }
            }
        );*/
    </script>
</head>
<body>
<c:if test="${USER_SESSION.uid == 1}">
    <jsp:include page="../../admin_top.jsp"></jsp:include>
</c:if>
<c:if test="${USER_SESSION.uid!=1}">
    <jsp:include page="../../top.jsp"></jsp:include>
</c:if>

    <div>
        <table id="KindInfo">
            <tr>
                <td id="KindInfoContent"><div id="KindInfoContentDiv">${kindInfo.content}</div></td>
            </tr>
            <tr>
                <td id="KindInfoTime">最后编辑于：<fmt:formatDate value="${kindInfo.time}" pattern="yyyy-MM-dd HH:mm"/></td>
            </tr>
        </table>
    </div>
    <div id="postPre">
        <div class = "post_btn"><input class="btn btn-info" type="button" value="发帖" onclick="postPosting()"></div>
        <div class = "rowPage2">
            <nav aria-label="Page">
                <ul class="pagination">
                    <li><a href="${pageContext.request.contextPath}/post/showPosts?kind=${kind}&pn=1">首页</a></li>

                    <li>
                        <a href="${pageContext.request.contextPath}/post/showPosts?kind=${kind}&pn=${pageInfo.pageNum-1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>

                    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum }">
                            <li class="active"><a href="#">${ page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum }">
                            <li><a href="${pageContext.request.contextPath}/post/showPosts?kind=${kind}&pn=${ page_Num}">${ page_Num}</a></li>
                        </c:if>
                    </c:forEach>

                    <li>
                        <a href="${pageContext.request.contextPath}/post/showPosts?kind=${kind}&pn=${pageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>

                    <li><a href="${pageContext.request.contextPath}/post/showPosts?kind=${kind}&pn=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
    <div id = "contentDiv">

        <table id = "table1" class="table table-hover" rules = "rows">
            <c:forEach items = "${pageInfo.list}" var = "post">
                <tr>
                    <td class = "title">

                       <div>
                           <div>
                               <c:if test="${post.isTop == 1}">
                                   <img class="topAndGood" src="../images/top.jpg">
                               </c:if>
                               <c:if test="${post.isGood == 1}">
                                   <img class="topAndGood" src="../images/good.jpg">
                               </c:if>
                               <span class = "span_icn"> <img src = "${pageContext.request.contextPath}/images/p1.png" class = "icn"/>
                                <a href = "${pageContext.request.contextPath}/post/showAllFloors?pid=${post.pid}&pn=1">
                                        ${post.title}
                                </a></span>
                           </div>
                       </div>
                    </td>
                    <td class = "td5">
                        <div class = "td5_1">${post.nickName}</div>
                        <div class = "td_2 time"><fmt:formatDate value="${post.postTime}" pattern="yyyy-MM-dd HH:mm"/></div>
                    </td>
                    <td class = "replyNum"><div>回复(${post.currentFloor - 1})</div></td>
                    <td class = "td5">
                        <div class = "td5_1">最新回复时间</div>
                        <div class = "time td_2">
                        <fmt:formatDate value="${post.lastActiveTime}" pattern="yyyy-MM-dd HH:mm"/></div>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </div>

<!-- 分页信息 -->
<div class="rowPage">

    <!-- 分页条 -->
    <div>
        <nav aria-label="Page">
            <ul class="pagination">
                <li><a href="${pageContext.request.contextPath}/post/showPosts?kind=${kind}&pn=1">首页</a></li>

                <li>
                    <a href="${pageContext.request.contextPath}/post/showPosts?kind=${kind}&pn=${pageInfo.pageNum-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>

                <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                    <c:if test="${page_Num == pageInfo.pageNum }">
                        <li class="active"><a href="${pageContext.request.contextPath}/post/showPosts?kind=${kind}&pn=${ page_Num}">${ page_Num}</a></li>
                    </c:if>
                    <c:if test="${page_Num != pageInfo.pageNum }">
                        <li><a href="${pageContext.request.contextPath}/post/showPosts?kind=${kind}&pn=${ page_Num}">${ page_Num}</a></li>
                    </c:if>
                </c:forEach>

                <li>
                    <a href="${pageContext.request.contextPath}/post/showPosts?kind=${kind}&pn=${pageInfo.pageNum+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>

                <li><a href="${pageContext.request.contextPath}/post/showPosts?kind=${kind}&pn=${pageInfo.pages}">末页</a></li>
            </ul>
        </nav>
    </div>
</div>


<%--发帖成功要提示--%>
<!-- Button to trigger modal -->


<%--<button class="btn btn-primary btn-lg btn_add" style="display: block;" data-toggle="modal" data-target="#myModal">

    一个按钮

</button>--%>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" style="width: 300px;margin: 100px auto">
        <div class="modal-content" >
            <div class="modal-header">
                发帖成功
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<%--升级提示--%>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 300px;margin: 100px auto">
        <div class="modal-content" >
            <div class="modal-header">
                升级成功
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<jsp:include page="../../bottom.jsp" ></jsp:include>
</body>
</html>
