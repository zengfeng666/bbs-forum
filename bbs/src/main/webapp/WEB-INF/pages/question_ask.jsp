<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            #div_ask {
                width: 1000px;
                margin: auto;
            }

            #table_ask .td1 {
                text-align: right;
            }

            #table_ask {
                width: 600px;
                margin: auto;
                margin-top: 30px;
            }

            #table_ask td {
                padding: 10px;
                width: 100px;
            }

            #table_ask td #title1, #table_ask td textarea {
                width: 400px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                padding: 5px;
                border-radius: 3px;
                font-size: 14px;
                font-family: "Helvetica Neue", "Luxi Sans", "DejaVu Sans", Tahoma, "Hiragino Sans GB", "Microsoft Yahei", sans-serif;
            }

            #table_ask .td2{
                width: 445px;
            }


        </style>
        <script>
            function checkTitle() {
                var title = document.getElementById("title1").value;
                if(title.length > 50){
                    document.getElementById("msg_title").innerHTML = "标题过长";
                    return false;
                }
                document.getElementById("msg_title").innerHTML = "";
                return true;
            }

            function checkContent() {
                var content = document.getElementById("content1").value;
                if(content.length > 300){
                    document.getElementById("msg_content").innerHTML = "内容过长";
                    return false;
                }
                document.getElementById("msg_content").innerHTML = "";
                return true;
            }

            function check() {
                if (checkTitle() == false){
                    alert("标题不能超过50个字符！");
                    return false;
                }
                if(checkContent() == false){
                    alert("内容不能超过300个字符！");
                    return false;
                }
                return true;

            }

        </script>
    </head>
    <body>
    <c:if test="${USER_SESSION.uid == 1}">
        <jsp:include page="../../admin_top.jsp"></jsp:include>
    </c:if>
    <c:if test="${USER_SESSION.uid!=1}">
        <jsp:include page="../../top.jsp"></jsp:include>
    </c:if>
        <div id="div_ask">
            <form onsubmit="return check();" action="${pageContext.request.contextPath}/question/add" method="post">
                <table id="table_ask">
                    <tr>
                        <td class="td1"><label for="title1">提问</label></td>
                        <td class="td2">
                            <textarea name="title" id="title1" rows="3" onblur="checkTitle();"
                                      placeholder="一句话描述你的问题(50字以内)" required>${question.title}</textarea>
                            <font color="red" id="msg_title"></font>
                        </td>
                    </tr>
                    <tr>
                        <td class="td1"><label for="content1">内容</label></td>
                        <td class="td2">
                        <textarea name="content" id="content1" rows="6" onblur="checkContent();"
                                  placeholder="详细说明问题，以便更好的获得回答(300字以内)" required>${question.content}</textarea>
                            <font color="red" id="msg_content"></font>
                        </td>
                    </tr>
                    <tr>
                        <td class="td1"><label>悬赏</label></td>
                        <td class="td2">
                            <input type="radio" name="credit" value="10"/> 10 &nbsp;
                            <input type="radio" name="credit" value="20"/> 20 &nbsp;
                            <input type="radio" name="credit" value="50"/> 50 &nbsp;
                            <input type="radio" name="credit" value="100"/> 100 &nbsp;
                            <input type="radio" name="credit" value="200"/> 200 (积分)
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <button type="submit" style="background-color: #1b6d85; color: white; width: 80px">提交
                            </button>
                        </td>
                    </tr>
                </table>

            </form>
        </div>
        <jsp:include page="../../bottom.jsp"></jsp:include>
    </body>
</html>
