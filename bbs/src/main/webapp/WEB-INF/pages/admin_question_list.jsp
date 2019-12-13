<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>所有提问</title>
    <style type="text/css">
        td, th {
            text-align: center;
        }
        a{
            text-decoration: none;
        }
    </style>
</head>
<body>
<script>
    function delQ(qid) {
        if (confirm("你确定要删除这个问题吗？")) {
            location.href = "${pageContext.request.contextPath}/user/delQ?qid=" + qid;
        }
    }
</script>
<table align="center" border="1px">
    <caption>所有提问</caption>
    <tr>
        <th>序号</th>
        <th>标题</th>
        <th>悬赏</th>
        <th>时间</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${questions}" var="question" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td style="width: 500px">
                <c:if test="${question.isResolved == 1}">
                    <font color="red">(已解决)</font>
                </c:if>
                <a href="${pageContext.request.contextPath}/question/look?qid=${question.qid}">${question.title}</a>
            </td>
            <td>${question.credit}积分</td>
                <%--<td>${question.askTime}</td>--%>
            <td><fmt:formatDate value="${question.askTime}" pattern="yyyy-MM-dd HH:mm"/></td>
            <td><button onclick="delQ(${question.qid})">删除</button></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
