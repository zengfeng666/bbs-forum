<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <h3>Account表和User表的一对一关系：</h3>
        <c:forEach items="${accounts}" var="account">

            <h5>id:</h5>     ${account.id} <br/>
            <h5>uid:</h5>     ${account.uid} <br/>
            <h5>money:</h5>    ${account.money} <br/>
            <h5>对应的user:</h5>   ${account.user} <br/>
            <hr />
        </c:forEach>
    </body>
</html>
