<%--
  Created by IntelliJ IDEA.
   User: luoChunHui
  Date: 2019/12/9
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发帖</title>

    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>
        $(function(){
            /*获取到种类，将列表默认设置为这个种类*/
            var k = "${kind}";
            $("#kind option").eq(k).prop("selected", true);
        });
    </script>
    <style>
        table{
            margin: auto;
        }

        #kind{
            width: 100px;
        }
    </style>
</head>
<body>
   <div>
       <form action = "${pageContext.request.contextPath}/post/addPost" method = "post">
           <table>
               <tr>
                   <td> 标题：</td>
                   <td>
                      <input type = "text" name = "title" class="form-control" placeholder="请输入标题"/>
                   </td>
               </tr>
               <tr>
                   <td> 种类：</td>
                   <td>
                       <select name = "kind" id = "kind" class="form-control">
                           <option value = "0">数码科技</option>
                           <option value = "1">音乐分享</option>
                           <option value = "2">体育运动</option>
                           <option value = "3">校园生活</option>
                           <option value = "4">聊天交友</option>
                           <option value = "5">好书推荐</option>
                       </select><br/>
                   </td>
               </tr>
               <tr>
                   <td>内容：</td>
                   <td>

                       <textarea name = "content" class="form-control" placeholder="请输入内容" rows = "10" cols = "50" ></textarea><br/>
                   </td>
               </tr>
               <tr>
                   <td cols = "2">
                       <input type = "submit" class="btn btn-default" value = "确定"/>
                   </td>
               </tr>
           </table>
       </form>
   </div>
</body>
</html>
