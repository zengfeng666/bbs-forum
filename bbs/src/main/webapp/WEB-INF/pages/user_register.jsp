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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/my-login.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/my-login.js"></script>

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
    <body class="my-login-page">
        <section class="h-100">
            <div class="container h-100">
                <div class="row justify-content-md-center h-100">
                    <div class="card-wrapper">
                        <div class="brand">
                            <img src="../images/logo.jpg" alt="bootstrap 4 login page">
                        </div>
                        <div class="card fat">
                            <div class="card-body">
                                <h4 class="card-title">Register</h4>


                                <form onsubmit="return check();" action="${pageContext.request.contextPath}/user/register" method="post"
                                      class="my-login-validation" novalidate="">
                                    <div class="form-group">
                                        <label for="username">用户名</label>
                                        <input id="username" type="text" class="form-control" name="username" value="${user.username}" required
                                               autofocus onblur="checkUsername();">
                                        <div class="invalid-feedback">
                                            What's your username?
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="nickname">昵称</label>
                                        <input id="nickname" type="text" class="form-control" name="nickname" value="${user.nickname}" required
                                               autofocus>
                                        <div class="invalid-feedback">
                                            What's your nickname?
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="password">密码</label>
                                        <input id="password" type="password" class="form-control" name="password" value="${user.password}"
                                               required data-eye>
                                        <div class="invalid-feedback">
                                            Password is required
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="verify_password">确认密码</label>
                                        <input id="verify_password" type="password" class="form-control"
                                               required data-eye onblur="verifyPassword()">
                                        <div class="invalid-feedback">
                                            Verify Password is required
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="custom-checkbox custom-control">
                                            <input type="checkbox" name="agree" id="agree" class="custom-control-input"
                                                   required="">
                                            <label for="agree" class="custom-control-label">I agree to the <a href="#">Terms
                                                and Conditions</a></label>
                                            <div class="invalid-feedback">
                                                You must agree with our Terms and Conditions
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group m-0">
                                        <button type="submit" class="btn btn-primary btn-block">
                                            Register
                                        </button>
                                    </div>
                                    <div class="mt-4 text-center">
                                        Already have an account? <a href="${pageContext.request.contextPath}/page/login">Login</a>
                                    </div>
                                </form>
                                <font color="red" id="usernameError"></font>
                                <font color="red" id="verifyPasswordError"></font>
                                <%--msg为用户名已存在--%>
                                <font color="red">${msg}</font>
                            </div>
                        </div>
                        <div class="footer">
                            Copyright &copy; 2017 &mdash; Your Company
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
