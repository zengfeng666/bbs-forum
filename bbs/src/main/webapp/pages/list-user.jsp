<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <h3>User表和Account表的一对多关系：</h3>
        <c:forEach items="${users}" var="user">
            <h5>userId:</h5>     ${user.userId} <br/>
            <h5>userName:</h5>     ${user.userName} <br/>
            <h5>userBirthday:</h5>    ${user.userBirthday} <br/>
            <h5>userAddress:</h5>   ${user.userAddress} <br/>
            <h5>user对应的多个account:</h5>   ${user.accounts} <br/>
            <hr />
        </c:forEach>
    </body>
</html>
