<%--
  Created by IntelliJ IDEA.
  User: 敖俊
  Date: 2019/12/16
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
<html>
<head>
    <title>成功</title>
    <script>
        $(function(){
                $("#myModal").modal('show')
                setTimeout(function(){
                    $('#myModal').modal('hide');
                    // 等2s才能跳转
                    setTimeout("location.href = \"${pageContext.request.contextPath}/post/showAllFloors?pid=\"+${pid}",0);


                },2000);
            }
        );

    </script>

</head>
<body>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" style="width: 300px;margin: 100px auto">
        <div class="modal-content" >
            <div class="modal-header">
                修改成功！
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>
