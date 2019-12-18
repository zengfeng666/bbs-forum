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
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <link href="${pageContext.request.contextPath}/css/question.css" rel="stylesheet">
        <script type="application/javascript">
            // 删除问题
            function delQ(qid) {
                if (confirm("你确定要删除这个问题吗？")) {
                    location.href = "${pageContext.request.contextPath}/user/delQ?qid=" + qid;
                }
            }
        </script>
        <style>
            #div_pagination {
                margin: auto;
                width: 1000px;
            }
        </style>
    </head>
    <body>
    <c:if test="${USER_SESSION.uid == 1}">
        <jsp:include page="../../admin_top.jsp"></jsp:include>
    </c:if>
    <c:if test="${USER_SESSION.uid!=1}">
        <jsp:include page="../../top.jsp"></jsp:include>
    </c:if>
        <div id="div_img_ask">
            <a href="${pageContext.request.contextPath}/page/question_ask">
                <img src="${pageContext.request.contextPath}/images/question_ask.jpg" id="img_ask"/>
            </a>
            <hr id="ask_hr"/>
        </div>

        <!-- 分页条 -->
        <div id="div_pagination">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="${pageContext.request.contextPath}/user/askQ?pn=${pageInfo.pageNum-1}"
                           aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum }">
                            <li class="active"><a href="#">${ page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum }">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/askQ?pn=${ page_Num}">${ page_Num}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <li>
                        <a href="${pageContext.request.contextPath}/user/askQ?pn=${pageInfo.pageNum+1}"
                           aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div id="table-div">
            <table class="table table-hover">
                <c:forEach items="${pageInfo.list}" var="question" varStatus="vs">
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
                            <a href="javascript:delQ(${question.qid});">删除</a>
                            &nbsp;&nbsp;&nbsp;
                            <fmt:formatDate value="${question.askTime}" pattern="yyyy-MM-dd HH:mm"/>
                            &nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <!-- 分页条 -->
        <div id="div_pagination">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="${pageContext.request.contextPath}/user/askQ?pn=${pageInfo.pageNum-1}"
                           aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum }">
                            <li class="active"><a href="#">${ page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum }">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/askQ?pn=${ page_Num}">${ page_Num}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <li>
                        <a href="${pageContext.request.contextPath}/user/askQ?pn=${pageInfo.pageNum+1}"
                           aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <jsp:include page="../../bottom.jsp"></jsp:include>
    </body>
</html>
