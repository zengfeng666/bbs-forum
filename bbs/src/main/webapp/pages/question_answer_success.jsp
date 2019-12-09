<%--
  Created by IntelliJ IDEA.
  User: zengfeng
  Date: 2019/12/9
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
        <title>回答成功</title>
    </head>
    <body>
        回答成功！<a href="${pageContext.request.contextPath}/question/look?qid=${qid}">点此回到该问题</a>
    </body>
</html>
