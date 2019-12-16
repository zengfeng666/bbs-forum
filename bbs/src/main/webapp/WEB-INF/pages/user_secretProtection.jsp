<%--
  Created by IntelliJ IDEA.
  User: WangYuYang
  Date: 2019/12/1
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>密保问题</title>
    <style>
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
        body article form .verify_password,.new-password{
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
</head>

<body>
<header>
    <div class="ima">
        <img src="${pageContext.request.contextPath}/images/nculogo.png" alt="">
    </div>
    <h1>
        密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;保
    </h1>
</header>
<article>
    <form action="${pageContext.request.contextPath}/user/secretAnswer" method="post"
          class="my-login-validation" novalidate="">
        <div class="form-group">
            <input id="username" type="hidden" class="form-control" name="username"
                   value="${resetPassword.username}" required autofocus>
        </div>
        <div class="input">
            <label for="answer">问题：${resetPassword.question}</label><br>
            <input id="answer" type="text" name="answer"
                   placeholder="请输入密保答案" required autofocus
            style="    margin-left: 14%;margin-top: 5%;width: 385px;height: 40px">${msg}
        </div>
        <div class="form-group m-0">
            <button type="submit" class="btn btn-primary btn-block">
                提交
            </button>
        </div>
    </form>
</article>
</div>
</body>
</html>