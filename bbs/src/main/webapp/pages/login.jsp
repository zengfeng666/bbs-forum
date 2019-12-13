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
        <title>登入</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/my-login.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
                crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/my-login.js"></script>
    </head>

    <body class="my-login-page">
        <section class="h-100">
            <div class="container h-100">
                <div class="row justify-content-md-center h-100">
                    <div class="card-wrapper">
                        <div class="brand">
                            <img src="../images/logo.jpg" alt="logo">
                        </div>
                        <div class="card fat">
                            <div class="card-body">
                                <h4 class="card-title">Login</h4>

                                <form action="${pageContext.request.contextPath}/user/login" method="post"
                                      class="my-login-validation" novalidate="">
                                    <div class="form-group">
                                        <label for="username">账号</label>
                                        <input id="username" type="text" class="form-control" name="username"
                                               placeholder="请输入姓名" required autofocus>
                                        <div class="invalid-feedback">
                                            username is invalid
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="password">Password
                                            <a href="${pageContext.request.contextPath}/pages/forget.jsp"
                                               class="float-right">
                                                Forgot Password?
                                            </a>
                                        </label>
                                        <input id="password" type="password" class="form-control" name="password"
                                               placeholder="请输入密码" required data-eye>
                                        <div class="invalid-feedback">
                                            Password is required
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="custom-checkbox custom-control">
                                            <input type="checkbox" name="remember" id="remember"
                                                   class="custom-control-input">
                                            <label for="remember" class="custom-control-label">Remember Me</label>
                                        </div>
                                    </div>

                                    <div class="form-group m-0">
                                        <button type="submit" class="btn btn-primary btn-block">
                                            Login
                                        </button>
                                    </div>
                                    <div class="mt-4 text-center">
                                        Don't have an account? <a
                                            href="${pageContext.request.contextPath}/pages/register.jsp">Create One</a>
                                    </div>
                                </form>
                                ${msg}
                            </div>
                        </div>
                        <div class="footer">
                            Copyright &copy; 2019 &mdash; Your Company
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
