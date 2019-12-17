<%--
  Created by IntelliJ IDEA.
  User: luoChunHui
  Date: 2019/12/9
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
<html>
<head>
    <title>Title</title>

    <script>
        $(function(){
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
        );

    </script>

</head>
<body>


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

</body>
</html>
