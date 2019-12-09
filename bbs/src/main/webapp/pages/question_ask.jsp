<%--
  Created by IntelliJ IDEA.
  User: zengfeng
  Date: 2019/12/8
  Time: 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
        <title>发布需求</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/question/add" method="post">
            <div class="form-group">
                <label for="title">提问</label>
                <input type="text" class="form-control" name="title" id="title" placeholder="一句话描述你的问题">
            </div>
            <div class="form-group">
                <label for="content">内容</label>
                <textarea class="form-control" name="content" id="content" rows="3"
                          placeholder="详细说明问题，以便更好的获得回答"></textarea>
            </div>
            <div class="form-group">
                <label for="credit">悬赏积分</label>
                <input type="text" class="form-control" name="credit" id="credit" placeholder="悬赏积分">
            </div>
            <button type="submit" class="btn btn-default">提交</button>
        </form>
    </body>
</html>
