<%--
  Created by IntelliJ IDEA.
  User: WangYuYang
  Date: 2019/12/15
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>

<html>
<head>
    <title>个人主页</title>
    <style>
        /*td {
            width: 200px;
            text-align: center;
            height: 50px;
        }*/

        /*  table{
              border: 1px solid blue;
          }*/

        #table1 {
            width: 800px;
        }

        #table2 {
            width: 650px;
        }

        #table3 {
            width: 650px;
        }

        #photo {
            width: 100px;
            height: 100px;
        }

        #top {
            width: 650px;
        }

        #info {
            float: left;
            width: 100px;

        }

        #modal {
            float: left;
            text-align: right;
            width: 440px;
        }

        #table3 td {
            height: 35px;
            line-height: 35px;
        }

        .table3_td2 {
            width: 550px;
        }

        .table3_td1 {
            width: 100px;
        }

        #table4 tr {
            height: 40px;
        }

        input[type = "text"] {
            width: 150px;
            height: 35px;
            /*border-color: gray;*/
        }

        .table4_td2 {
            width: 400px;
        }

        #fileDiv {
            background-color: darkgrey;
            width: 400px;
            heihgt: 200px;
            line-height: 200px;
            text-align: center;
        }

    </style>


</head>
<body>
<table border="1px" cellspacing="0" cellpadding="0" align="center" id="table1">
    <tr>
        <td>
            <img src="${pageContext.request.contextPath}/images/${USER_SESSION.photo}" id="photo">
            <div></div>
            <div id="modal2"><a href="#myModal2" class="btn" data-toggle="modal">修改头像</a></div>

            <!-- 上传头像的Modal -->
            <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel2">上传头像</h4>
                        </div>
                        <div class="modal-body">
                            <form action="${pageContext.request.contextPath}/user/photoUpload">

                            </form>
                            <div id="fileDiv">
                                <img src="${pageContext.request.contextPath}/images/fileUpload.png"/>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
        </td>
        <td>
            <table id="table2">
                <tr>
                    <td id="top">
                        <div>等级：${USER_SESSION.rank} &nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;经验：${USER_SESSION.exp}</div>
                        <div>积分：${USER_SESSION.credit}</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table id="table3">

                            <hr>
                            <tr>
                                <td class="table3_td1">昵称：</td>
                                <td class="table3_td2">
                                    <div id="info">${USER_SESSION.nickname}</div>
                                    <div id="edit">

                                        <div id="modal"><a href="#myModal" class="btn" data-toggle="modal">修改资料</a>
                                        </div>
                                        <%-- <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                                             --%>

                                        <!-- 修改信息的Modal -->
                                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                                             aria-labelledby="myModalLabel">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close"><span
                                                                aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title" id="myModalLabel">修改资料</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="${pageContext.request.contextPath}/user/editInfo">
                                                            <table id="table4" border="0">
                                                                <tr>
                                                                    <td>昵称：</td>
                                                                    <td class="table4_td2"><input type="text"
                                                                                                  name="nickname"
                                                                                                  value="${USER_SESSION.nickname}"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>邮箱:</td>
                                                                    <td class="table4_td2"><input type="text"
                                                                                                  name="email"
                                                                                                  value="${USER_SESSION.email}"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>电话:</td>

                                                                    <td class="table4_td2"><input type="text" name="tel"
                                                                                                  value="${USER_SESSION.tel}"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>性别:</td>
                                                                    <td class="table4_td2">
                                                                        <select name="sex">
                                                                            <option value="male">男</option>
                                                                            <option value="female">女</option>
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>职业:</td>
                                                                    <td class="table4_td2"><input type="text" name="job"
                                                                                                  value="${USER_SESSION.job}"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>工作单位：</td>
                                                                    <td class="table4_td2"><input type="text"
                                                                                                  name="company"
                                                                                                  value="${USER_SESSION.company}"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>简介:</td>
                                                                    <td class="table4_td2">
                                                                        <textarea name="description" cols="45"
                                                                                  rows="8">${USER_SESSION.description}</textarea>
                                                                    </td>
                                                                </tr>
                                                            </table>

                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default"
                                                                        data-dismiss="modal">取消
                                                                </button>

                                                                <input class="btn btn-danger" type="submit" value="确定">
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="table3_td1">邮箱:</td>
                                <td class="table3_td2">${USER_SESSION.email}</td>
                            </tr>
                            <tr>
                                <td class="table3_td1">电话:</td>
                                <td class="table3_td2">${USER_SESSION.tel}</td>
                            </tr>
                            <tr>
                                <td class="table3_td1">性别:</td>
                                <td class="table3_td2">${USER_SESSION.sex}</td>
                            </tr>
                            <tr>
                                <td class="table3_td1">职业:</td>
                                <td class="table3_td2">${USER_SESSION.job}</td>
                            </tr>
                            <tr>
                                <td class="table3_td1">工作单位：</td>
                                <td class="table3_td2">${USER_SESSION.company}</td>
                            </tr>
                            <tr>
                                <td class="table3_td1">简介:</td>
                                <td class="table3_td2">${USER_SESSION.description}</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
