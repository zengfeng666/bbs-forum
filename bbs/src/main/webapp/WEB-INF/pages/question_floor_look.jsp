<%--
  Created by IntelliJ IDEA.
  User: zengfeng
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
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <link href="${pageContext.request.contextPath}/css/question_floor.css" rel="stylesheet"/>
        <script type="application/javascript">
            // 参数分别为问题id，被采纳者的id，悬赏积分
            function adopt(qid, uid, fid, credit) {
                if (confirm("你确定采纳此楼吗？")) {
                    location.href = "${pageContext.request.contextPath}/question/accept?qid=" + qid
                        + "&uid=" + uid + "&fid=" + fid + "&credit=" + credit;
                }
            }

            function delR(qid, fid) {
                if (confirm("你确定删除自己的这条回复吗？")) {
                    location.href = "${pageContext.request.contextPath}/user/delR?qid=" + qid
                        + "&fid=" + fid;
                }
            }

            function checkReplyContent() {
                var replyContent = document.getElementById("reply_content").value;
                if(replyContent.length > 300){
                    alert("回复内容的长度不能超过300!");
                    return false;
                }

                return true;
            }
        </script>
    </head>
    <body>
        <jsp:include page="../../top.jsp"></jsp:include>
        <div id="div_img_ask">
            <a href="${pageContext.request.contextPath}/page/question_ask">
                <img src="${pageContext.request.contextPath}/images/question_ask.jpg" id="img_ask"/>
            </a>
            <hr/>
        </div>
        <div id="out">
            <div class="one">
                <table>
                    <tr>
                        <td class="left">
                        </td>
                        <td>
                            <h3 id="title">${question.title}
                                <font color="red"> - [悬赏 ${question.credit} 积分] </font>
                                <c:if test="${question.isResolved == 1}">
                                    (已解决)
                                </c:if>
                            </h3>
                        </td>
                    </tr>
                </table>
            </div>
            <c:forEach items="${question.floors}" var="floor" varStatus="vs">
                <div class="floor">
                    <div class="left">
                        <p>
                                ${floor.nickname}
                        </p>
                        <hr/>
                        <p>
                            <img class="photo" src="${pageContext.request.contextPath}/images/${floor.photo}"/>
                        </p>
                        <div class="rank">
                            Lv${floor.rank}
                        </div>
                    </div>
                    <div class="right">
                        <font style="float: left; margin: 4px; margin-right: 18px">
                            <img src="${pageContext.request.contextPath}/images/clock.png"/> 发表于
                            <fmt:formatDate value="${floor.replyTime}" pattern="yyyy-MM-dd HH:mm"/>
                            <font color="red">
                                <c:if test="${floor.isAccept == 1}">
                                    <font color="red">(楼主已采纳此楼)</font>
                                </c:if>
                            </font>
                                <%--当前用户是楼主--%>
                            <c:if test="${USER_SESSION.uid == question.uid}">
                                <c:if test="${floor.fid != 1}">
                                    <c:if test="${question.isResolved != 1}">
                                        <a href="javascript:adopt('${question.qid}', '${floor.uid}', '${floor.fid}', '${question.credit}');">采纳</a>
                                        &nbsp;&nbsp;&nbsp;
                                        <a href="javascript:delR('${question.qid}', '${floor.fid}');">删除该楼的回复</a>
                                    </c:if>
                                </c:if>
                            </c:if>
                                <%--当前用户不是楼主--%>
                            <c:if test="${USER_SESSION.uid != question.uid}">
                                <c:if test="${floor.fid != 1}">
                                    <c:if test="${floor.uid == USER_SESSION.uid}">
                                        <a href="javascript:delR('${question.qid}', '${floor.fid}');">删除自己该楼的回复</a>
                                    </c:if>
                                </c:if>
                            </c:if>
                        </font>

                        <font color="red" style="float: right; margin: 4px; margin-right: 18px">
                            <c:if test="${floor.fid == 1}">
                                楼主#
                            </c:if>
                            <c:if test="${floor.fid != 1}">
                                ${floor.fid}楼#
                            </c:if>
                        </font>
                        <hr/>
                        <p>
                                ${floor.content}
                        </p>
                    </div>
                    <hr/>
                </div>
            </c:forEach>
            <br/>
            <form action="${pageContext.request.contextPath}/question/answer?qid=${question.qid}&currentFloor=${question.currentFloor}"
                  method="post" onsubmit="return checkReplyContent()">
                <div class="form-group">
                    <label for="reply_content">回复楼主的问题:</label>
                    <textarea class="form-control" name="content" id="reply_content" rows="5"
                              placeholder="详细回复问题，以便增大被采纳的几率" required="required"></textarea>
                </div>
                <button type="submit" class="btn btn-default">提交</button>
            </form>
        </div>
    </body>
</html>
