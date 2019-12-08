<%--
  Created by IntelliJ IDEA.
  User: 23526
  Date: 2019/12/8
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
    <head>
        <title>所有需求</title>
    </head>
    <body>
        <table>
            <c:forEach items="${questions}" var="question" varStatus="vs">
                <tr>
                    <td>${vs.count}</td>
                    <td>${question.title}</td>
                    <td>${question.credit}</td>
                        <%--<td>${question.postTime}</td>--%>
                    <td><fmt:formatDate value="${question.postTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
