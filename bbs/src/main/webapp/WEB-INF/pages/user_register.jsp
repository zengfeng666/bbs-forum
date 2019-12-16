<%--
  Created by IntelliJ IDEA.
  User: WangYuYang
  Date: 2019/12/1
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
        <title>注册</title>
        <style>
            .clearfix::after{
                content:"";
                clear: both;
                display: block;
            }
            body{
                background: url("${pageContext.request.contextPath}/images/timg1.gif") no-repeat;
                background-size:  100% 100%;
                height: 722px;
            }
            header{
                width: 100%;
                height: 30%;
            }

            header .ima{
                margin-top: 30px;
                text-align: center;
            }
            header .ima img{
                width: 140px;
                height: 140px;
            }
            header h1{
                margin-top:30px;
                text-align: center;
                font-size: 45px;
                font-weight: bold;
                margin-bottom: 40px;
                font-family:initial;
                padding-bottom: 20px;
                width: 80%;
                margin-left: 10.2%;
            }
            article{
                margin: 0 auto;
                height: auto;
                width: 40%;
            }
            article .input{
                margin-top: 55px;
            }
            input[type="text"],input[type="password"],input[type="email"]{
                width: 318px;
                height: 35px;
                margin-left: 1%;
                font-size: 15px;
                border: 1px solid #b4c1e0;
                border-radius: 3px;
                text-indent: 15px;
            }
            input[type="text"]:hover,input[type="password"]:hover,input[type="email"]:hover{
                border-color:#c0c4cc;
            }

            input[type="text"]:focus,input[type="password"]:focus,input[type="email"]:focus{
                border-color: #00a1d6;
            }
            article .input input::placeholder{
                margin-left: 15px;
            }
            article .input label{
                padding-top: 1%;
                font-size: 21px;
                color: #0a0a0a;
                font-family:Verdana, Geneva, Tahoma, sans-serif;
                margin-left: 13%;
            }
            article .remember{
                margin-top: 1%;
                color: #042020;
                font-size: 14px;
            }

            article .remember span input[type="checkbox"]{
                margin-left: 27%;
                margin-top: 7px;
            }
            article .remember a{
                margin-left: 30%;
                color: #042020;
                text-decoration: none;
            }
            article .maintain{
                margin-left: 46%;
            }
            article button{
                width: 65%;
                height: 46px;
                background: #389c9c;
                margin-left: 13.6%;
                margin-top: 4%;
                font-size: 25px;
                color: #dddddd;
                font-family: unset;
                font-weight: bold;
                border-radius: 4px;
                border: 1px solid;
                margin-bottom: 1%;
            }
            article .resetSubmit{
                width: 66.3%;
            }
            article .forgetSubmit{
                margin-top: 7%;
                width: 66.3%;
            }
            article .remember .passwordRegister{
                margin-left: 44%;
            }
            body article form .verify_password{
                margin-top: 1%;
            }
            article form .input{
                margin-top: 4%;
            }
            article .tiao a{
                text-decoration: none;
                font-size: 14px;
                color: #042020;
                margin-left: 57%;
            }

        </style>
        <script>
            function checkUsername() {
                var username = document.getElementById("username").value;
                if(username.charAt(0) >= '0' && username.charAt(0) <= '9'){
                    document.getElementById("usernameError").innerHTML = "用户名不能以数字开头!";
                    return false;
                } else {
                    document.getElementById("usernameError").innerHTML = "";
                    return true;
                }
            }

            function verifyPassword() {
                var password = document.getElementById("password").value;
                var verify_password = document.getElementById("verify_password").value;
                if(password != verify_password){
                    document.getElementById("verifyPasswordError").innerHTML = "确认密码与密码不一致!";
                    return false;
                } else {
                    document.getElementById("verifyPasswordError").innerHTML = "";
                    return true;
                }
            }

            function check() {
                if(checkUsername() == false){
                    alert("用户名不能以数字开头!");
                    return false;
                }
                if(verifyPassword() == false){
                    alert("确认密码与密码不一致！");
                    return false;
                }

                return true;
            }
        </script>
    </head>
    <body>

    <header>
        <div class="ima">
            <img src="${pageContext.request.contextPath}/images/nculogo.png" alt="">
        </div>
        <h1>
            注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册
        </h1>
    </header>
    <article>
        <form onsubmit="return check();" action="${pageContext.request.contextPath}/user/register" method="post">
            <div class="input">
                <label for="username">账&nbsp;号：</label>
                <input id="username" type="text" placeholder="账号" name="username" value="${user.username}" required
                       autofocus onblur="checkUsername();">
            </div>
            <div class="input">
                <label for="username">昵&nbsp;称：</label>
                <input id="nickname" type="text" placeholder="昵称" name="nickname" value="${user.nickname}" required
                       autofocus>
            </div>
            <div class="input">
                <label for="password">密&nbsp;码：</label>
                <input id="password" type="password" placeholder="密码" name="password" value="${user.password}"
                       required data-eye>
            </div>
            <div class="input">
                <label for="verify_password">密&nbsp;码：</label>
                <input id="verify_password" type="password" placeholder="确认密码"
                       required data-eye onblur="verifyPassword()">
            </div>
            <font color="red" id="usernameError"></font>
            <font color="red" id="verifyPasswordError"></font>
            <%--msg为用户名已存在--%>
            <font color="red">${msg}</font>

            <div>
                <button type="submit" id="submit" class="btn btn-primary btn-block">
                    注册
                </button>
            </div>
            <div class="tiao">
                <p><a href="${pageContext.request.contextPath}/page/login">已注册，直接登录</a></p>
            </div>
        </form>
    </article>

    </body>
</html>
