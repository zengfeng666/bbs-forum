<%--
  Created by IntelliJ IDEA.
  User: zengfeng
  Date: 2019/12/9
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <title>我的提问</title>
        <style type="text/css">
            td, th {
                width: 100px;
                text-align: center;
            }

            a {
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <table align="center" border="1px">
            <caption>我的提问</caption>
            <tr>
                <th>序号</th>
                <th>问题</th>
                <th>悬赏</th>
                <th>时间</th>
            </tr>
            <c:forEach items="${questionsAsked}" var="question" varStatus="vs">
                <tr>
                    <td>${vs.count}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/question/look?qid=${question.qid}">${question.title}</a>
                    </td>
                    <td>${question.credit}积分</td>
                        <%--<td>${question.askTime}</td>--%>
                    <td><fmt:formatDate value="${question.askTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
