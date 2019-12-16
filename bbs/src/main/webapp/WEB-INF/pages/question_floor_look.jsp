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
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
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
        </script>
        <style>
            #div_img_ask {
                height: 50px;
                width: 1000px;
                margin: auto;
            }

            #img_ask {
                width: 76px;
                height: 32px;
                margin: 3px;
            }

            #div_img_ask hr {
                border: 1px solid #CDCDCD;
            }

            #out {
                width: 1000px;
                margin: auto;
            }

            .photo {
                width: 130px;
                height: 130px;
                border: 5px solid white;
            }

            #out .one {
                border: 1px solid #C2D5E3;
            }

            #out .one #title {
                font-family: 黑体;
                font-size: 20px;
                height: 30px;
                padding: 6px;
            }

            #out .one .left {
                width: 165px;
                background-color: #E5EDF2;
            }

            #out .floor {
                border: 1px solid #C2D5E3;
            }

            #out .floor .left {
                float: left;
                width: 163px;
                height: 224px;
                background-color: #E5EDF2;
                padding: 17px;
                border: 1px solid #C2D5E3;
            }

            #out .floor .left .rank {
                text-align: center;
                font-size: 18px;
                color: #2e6da4;
            }

            #out .floor .right {
                float: right;
                text-align: left;
                border: 1px solid #C2D5E3;
                width: 834px;
                height: 224px;
                padding: 10px;
            }

            #out .floor .left hr, #out .floor .right hr {
                border: 1px dashed #C2D5E3;
                margin: 5px;
                clear: both;
            }

            #out .floor .right img {
                width: 15px;
                height: 15px;
            }

            #out .floor hr {
                border: 2px solid #C2D5E3;
                position: relative;
            }


        </style>
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
                            <c:if test="${USER_SESSION.uid == question.uid && question.isResolved == 0}">
                                <%--如果当前用户就是提问者--%>
                                <%--参数分别为问题id，被采纳者的id，悬赏积分--%>
                                <input type="button" value="采纳此楼"
                                       onclick="adopt(${question.qid}, ${floor.uid}, ${floor.fid}, ${question.credit});"/>
                            </c:if>

                            <c:if test="${USER_SESSION.uid == floor.uid}">
                                <%--如果当前用户就是回复者--%>
                                <%--参数分别为问题id，被采纳者的id，悬赏积分--%>
                                <input type="button" value="删除自己本楼的回复"
                                       onclick="delR(${question.qid}, ${floor.fid});"/>
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

                <%--&lt;%&ndash;1楼是提问者的提问信息&ndash;%&gt;--%>
                <%--<c:if test="${floor.fid == 1}">--%>
                <%--<p>--%>
                <%--提问者头像：--%>
                <%--</p>--%>
                <%--<p>--%>
                <%--提问者昵称：${floor.nickname}--%>
                <%--</p>--%>
                <%--<p>--%>
                <%--提问者等级：${floor.rank}--%>
                <%--</p>--%>
                <%--<p>--%>
                <%--<c:if test="${question.isResolved == 1}">--%>
                <%--<font color="red">(已解决)</font>--%>
                <%--</c:if>--%>
                <%--标题：${question.title}--%>
                <%--</p>--%>
                <%--<p>--%>
                <%--悬赏：${question.credit}积分--%>
                <%--</p>--%>
                <%--<p>--%>
                <%--内容：${question.content}--%>
                <%--</p>--%>
                <%--<p>--%>
                <%--提问时间：<fmt:formatDate value="${question.askTime}" pattern="yyyy-MM-dd HH:mm"/>--%>
                <%--</p>--%>
                <%--</c:if>--%>
                <%--&lt;%&ndash;回复者的信息&ndash;%&gt;--%>
                <%--<c:if test="${floor.fid != 1}">--%>
                <%--<p>--%>
                <%--回复者头像：--%>
                <%--</p>--%>
                <%--<p>--%>
                <%--回复者昵称：${floor.nickname}--%>
                <%--</p>--%>
                <%--<p>--%>
                <%--回复者等级：${floor.rank}--%>
                <%--</p>--%>
                <%--<p>--%>
                <%--回复内容：${floor.content}--%>
                <%--</p>--%>
                <%--<p>--%>
                <%--回复时间：<fmt:formatDate value="${floor.replyTime}" pattern="yyyy-MM-dd HH:mm"/>--%>
                <%--</p>--%>
                <%--<c:if test="${floor.isAccept == 1}">--%>
                <%--<font color="red">楼主已采纳此楼</font>--%>
                <%--</c:if>--%>
                <c:if test="${USER_SESSION.uid == question.uid && question.isResolved == 0}">
                    <%--如果当前用户就是提问者--%>
                    <p>
                            <%--参数分别为问题id，被采纳者的id，悬赏积分--%>
                        <input type="button" value="采纳此楼"
                               onclick="adopt(${question.qid}, ${floor.uid}, ${floor.fid}, ${question.credit});"/>
                    </p>
                </c:if>

                <c:if test="${USER_SESSION.uid == floor.uid}">
                    <%--如果当前用户就是回复者--%>
                    <p>
                            <%--参数分别为问题id，被采纳者的id，悬赏积分--%>
                        <input type="button" value="删除自己本楼的回复"
                               onclick="delR(${question.qid}, ${floor.fid});"/>
                    </p>
                </c:if>
                <%--</c:if>--%>
                <hr/>
            </c:forEach>
            <br/>
            <form action="${pageContext.request.contextPath}/question/answer?qid=${question.qid}&currentFloor=${question.currentFloor}"
                  method="post">
                <div class="form-group">
                    <label for="content">回复楼主的问题:</label>
                    <textarea class="form-control" name="content" id="content" rows="5"
                              placeholder="详细回复问题，以便增大被采纳的几率" required="required"></textarea>
                </div>
                <button type="submit" class="btn btn-default">提交</button>
            </form>
        </div>
    </body>
</html>
