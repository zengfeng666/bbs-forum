<%--
  Created by IntelliJ IDEA.
  User: 敖俊
  Date: 2019/12/17
  Time: 11:27
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
    <link href="${pageContext.request.contextPath}/css/admin_top.css" rel="stylesheet">

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
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="submit" value="登录"/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="${pageContext.request.contextPath}/page/login">登录起始页</a>
                </p>
            </form>
        </c:if>
        <c:if test="${USER_SESSION != null}">
            <table id="table_user">
                <tr>
                    <td>${USER_SESSION.nickname}</td>
                    <td rowspan="3">
                        <a href="${pageContext.request.contextPath}/page/user_profile">
                            <img id="photo"
                                 src="${pageContext.request.contextPath}/images/${USER_SESSION.photo}"/>
                        </a>
                    </td>
                </tr>
                <tr>
                    <td>等级: Lv${USER_SESSION.rank}&nbsp;&nbsp;&nbsp;&nbsp;
                        积分:${USER_SESSION.credit}</td>
                </tr>
                <tr>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/logout">退出</a>
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
                <a href="${pageContext.request.contextPath}/page/admin">首页</a>
            </li>
            <li>
                <a href="#">看帖</a>
                <ul class="sub-nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/showPosts?kind=0">数码科技</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/showPosts?kind=1">音乐分享</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/showPosts?kind=2">体育运动</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/showPosts?kind=3">校园生活</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/showPosts?kind=4">聊天交友</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/showPosts?kind=5">好书推荐</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">发帖</a>
                <ul class="sub-nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/post/transitKind?kind=0">数码科技</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/post/transitKind?kind=1">音乐分享</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/post/transitKind?kind=2">体育运动</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/post/transitKind?kind=3">校园生活</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/post/transitKind?kind=4">聊天交友</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/post/transitKind?kind=5">好书推荐</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">问题</a>
                <ul class="sub-nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/showQ">全部问题</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/page/question_ask">发起提问</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/showNotices">公告</a>
            </li>
            <li>
                <a href="#">排行榜</a>
                <ul class="sub-nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/rank/show">经验排行榜</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/rank/showC">积分排行榜</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">个人信息</a>
                <ul class="sub-nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/page/user_profile">我的主页</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/post/findAllPostByMe">我的发帖</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/post/findAllReplyByMe">我的回帖</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/user/askQ">我的提问</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/user/replyQ">我的回复</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<div id="ad"></div>
<div id="div_search">
    <form action="${pageContext.request.contextPath}/post/search" method="post" id="form_search">
        <input type="text" name="title" id="search_title" placeholder="搜贴 (长度不超过50)" required/>
        <a href="javascript:checkForm();">
            <img src="${pageContext.request.contextPath}/images/search.jpg"/>
        </a>
    </form>
</div>
</body>
<script>
    function checkForm() {
        var value = document.getElementById("search_title").value;
        if(value.length > 50){
            alert("搜索内容不能超过50个字符！");
            return false;
        }
        document.getElementById("form_search").submit();
        return true;
    }
</script>
</html>
