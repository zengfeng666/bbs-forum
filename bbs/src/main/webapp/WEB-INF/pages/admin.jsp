<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>BBS管理员系统</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <style>
        #main{
            width: 1000px;
            margin: 0 auto;
            border: 1px solid #CDCDCB;
        }
        .main_th{
            width: 1000px;
            height: 45px;
            background-color: #EFF4F5;
        }
        .main_td{
            width: 500px;
            height: 100px;
            border-left: 0px;
            border-right: 0px;

        }
        .main_td:hover{
            background-color: #F2F2EF;
            cursor: pointer;
        }
        .title1{
            margin: auto 7px;
            font-weight: bold;
            color: #1b6d85;
            font-family:黑体;
            font-size: 1.1em;
        }
        .imageDiv img{
            width: 122px;
            height: 66px;
            margin: auto 30px;
            float: left;

        }
        #mainTable{
            border: 0px;
        }
        .title2{
            margin: 2px auto 12px 170px;
            font-weight: bold;
        }
        .title3{
            margin: 2px auto 2px 170px;
            font-family: 宋体;
            font-size: 0.8em;
        }

    </style>
</head>
<body>

<jsp:include page="../../admin_top.jsp"></jsp:include>

<div id="main">
    <table border="1" id="mainTable">
        <tr>
            <th class="main_th" colspan="2">
                <p class="title1">官方通告</p>
            </th>
        </tr>
        <tr>
            <td class="main_td" onclick="window.location.href='${pageContext.request.contextPath}/admin/showNotices'">
                <div class="imageDiv"> <img src="${pageContext.request.contextPath}/images/main/05.gif" /></div>
                <p class="title2">系统通知</p>
                <p class="title3">与本论坛有关个重要事情都在这里宣布哦~</p>
            </td>
            <td class="main_td" onclick="window.location.href='${pageContext.request.contextPath}'">
                <div class="imageDiv"><img src="${pageContext.request.contextPath}/images/main/22.gif" /></div>
                <p class="title2">经验排行榜</p>
                <p class="title3">今日排名很稳定，很稳定……淡定，以不变应万变~</p>
            </td>
        </tr>
        <tr>
            <th class="main_th" colspan="2">
                <p class="title1">帖子版块</p>
            </th>
        </tr>
        <tr>
            <td class="main_td" onclick="window.location.href='${pageContext.request.contextPath}/admin/showPosts?kind=0'">
                <div class="imageDiv"><img src="${pageContext.request.contextPath}/images/main/01.gif" /></div>
                <p class="title2">数码科技</p>
                <p class="title3">买到了山寨苹果12？快来这里吐槽吧~</p>
            </td>
            <td class="main_td" onclick="window.location.href='${pageContext.request.contextPath}/admin/showPosts?kind=1'">
                <div class="imageDiv"><img src="${pageContext.request.contextPath}/images/main/20.gif" /></div>
                <p class="title2">音乐分享</p>
                <p class="title3">周杰伦又发新歌了哦~快来和朋友们一起分享吧~</p>
            </td>
        </tr>
        <tr>
            <td class="main_td" onclick="window.location.href='${pageContext.request.contextPath}/admin/showPosts?kind=2'">
                <div class="imageDiv"><img src="${pageContext.request.contextPath}/images/main/18.gif" /></div>
                <p class="title2">体育运动</p>
                <p class="title3">每天一次马拉松~跑完了记得来打卡签到哦~</p>
            </td>
            <td class="main_td" onclick="window.location.href='${pageContext.request.contextPath}/admin/showPosts?kind=3'">
                <div class="imageDiv"><img src="${pageContext.request.contextPath}/images/main/08.gif" /></div>
                <p class="title2">校园生活</p>
                <p class="title3">四六级考试刚结束，你们考的翻译是哪朵花呢？</p>
            </td>
        </tr>
        <tr>
            <td class="main_td" onclick="window.location.href='${pageContext.request.contextPath}/admin/showPosts?kind=4'">
                <div class="imageDiv"><img src="${pageContext.request.contextPath}/images/main/06.gif" /></div>
                <p class="title2">聊天交友</p>
                <p class="title3">空虚寂寞冷？快来一起聊天吧~</p>
            </td>
            <td class="main_td" onclick="window.location.href='${pageContext.request.contextPath}/admin/showPosts?kind=5'">
                <div class="imageDiv"><img src="${pageContext.request.contextPath}/images/main/26.gif" /></div>
                <p class="title2">好书推荐</p>
                <p class="title3">每日好书推荐！今天你又读了哪些书呢？</p>
            </td>
        </tr>
        <tr>
            <th class="main_th" colspan="2">
                <p class="title1">问答版块</p>
            </th>
        </tr>
        <tr>
            <td class="main_td" onclick="window.location.href='${pageContext.request.contextPath}/question/findAll'">
                <div class="imageDiv"><img src="${pageContext.request.contextPath}/images/main/13.gif" /></div>
                <p class="title2">问答专区</p>
                <p class="title3">来看看大家都在问些什么吧~</p>
            </td>
            <td class="main_td" onclick="window.location.href='${pageContext.request.contextPath}/page/question_ask'">
                <div class="imageDiv"><img src="${pageContext.request.contextPath}/images/main/16.gif" /></div>
                <p class="title2">发起提问</p>
                <p class="title3">有问题不知如何解决？来问问无所不知的水友们吧~</p>
            </td>
        </tr>
    </table>
</div>
<jsp:include page="../../bottom.jsp"></jsp:include>
</body>

</body>
</html>