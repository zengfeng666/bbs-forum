<%--
  Created by IntelliJ IDEA.
  User: zengfeng
  Date: 2019/12/16
  Time: 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <title>Title</title>
        <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js" type="text/javascript"></script>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <style type="text/css">
            html * {
                padding: 0;
                margin: 0;
                font-family: Arial, Verdana, Helvetica, sans-serif;
            }

            .nav {
                margin-top: 200px;
            }

            .nav * {
                text-decoration: none;
                font-size: 12pt;
            }

            #content .menu .nav * a:hover {
                background-color: #82ce18;
            }

            .menu {
                list-style: none;
                height: 40px;
                width: 55%;
                margin-left: 259px;
                background-color: #2975C4;
                /*margin-top: 96px;*/
            }

            .nav {
                list-style: none;
                height: 40px;
                width: 1000px;
                margin: 0 auto;
                background-color: #2975C4;
            }

            .nav li {
                float: left;
                border-left: 1px solid #2975C4;
                border-right: 1px solid #2975C4;
                border-top: 1px solid #2975C4;
                border-bottom: 1px solid #2975C4;
                position: relative;
            }

            .nav li a {
                color: #fff;
                height: 38px;
                line-height: 38px;
                font-weight: bold;
                padding: 0 20px;
                blr: expression(this.onFocus=this.close());
                blr: expression(this.onFocus=this.blur());
                display: inline-block;
            }

            .nav li a:focus {
                -moz-outline-style: none;
            }

            .nav li .sub-nav {
                position: absolute;
                top: 39px;
                left: -1px;
                list-style: none;
                background-color: #2975C4;
                display: none;
            }

            .nav li .sub-nav li {
                text-align: center;
                clear: left;
                width: 140px;
                height: 35px;
                line-height: 35px;
                position: relative;
            }

            .nav li .sub-nav li a {
                height: 34px;
                line-height: 34px;
                width: 138px;
                padding: 0;
                display: inline-block;
            }

            #top {
                height: 110px;
                width: 1000px;
                margin-left: 259px;
                background: url("${pageContext.request.contextPath}/images/bgtop.jpg") no-repeat;
            }

            #login {
                float: right;
                margin: 20px;
                margin-right: -9px;
            }

            #login a {
                text-decoration: none;
                margin: 3px;
                color: #337DC4;
                font-family: 黑体;
            }

            #login p {
                margin: 5px;
            }

            #login input[type="submit"] {
                width: 70px;
                height: 21px;
                vertical-align: middle;
            }

            #ad {
                height: 100px;
                width: 1000px;
                margin-left: 259px;
                background-image: url("${pageContext.request.contextPath}/images/ad.jpg");
            }

            #photo {
                width: 65px;
                height: 65px;
                margin-right: 10px;
            }

            #table_user td {
                text-align: center;
                margin: 20px;
            }

            #div_search {
                height: 50px;
                width: 1000px;
                margin-left: 259px;
                background-color: #E8EFF5;
                padding: 10px;
            }

            #div_search input{
                width: 470px;
                height: 30px;
                padding: 4px;
            }

            #div_search img{
                height: 30px;
            }
        </style>

        <script type="text/javascript">
            $(function () {
                $(".nav>li").hover(function () {
                    $(this).children('ul').stop(true, true).show(300);
                }, function () {
                    $(this).children('ul').stop(true, true).hide(300);
                })
            })
        </script>
    </head>
    <body>
        <div id="top">
            <div id="login">
                <c:if test="${USER_SESSION == null}">
                    <form action="${pageContext.request.contextPath}/user/login" method="post">
                        <p>
                            账号 <input type="text" name="username" placeholder="用户名" required/>
                            <a href="${pageContext.request.contextPath}/page/forget">找回密码</a>
                        </p>
                        <p>
                            密码 <input type="password" name="password" required/>

                            <a href="${pageContext.request.contextPath}/page/register">注册[Register]</a>
                        </p>
                        <p>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="submit" value="登录"/>
                        </p>
                    </form>
                </c:if>
                <c:if test="${USER_SESSION != null}">
                    <table id="table_user">
                        <tr>
                            <td>${USER_SESSION.nickname}</td>
                            <td rowspan="3">
                                <a href="${pageContext.request.contextPath}/page/user_profile"><img id="photo"
                                                                                                    src="${pageContext.request.contextPath}/images/${USER_SESSION.photo}"/></a>
                            </td>
                        </tr>
                        <tr>
                            <td>等级:${USER_SESSION.rank}&nbsp;&nbsp;&nbsp;&nbsp;
                                积分:${USER_SESSION.credit}</td>
                        </tr>
                        <tr>
                            <td>
                                <a href="${pageContext.request.contextPath}/user/logout">退出</a>
                            </td>
                        </tr>
                    </table>
                </c:if>
            </div>
        </div>
        <div id="content">
            <div class="menu">
                <ul class="nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/index.jsp">首页</a>
                    </li>
                    <li>
                        <a href="#">看帖</a>
                        <ul class="sub-nav">
                            <li>
                                <a href="${pageContext.request.contextPath}/post/showPosts?kind=0">二次元</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/post/showPosts?kind=1">科技</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/post/showPosts?kind=2">小说</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/post/showPosts?kind=3">生活</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/post/showPosts?kind=4">娱乐新闻</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">发帖</a>
                        <ul class="sub-nav">
                            <li>
                                <a href="${pageContext.request.contextPath}/post/transitKind?kind=0">二次元</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/post/transitKind?kind=1">科技</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/post/transitKind?kind=2">小说</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/post/transitKind?kind=3">生活</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/post/transitKind?kind=4">娱乐新闻</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">我的帖子</a>
                        <ul class="sub-nav">
                            <li>
                                <a href="${pageContext.request.contextPath}/post/findAllPostByMe">我的发帖</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/post/findAllReplyByMe">我的回帖</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">问题</a>
                        <ul class="sub-nav">
                            <li>
                                <a href="${pageContext.request.contextPath}/question/findAll">全部问题</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/page/question_ask">发起提问</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/askQ">我的提问</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/replyQ">我的回复</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/notice/showNotices">公告</a>
                    </li>
                    <li>
                        <a href="#">排行榜</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/page/user_profile">个人信息</a>
                    </li>
                </ul>
            </div>
        </div>
        <div id="ad"></div>
        <div id="div_search">
            <input type="text" placeholder="请输入搜索内容" required/>
            <a href="${pageContext.request.contextPath}/post/search"><img src="${pageContext.request.contextPath}/images/search.jpg"/></a>
        </div>
    </body>
</html>
