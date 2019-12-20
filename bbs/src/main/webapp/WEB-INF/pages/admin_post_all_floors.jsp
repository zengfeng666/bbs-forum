<%--
  Created by IntelliJ IDEA.
  User: luoChunHui
  Date: 2019/12/10
  Time: 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>看帖</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <link href = "${pageContext.request.contextPath}/css/post_page.css" rel = "stylesheet" type = "text/css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


    <style>

        a:link, hover{
            text-decoration: none;
        }

        #table1{
            width: 1000px;
            border: 1px solid #C2D5E3;
            background: #FFF;
            margin: auto;
        }

        .td1{
            width: 160px;
            overflow: hidden;
            border-right: 1px solid #C2D5E3;

        }

        #table1 #cap_td1{
            width: 160px;
            height: 35px;
            background-color: #E5EDF2;
        }

        #cap_td2{
            width: 840px;
            height: 30px;
            color: black;
            font-weight: bolder;
            font-family: 黑体;
            font-size: 20px;
            padding-left: 30px;
        }

        #table1 .td0_1{
            width: 160px;
            background: #C2D5E3;
            overflow: hidden;
            border-right: 1px solid #C2D5E3;
            height: 5px;
        }

        #table1 .left{
            float: left;
            height: 210px;
            width: 160px;
            background: #E5EDF2;
        }

        .right{
            float: left;
            width: 800px;

        }

        .photo{
            width: 120px;
            height: 120px;
            border: 2px solid white;
        }

        .photo_div{
            padding-top: 8px;
            width: 125px;
            height: 125px;
            margin: 0px auto;
        }

        .nickname{
            font-size: 20px;
            float: left;
            font-family: 黑体;
            color: black;
            padding: 10px;
            padding-left: 20px;
            width: 160px;
            border-bottom: 1px #CDCDCD dashed;
            background: #E5EDF2;
        }

        .rank{
            font-size: 15px;
            text-align: center;
            margin-top: 0;
        }

        .right_1{
            font-size: 20px;
            color: black;
            height: 37px;
            margin-top: 0;
            padding: 10px;
            padding-left: 20px;
            width: 800px;


            float: left;
        }

        .div_icn2{
            float: left;
            width: 25px;
        }

        .icn2{
            width: 20px;
            height: 20px;

        }

        .time{
            float: left;
            font-size: 15px;
            width: 400px;
        }

        .fid{
            float: right;
            font-size: 14px;
            width: 50px;
            color: red;
        }

        .right_content{
            padding: 20px;
            height: 160px;
        }


        .contentBottom{
            height: 30px;
            margin-bottom: 10px;
        }

        .delete{
            float: right;
            width: 100px;
        }

        .edit{
            float: right;
            width: 100px;
        }

        textarea{
            width: 564px;
            height: 500px;
        }

        a{
            text-decoration: none;
        }


    </style>
    <script>
        function deleteReply(fid, pid){
            if(confirm("您确定要删除该层回复吗？")){
                location.href = "${pageContext.request.contextPath}/admin/deletePR?pid=" + pid + "&fid=" + fid;
            }
        }

        $("#editContentModal").modal("hide");
        function editContent(pid,fid,content) {
            $("#pid").val(pid);
            $("#fid").val(fid);
            $("#content_textarea").val(content);
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
<div id ="content">
    <table border = "1" rules = "rows" style = "border-collapse: collapse;" id = "table1">
        <caption>
            <td id = "cap_td1"></td>
            <td  id = "cap_td2">
                ${postWithAllFloor.title}
            </td>
        </caption>
        <tr>
            <td class = "td0_1"></td>
            <td class = "td0_1"></td>
        </tr>
        <c:forEach items = "${pageInfo.list}" var = "floor">
            <tr>
                <td colspan = "2">
                    <div class = "nickname">${floor.nickname}</div>
                    <div class = "right_1">
                        <div class = "div_icn2"><img src = "${pageContext.request.contextPath}/images/p2.png" class = "icn2"/></div>
                        <div class = "time">发表于：<fmt:formatDate value="${floor.replyTime}" pattern = "yyy-MM-dd HH:mm:ss"/></div>
                        <div class = "fid">${floor.fid}# &nbsp;&nbsp;</div>
                    </div>
                </td>
            </tr>
            <tr>
                <td class = "td1" colspan="2">
                    <div class = "left">
                        <div class = "photo_div">
                            <img src = "${pageContext.request.contextPath}/images/${floor.photo}" class = "photo"/>
                        </div>
                        <div class = "rank">Lv：${floor.rank}</div>
                    </div>



                    <div class = "right">
                        <div class = "right_content">${floor.content}</div>
                        <div class = "contentBottom">

                                <%--如果是true,则添加一个删除按钮，传入fid, pid,删除该楼层--%>
                            <c:if test = "${ floor.fid != 1}">
                                <div class = "delete">
                                    <button  class="btn btn-danger" onclick="deleteReply('${floor.fid}', '${floor.pid}')" value="删除">删除</button>
                                </div>
                                &nbsp;
                            </c:if>
                                    <div class = "edit">
                                        <button class="btn btn-primary" data-toggle="modal" data-target="#editContentModal" onclick="editContent('${floor.pid}','${floor.fid}', '${floor.content}')">修改内容</button></div>
                        </div>
                    </div>
                </td>

            </tr>
            <tr>
                <td class = "td0_1"></td>
                <td class = "td0_1"></td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="2">
                <div class="rowPage">

                    <!-- 分页条 -->
                    <div>
                        <nav aria-label="Page">
                            <ul class="pagination">
                                <li><a href="${pageContext.request.contextPath}/admin/lookP?pid=${pageInfo.list[0].pid}&pn=1">首页</a></li>

                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/lookP?pid=${pageInfo.list[0].pid}&pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>

                                <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                    <c:if test="${page_Num == pageInfo.pageNum }">
                                        <li class="active"><a href="${pageContext.request.contextPath}/admin/lookP?pid=${pageInfo.list[0].pid}&pn=${ page_Num}">${ page_Num}</a></li>
                                    </c:if>
                                    <c:if test="${page_Num != pageInfo.pageNum }">
                                        <li><a href="${pageContext.request.contextPath}/admin/lookP?pid=${pageInfo.list[0].pid}&pn=${ page_Num}">${ page_Num}</a></li>
                                    </c:if>
                                </c:forEach>

                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/lookP?pid=${pageInfo.list[0].pid}&pn=${pageInfo.pageNum+1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>

                                <li><a href="${pageContext.request.contextPath}/admin/lookP?pid=${pageInfo.list[0].pid}&pn=${pageInfo.pages}">末页</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </td>
        </tr>

        <tr>
            <td colspan = "2" id = "reply">
                <div>
                    <br/>
                    <div>回复该贴：</div><br/>
                    <%--回复帖子--%>
                    <form action = "${pageContext.request.contextPath}/post/addReply" method = "post">
                        <div class="form-group">
                            <textarea class="form-control" rows="5" name = "content" cols = "5" maxlength = "300" required placeholder="请输入回复的内容(字数不超过300字)"></textarea>
                            <input type = "hidden" name = "pid" value = "${postWithAllFloor.pid}" />
                        </div>
                        <button type="submit" class="btn btn-danger">提交回复</button>

                    </form>

                </div>
            </td>
        </tr>
    </table>
</div>
<div class="modal fade" id="editContentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">请编辑内容：</h4>
            </div>
            <form action="${pageContext.request.contextPath}/post/editContent" method="post">
                <div class="modal-body"><textarea name="content" id = "content_textarea"></textarea></div>
                <input hidden="hidden" type="text" id="pid" name="pid" value="">
                <input hidden="hidden" type="text" id="fid" name="fid" value="">
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <input type="submit" class="btn btn-primary" value="保存更改">
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<jsp:include page="../../bottom.jsp"></jsp:include>
</body>
</html>
