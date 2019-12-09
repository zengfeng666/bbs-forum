<%--
  Created by IntelliJ IDEA.
  User: 324014978
  Date: 2019/12/9
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发帖</title>

    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <script>
        $(function(){
            /*获取到种类，将列表默认设置为这个种类*/
            var k = "${kind}";
            $("#kind option").eq(k).prop("selected", true);
        });
    </script>
</head>
<body>
   <div>
       <form action = "${pageContext.request.contextPath}/post/addPost">
           标题：<input type = "text" name = "title" placeholder="请输入标题"/><br/>
           种类：
           <select name = "kind" id = "kind">
               <option value = "0">二次元</option>
               <option value = "1">科技</option>
               <option value = "2">小说</option>
               <option value = "3">生活</option>
               <option value = "4">娱乐圈</option>
           </select><br/>
           内容：<textarea name = "content" placeholder="请输入内容" rows = "30" cols = "50" ></textarea><br/>
           <input type = "submit" value = "确定"/>
       </form>
   </div>
</body>
</html>
