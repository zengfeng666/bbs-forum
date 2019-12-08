<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>BBS论坛首页</title>
        <!-- 1. 导入CSS的全局样式 -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
        <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
        <!-- 3. 导入bootstrap的js文件 -->
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <div class="header">
            <button type="button" class="login1"><a href="${pageContext.request.contextPath}/pages/login.jsp">登入</a> </button>
            <button type="button" class="register1"><a href="${pageContext.request.contextPath}/pages/register.jsp">注册</a> </button>
            <div class="top-bar">
                <div style="text-align: center">
                    <form class="form-inline">
                        <div class="form-group">
                            <input type="text" class="form-control" id="exampleInputName2" placeholder="请输入您要搜索的帖子" size="60">
                        </div>
                        <button type="submit" class="btn btn-default" style="width: 106px">查找</button>
                    </form>
                </div>
            </div>
            <div class="nav-bar">
                <div class="nav-bg">
                    <div class="nav-top">
                        <div class="nav-content">
                            <ul class="nav-content-box">
                                <li class="index on">
                                    <span><a href="#">首页</a></span>
                                </li>
                                <li class="cat">
                                    <span><a href="#">分类</a></span>
                                    <ul>
                                        <li><a href="#" target="iframe1">自然</a></li>
                                        <li><a href="#" target="iframe1">文化</a></li>
                                        <li><a href="#" target="iframe1">地理</a></li>
                                        <li><a href="#" target="iframe1">历史</a></li>
                                        <li><a href="#" target="iframe1">生活</a></li>
                                        <li><a href="#" target="iframe1">社会</a></li>
                                        <li><a href="#" target="iframe1">艺术</a></li>
                                        <li><a href="#" target="iframe1">人物</a></li>
                                        <li><a href="#"  target="iframe1">经济</a></li>
                                        <li><a href="#" target="iframe1">科技</a></li>
                                        <li><a href="#" target="iframe1">体育</a></li>
                                    </ul>
                                </li>
                                <li class="special ">
                                    <span><a href="javascript:void(0)" target="iframe1">看帖</a></span>
                                    <ul>
                                        <li><a href="#" target="iframe1">文字帖</a></li>
                                        <li><a href="#" target="iframe1">投票贴</a></li>
                                        <li><a href="#" target="iframe1">精品贴</a></li>
                                    </ul>
                                </li>
                                <li class="user">
                                    <span><a href="javascript:void(0)">发帖</a></span>
                                    <ul>
                                        <li><a href="#" target="iframe1">文字帖</a></li>
                                        <li><a href="#" target="iframe1">投票贴</a></li>
                                    </ul>
                                </li>
                                <li class="cooperation">
                                    <span><a href="javascript:void(0)">我的帖子</a></span>
                                    <ul>
                                        <li><a href="#" target="iframe1">我的发帖</a></li>
                                        <li><a href="#" target="iframe1">我的回帖</a></li>
                                    </ul>
                                </li>
                                <li class="index on">
                                    <span><a href="javascript:void(0)">全部需求</a></span>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/question/findAllQuestion" target="iframe1">全部需求</a></li>
                                        <li><a href="${pageContext.request.contextPath}/pages/post-question.jsp" target="iframe1">发布需求</a></li>
                                        <li><a href="${pageContext.request.contextPath}/pages/login.jsp" target="iframe1">我的需求</a></li>

                                    </ul>
                                </li>
                                <li class="index on">
                                    <span><a href="javascript:void(0)">系统公告</a></span>
                                    <ul>
                                        <li><a href="#" target="iframe1">公告</a></li>
                                    </ul>
                                </li>
                                <li class="index on">
                                    <span><a href="javascript:void(0)">个人信息</a></span>
                                </li>
                                <li class="index on">
                                    <span><a href="javascript:void(0)">系统设置</a></span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <iframe name="iframe1"  frameborder="0"></iframe>
        </div>
    </body>
</html>