<%--
  Created by IntelliJ IDEA.
  User: zengfeng
  Date: 2019/12/8
  Time: 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
        <title>提问</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <style>
            #div_ask{
                margin-left: 457px;
                margin-top: 40px;
            }

            #table_ask .td1{
                text-align: center;
            }

            #table_ask{
                width: 600px;
            }

            #table_ask td{
                padding: 10px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../../top.jsp"></jsp:include>
        <div id="div_ask">
            <form action="${pageContext.request.contextPath}/question/add" method="post">
                <table id="table_ask">
                    <tr>
                        <td class="td1"><label for="title">提问</label></td>
                        <td class="td2">
                            <input type="text" class="form-control" name="title" value="${question.title}" id="title"
                                   size="25" placeholder="一句话描述你的问题(50字以内)" required>
                        </td>
                    </tr>
                    <tr>
                        <td class="td1"><label for="content">内容</label></td>
                        <td class="td2">
                        <textarea class="form-control" name="content" id="content" rows="5" cols="8"
                                  placeholder="详细说明问题，以便更好的获得回答(300字以内)">${question.content}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="td1"><label for="credit">悬赏</label></td>
                        <td class="td2">
                            <input type="text" class="form-control" name="credit" value="${question.credit}" id="credit"
                                   placeholder="悬赏积分" required>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <button type="submit" style="background-color: #1b6d85; color: white; width: 80px">提交
                            </button>
                        </td>
                    </tr>
                </table>

                <br/>
                <font color="red">
                    ${msg}
                </font>
            </form>
        </div>
    </body>
</html>
