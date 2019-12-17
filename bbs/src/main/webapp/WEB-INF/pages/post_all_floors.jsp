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
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


    <style>

        a:link, hover{
            text-decoration: none;
        }


        #floors{
            width: 650px;
            margin: auto;
            border: 1px blue solid;
        }

        #userInfo{
            width: 150px;

        }
        #floorContent{
            width: 500px;
        }

        #reply{
            width: 400px;
        }

        textarea{
            width: 530px;
            height: 500px;
        }


    </style>
    <script>
        function deleteReply(fid, pid){
            if(confirm("您确定要删除该层回复吗？")){
                location.href = "${pageContext.request.contextPath}/post/deleteReply?pid=" + pid + "&fid=" + fid;
            }
        }

        $("#editContentModal").modal("hide");
        function editContent(pid,fid) {
            $("#pid").val(pid);
            $("#fid").val(fid);
        }
    </script>

</head>
<body>
    <div>
        <table border = "1"  style = "border-collapse: collapse;" id = "floors">
            <caption>${postWithAllFloor.title}</caption>
            <c:forEach items = "${postWithAllFloor.floors}" var = "floor">
                <tr>
                    <td id = "userInfo">
                        <div>头像</div>
                            <div>${floor.nickname}</div>
                        <div>exp：${floor.exp}</div>
                        <div>等级：${floor.rank}</div>

                    </td>
                    <td id = "floorContent">
                        <div>${floor.content}</div>
                        <div>&nbsp;</div>
                        <div>&nbsp;</div>
                        <%--<fmt:formatDate value="${floor.replyTime}" pattern="yyyy-MM-dd HH:mm"/>--%>
                        <div id = "contentBottom"><span>${floor.    fid}# &nbsp;&nbsp;</span>
                            <span><fmt:formatDate value="${floor.replyTime}" pattern = "yyy-MM-dd HH:mm:ss"/></span> &nbsp;&nbsp;

                        <%--如果是true,则添加一个删除按钮，传入fid, pid,删除该楼层--%>
                            <c:if test = "${floor.fid != 1}">
                                <span><a href = "javascript:deleteReply('${floor.fid}', '${floor.pid}')" >删除</a></span>
                            </c:if>
                            <c:if test = "${USER_SESSION.uid == floor.uid or USER_SESSION.uid == 1}">
                                <span><button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#editContentModal" onclick="editContent('${floor.pid}','${floor.fid}')">修改内容</button></span>
                            </c:if>
                        </div>
                    </td>

                </tr>
            </c:forEach>

           <tr>
               <td colspan = "2" id = "reply">
                   <div>
                       <br/>
                       <div>回复该贴：</div><br/>
                       <%--回复帖子--%>
                       <form action = "${pageContext.request.contextPath}/post/addReply" method = "post">
                           <div class="form-group">
                               <textarea class="form-control" rows="5" name = "content" cols = "5" placeholder="请输入回复的内容"></textarea>
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
                    <div class="modal-body"><textarea name="content"></textarea></div>
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
</body>
</html>
