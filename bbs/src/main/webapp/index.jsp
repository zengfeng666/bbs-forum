<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>BBS论坛首页</title>
        <!-- 1. 导入CSS的全局样式 -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
        <script src="js/jquery-2.1.0.min.js"></script>
        <!-- 3. 导入bootstrap的js文件 -->
        <script src="js/bootstrap.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <div class="header">
            <div class="top-bar">
                <div style="text-align: center">
                    <form class="form-inline">
                        <div class="form-group">
                            <input type="text" class="form-control" id="exampleInputName2" placeholder="请输入您要搜索的帖子" size="60">
                        </div>
                        &nbsp;&nbsp;&nbsp;
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
                                        <li><a href="#">自然</a></li>
                                        <li><a href="#">文化</a></li>
                                        <li><a href="#">地理</a></li>
                                        <li><a href="#">历史</a></li>
                                        <li><a href="#">生活</a></li>
                                        <li><a href="#">社会</a></li>
                                        <li><a href="#">艺术</a></li>
                                        <li><a href="#">人物</a></li>
                                        <li><a href="#">经济</a></li>
                                        <li><a href="#">科技</a></li>
                                        <li><a href="#">体育</a></li>
                                    </ul>
                                </li>
                                <li class="special ">
                                    <span><a href="javascript:void(0)">看帖</a></span>
                                    <ul>
                                        <li><a href="#">文字帖</a></li>
                                        <li><a href="#">投票贴</a></li>
                                        <li><a href="#">精品贴</a></li>
                                    </ul>
                                </li>
                                <li class="user">
                                    <span><a href="javascript:void(0)">发帖</a></span>
                                    <ul>
                                        <li><a href="#">文字帖</a></li>
                                        <li><a href="#">投票贴</a></li>
                                    </ul>
                                </li>
                                <li class="cooperation">
                                    <span><a href="javascript:void(0)">我的帖子</a></span>
                                    <ul>
                                        <li><a href="#">我的发帖</a></li>
                                        <li><a href="#">我的回帖</a></li>
                                    </ul>
                                </li>
                                <li class="index on">
                                    <span><a href="#">全部需求</a></span>
                                    <ul>
                                        <li><a href="#">发布需求</a></li>
                                        <li><a href="#">我的需求</a></li>

                                    </ul>
                                </li>
                                <li class="index on">
                                    <span><a href="#">系统公告</a></span>
                                    <ul>
                                        <li><a href="#">公告</a></li>
                                    </ul>
                                </li>
                                <li class="index on">
                                    <span><a href="#">个人信息</a></span>
                                </li>
                                <li class="index on">
                                    <span><a href="#">系统设置</a></span>
                                </li>
                                <li class="mobile">
                                    <span><a href="javascript:void(0)">手机百科</a></span>
                                    <ul>
                                        <li><a href="#">客户端</a></li>
                                        <li><a href="#">网页版</a></li>
                                    </ul>
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div>
            <br /><br /><br />
            <a href="test.jsp">点这里测试test.jsp</a>
        </div>
    </body>
</html>