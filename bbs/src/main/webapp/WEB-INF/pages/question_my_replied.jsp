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
        <title>我的回复</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <link href="${pageContext.request.contextPath}/css/question.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="../../top.jsp"></jsp:include>
        <div id="div_img_ask">
            <a href="${pageContext.request.contextPath}/page/question_ask">
                <img src="${pageContext.request.contextPath}/images/question_ask.jpg" id="img_ask"/>
            </a>
            <hr id="ask_hr"/>
        </div>
        <div id="table-div">
            <table class="table table-hover">
                <c:forEach items="${questionsReplied}" var="question" varStatus="vs">
                    <tr>
                        <td class="td1">
                            <a href="${pageContext.request.contextPath}/question/look?qid=${question.qid}">
                                <img src="${pageContext.request.contextPath}/images/question_logo.png"
                                     style="width: 20px;height: 20px;"/> ${question.title}
                            </a>
                            <font color="red"> - [悬赏 ${question.credit} 积分] </font>
                            <c:if test="${question.isResolved == 1}">
                                (已解决)
                            </c:if>
                        </td>
                        <td class="td2">
                            <fmt:formatDate value="${question.askTime}" pattern="yyyy-MM-dd HH:mm"/>
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <jsp:include page="../../bottom.jsp"></jsp:include>
    </body>
</html>
