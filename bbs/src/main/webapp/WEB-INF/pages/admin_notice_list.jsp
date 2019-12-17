<%--
  Created by IntelliJ IDEA.
  User: 敖俊
  Date: 2019/12/14
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<html>
<head>
    <title>管理员公告</title>
    <style>

        #table1{
            width: 800px;
            margin: auto;

        }

        #table1 .title{
            width: 850px;
        }
        #table1 .time{
            width: 150px;
            font-weight: 100;
            font-size: 0.7em;
        }
        #table1 .content{
            width: 1000px;
        }
        #release_notice{
            margin: 0 auto;
        }
        #notice_title{
            width: 500px;
            height: 50px;
        }
        #notice_content{
            width: 500px;
            height: 250px;
        }
        #release_notice #button_td{
            text-align: center;
        }
        #release_notice td{
            text-align: left;
            width: 100px;
        }
        #release_notice .release_notice_title{
            font-weight: bold;
        }
        #table1 .th_tr{
            height: 30px;
            background-color: #F0F0EE;
        }
    </style>
</head>
<body>

<script>
    function deleteNotice(nid) {
        if(confirm("您确定要将这个公告删除吗？"))
            location.href = "${pageContext.request.contextPath}/admin/deleteNotice?nid=" + nid;
    }
</script>
<div>
    <table id="release_notice">
        <form action = "${pageContext.request.contextPath}/admin/addNotice" method = "post">
            <tr>
                <td class="release_notice_title"><div>公告标题：</div></td>
                <td><input class="form-control" id="notice_title" name="title" type="text" placeholder="请输入公告标题"></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td class="release_notice_title"><div>公告内容：</div></td>
                <td><textarea class="form-control" id="notice_content" name = "content" placeholder="请输入公告内容"></textarea></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td colspan="2" id="button_td">
                    <input class="btn btn-primary" type="submit" value="发布公告">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="btn btn-warning" type="reset" value="清空">
                </td>
            </tr>
        </form>
    </table>
    <table id = "table1" class="table table-hover">
        <caption>所有公告如下</caption>
        <c:forEach items = "${noticesList}" var = "notice">
            <tr class="th_tr">
                <th class="title"><div>${notice.title}</div></th>
                <th class="time"><div>${notice.noticeTime}</div></th>
            </tr>
            <tr class="td_tr">
                <td class="content"><div>${notice.content}</div></td>
                <td class="deleteNotice"><button class="btn btn-danger" onclick="deleteNotice(${notice.nid})">删除公告</button> </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
