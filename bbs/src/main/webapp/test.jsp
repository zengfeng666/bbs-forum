<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <a href="account/findAll">测试</a>
        <br />
        <form action="${pageContext.request.contextPath}/account/save" method="post">
            姓名：<input type="text" name="name" /><br />
            金额：<input type="text" name="money" /><br />
            <input type="submit" value="submit"/>
        </form>
    </body>
</html>
