<%--
  Created by IntelliJ IDEA.
  User: WangYuYang
  Date: 2019/12/15
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>

<html>
    <head>
        <title>个人主页</title>
        <style>
            .photo {
                width: 100px;
                height: 100px;
            }


            #info {
                float: left;
                width: 50%;

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


            #table4 tr {
                height: 40px;
            }

            input[type = "text"] {
                width: 150px;
                height: 35px;
            }

            .table4_td2 {
                width: 400px;
            }

            .photoDiv {
                float: left;
                width: 120px;
                height: 120px;
                padding: 10px;
            }
            header{
                height: 40%;
                width: 102%;
                margin-left: -10px;
                background: url("${pageContext.request.contextPath}/images/timg17.gif") no-repeat;
                background-size:100% 100%;
                position: relative;
                font-size: 20px;
                font-weight: bold;
                color: #0f0f0f;
                margin-bottom: 4%;
            }
            header .return{
                position: absolute;
                left: 2%;
                top: 2%;
                font-size: 20px;
                text-decoration: none;
                color: #7222d6;
            }
            header .Rank{
                position: absolute;
                right: 2%;
                top: 1%;

            }
            header .Exp{
                  position: absolute;
                  right: 2%;
                  top: 18%;
              }
            header .Credit{
                position: absolute;
                right: 2%;
                top: 36%;
            }
            header .Inckname{
                position: absolute;
                right: 10%;
                top: 47%;
                font-size: 50px;
                color: #853f8c;
            }
            header .btn{
                position: absolute;
                right: 2%;
                top: 50%;
                font-size: 22px;
                color: #7222d6;
            }
            article{
                height: 40%;
                width: 100%;
                position: relative;
                background: url("${pageContext.request.contextPath}/images/timg20.gif") no-repeat;
                background-size:100% 100%;
            }
            article .one{
                font-size: 23px;
                font-weight: bold;
                color: #3eb1d6;
                margin-left: 10%;
                height: 100px;
                line-height: 100px;
            }
            article .two{
                font-size: 20px;
                font-weight: bold;
                margin-left: 2%;
                height: 100px;
                line-height: 100px;
            }
            article .left{
                position: absolute;
                left: 0;
                top: 0;
                width: 30%;
                height: 100%;
            }
            article .center{
                position: absolute;
                left: 30%;
                top: 0;
                float: left;
                width: 30%;
                height: 100%;
            }
            article .center img{
                height: 150px;
                width: auto;
                margin-left: 25%;
                margin-top: 15%;
            }
            article .right{
                position: absolute;
                left: 60%;
                top: 0;
                float: left;
                width: 40%;
                height: 100%;
            }
            .photoDiv {
                float: left;
                width: 120px;
                height: 192px;
                padding: 10px;
            }
            input[type="radio"]{
                margin-left: 26%;
            }
            body article .center img {
                height: 119px;
                width: auto;
                margin-left: 25%;
                margin-top: 15%;
            }
        </style>
        <script>
            $(function () {

                var sex = "${USER_SESSION.sex}";
                if (sex == "male") {
                    $("#sex option[value='male']").prop("selected", true);
                } else {

                    $("#sex option[value='female']").prop("selected", true);
                }
            })
        </script>
    </head>
    <body>

    <header>
        <a href="${pageContext.request.contextPath}/index.jsp" class="return">返回首页</a>
        <div class="Rank">等级：${USER_SESSION.rank}</div>
        <div class="Exp">经验：${USER_SESSION.exp}</div>
        <div class="Credit">积分：${USER_SESSION.credit}</div>
        <div class="Inckname" id="info">${USER_SESSION.nickname}</div>
        <div id="edit">

            <div id="modal"><a href="#myModal" class="btn"
                               data-toggle="modal">修改资料</a>
            </div>
            <%-- <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                 --%>

            <!-- 修改信息的Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close"
                                    data-dismiss="modal"
                                    aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">修改资料</h4>
                        </div>
                        <div class="modal-body">
                            <form action="${pageContext.request.contextPath}/user/editInfo">
                                <table id="table4" border="0">
                                    <tr>
                                        <td>昵称：</td>
                                        <td class="table4_td2"><input
                                                type="text"
                                                name="nickname"
                                                value="${USER_SESSION.nickname}"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>邮箱:</td>
                                        <td class="table4_td2"><input
                                                type="text"
                                                name="email"
                                                value="${USER_SESSION.email}"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>电话:</td>

                                        <td class="table4_td2"><input
                                                type="text"
                                                name="tel"
                                                value="${USER_SESSION.tel}"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>性别:</td>
                                        <td class="table4_td2">
                                            <select name="sex" id="sex">
                                                <option value="male">男</option>
                                                <option value="female">女
                                                </option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>职业:</td>
                                        <td class="table4_td2"><input
                                                type="text"
                                                name="job"
                                                value="${USER_SESSION.job}"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>工作单位：</td>
                                        <td class="table4_td2"><input
                                                type="text"
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

                                <div class="modal-footer"
                                     style="text-align: center;">
                                    <button type="button"
                                            class="btn btn-default"
                                            data-dismiss="modal">取消
                                    </button>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
                                        class="btn btn-danger" type="submit"
                                        value="确定">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
    </header>
    <article>
        <div class="left">
            <div class="Email">
                <span class="one">邮箱:</span>
                <span class="two">
                    ${USER_SESSION.email}
                </span>
            </div>
            <div class="Number">
                <span class="one">电话:</span>
                <span class="two">
                    ${USER_SESSION.tel}
                </span>
            </div>
            <div class="Gender">
                <span class="one">性别:</span>
                <span class="two">
                <c:if test="${USER_SESSION.sex == 'male'}">
                    男
                </c:if>
            <c:if test="${USER_SESSION.sex == 'female'}">
                女
            </c:if>
            </span>
            </div>
        </div>


        <div class="center">
            <img src="${pageContext.request.contextPath}/images/${USER_SESSION.photo}" class="photo">
            <div></div>
            <div id="modal2"><a href="#myModal2" class="btn" data-toggle="modal" style="    margin-left: 27%;font-size: 20px;margin-top: 10px;">修改头像</a></div>

            <!-- 上传头像的Modal -->
            <div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel2">修改头像</h4>


                            <form action="${pageContext.request.contextPath}/user/photoUpload"
                                  method="post">

                                <div id="fileDiv">
                                    <div class="photoDiv">
                                        <input type="radio" name="photo" value="default_photo.png"/><img
                                            src="${pageContext.request.contextPath}/images/default_photo.png"
                                            class="photo"/>
                                    </div>
                                    <div class="photoDiv">
                                        <input type="radio" name="photo" value="1.jpg"/><img
                                            src="${pageContext.request.contextPath}/images/1.jpg"
                                            class="photo"/>
                                    </div>
                                    <div class="photoDiv">
                                        <input type="radio" name="photo" value="2.jpg"/><img
                                            src="${pageContext.request.contextPath}/images/2.jpg"
                                            class="photo"/>
                                    </div>
                                    <div class="photoDiv">
                                        <input type="radio" name="photo" value="3.jpg"/><img
                                            src="${pageContext.request.contextPath}/images/3.jpg"
                                            class="photo"/>
                                    </div>
                                    <div class="photoDiv">
                                        <input type="radio" name="photo" value="4.jpg"/><img
                                            src="${pageContext.request.contextPath}/images/4.jpg"
                                            class="photo"/>
                                    </div>
                                    <div class="photoDiv">
                                        <input type="radio" name="photo" value="5.jpg"/><img
                                            src="${pageContext.request.contextPath}/images/5.jpg"
                                            class="photo"/>
                                    </div>
                                    <div class="photoDiv">
                                        <input type="radio" name="photo" value="6.jpg"/><img
                                            src="${pageContext.request.contextPath}/images/6.jpg"
                                            class="photo"/>
                                    </div>
                                    <div class="photoDiv">
                                        <input type="radio" name="photo" value="7.jpg"/><img
                                            src="${pageContext.request.contextPath}/images/7.jpg"
                                            class="photo"/>
                                    </div>
                                    <div class="photoDiv">
                                        <input type="radio" name="photo" value="8.jpg"/><img
                                            src="${pageContext.request.contextPath}/images/8.jpg"
                                            class="photo"/>
                                    </div>

                                </div>
                                <div style="clear: both; text-align: center;">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                    </button>
                                    &nbsp;&nbsp;&nbsp;&nbsp;<input class="btn btn-danger" type="submit"
                                                                   value="确定">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="right">
            <div class="Job">
                <span class="one">职业:</span>
                <span class="two">
                    ${USER_SESSION.job}
                </span>
            </div>
            <div class="Company">
                <span class="one">工作单位：</span>
                <span class="two">
                    ${USER_SESSION.company}
                </span>
            </div>
            <div class="Description">
                <span class="one">简介:</span>
                <span class="two">
                    ${USER_SESSION.description}
                </span>
            </div>
        </div>
    </article>


    </body>
</html>
