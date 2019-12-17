<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
    <head>
        <title>所有提问</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <style type="text/css">
            td {
                font-size: 14px;
                border-width: 0px;
            }

            a {
                text-decoration: none;
            }

            #table-div {
                border: 1px solid #CDCDCD;
                margin: auto;
                width: 1000px;
            }

            .td1 {
                width: 780px;
                text-align: left;
            }

            .td2 {
                text-align: right;
            }

            #img_ask {
                width: 76px;
                height: 32px;
                margin: 5px;
                margin-left: 259px;
            }
        </style>
    </head>
    <body>
        <script>
            function delQ(qid) {
                if (confirm("你确定要删除这个问题吗？")) {
                    location.href = "${pageContext.request.contextPath}/admin/delQ?qid=" + qid;
                }
            }
        </script>
        <c:if test="${USER_SESSION.uid == 1}">
            <jsp:include page="../../admin_top.jsp"></jsp:include>
        </c:if>
        <c:if test="${USER_SESSION.uid!=1}">
            <jsp:include page="../../top.jsp"></jsp:include>
        </c:if>
    <a href="${pageContext.request.contextPath}/page/question_ask">
        <img src="${pageContext.request.contextPath}/images/question_ask.jpg" id="img_ask"/>
    </a>
    <div id="table-div">
        <table class="table table-hover">
            <c:forEach items="${list}" var="question" varStatus="vs">
                <tr>
                    <td class="td1">
                        <a href="${pageContext.request.contextPath}/admin/lookQ?qid=${question.qid}">
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
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/delQ?qid=${question.qid}">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
        <jsp:include page="../../bottom.jsp" ></jsp:include>
    </body>
    </html>
