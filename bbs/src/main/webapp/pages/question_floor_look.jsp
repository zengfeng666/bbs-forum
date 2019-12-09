<%--
  Created by IntelliJ IDEA.
  User: zengffeng
  Date: 2019/12/8
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <title>查看问题</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </head>
    <body>
        <c:forEach items="${question.floors}" var="floor" varStatus="vs">
            <p>
                    ${floor.fid}楼
            </p>
            <%--1楼是提问者的提问信息--%>
            <c:if test="${floor.fid == 1}">
                <p>
                    提问者头像：
                </p>
                <p>
                    提问者昵称：${floor.nickname}
                </p>
                <p>
                    提问者等级：${floor.rank}
                </p>
                <p>
                    标题：${question.title}
                </p>
                <p>
                    悬赏：${question.credit}积分
                </p>
                <p>
                    内容：${question.content}
                </p>
                <p>
                    提问时间：<fmt:formatDate value="${question.askTime}" pattern="yyyy-MM-dd HH:mm"/>
                </p>
            </c:if>
            <%--回复者的信息--%>
            <c:if test="${floor.fid != 1}">
                <p>
                    回复者头像：
                </p>
                <p>
                    回复者昵称：${floor.nickname}
                </p>
                <p>
                    回复者等级：${floor.rank}
                </p>
                <p>
                    回复内容：${floor.content}
                </p>
                <p>
                    回复时间：<fmt:formatDate value="${floor.replyTime}" pattern="yyyy-MM-dd HH:mm"/>
                </p>
            </c:if>
            <hr/>
        </c:forEach>
        <form action="${pageContext.request.contextPath}/question/answer?qid=${question.qid}&currentFloor=${question.currentFloor}" method="post">
            <div class="form-group">
                <label for="content">回复楼主的问题:</label>
                <textarea class="form-control" name="content" id="content" rows="5"
                          placeholder="详细回复问题，以便增大被采纳的几率" required="required"></textarea>
            </div>
            <button type="submit" class="btn btn-default">提交</button>
        </form>
    </body>
</html>
