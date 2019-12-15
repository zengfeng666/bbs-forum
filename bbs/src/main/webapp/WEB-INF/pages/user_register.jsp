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


                                <form action="${pageContext.request.contextPath}/user/register" method="post"
                                      class="my-login-validation" novalidate="">
                                    <div class="form-group">
                                        <label for="username">用户名</label>
                                        <input id="username" type="text" class="form-control" name="username" required
                                               autofocus>
                                        <div class="invalid-feedback">
                                            What's your username?
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="nickname">昵称</label>
                                        <input id="nickname" type="text" class="form-control" name="nickname" required
                                               autofocus>
                                        <div class="invalid-feedback">
                                            What's your nickname?
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input id="password" type="password" class="form-control" name="password"
                                               required data-eye>
                                        <div class="invalid-feedback">
                                            Password is required
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="email">邮箱</label>
                                        <input id="email" type="email" class="form-control" name="email" required>
                                        <div class="invalid-feedback">
                                            Your email is invalid
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="tel">电话</label>
                                        <input id="tel" type="text" class="form-control" name="tel" required data-eye>
                                        <div class="invalid-feedback">
                                            telephone is invalid
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>性别</label>
                                        <input type="radio" name="sex" value="male" required data-eye>男
                                        <input type="radio" name="sex" value="male" required data-eye>女
                                        <div class="invalid-feedback">
                                            sex is invalid
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="description">个性签名</label>
                                        <input id="description" type="text" class="form-control" name="description"
                                               required autofocus>
                                        <div class="invalid-feedback">
                                            What's your description?
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="job">工作</label>
                                        <input id="job" type="text" class="form-control" name="job" required autofocus>
                                        <div class="invalid-feedback">
                                            What's your job?
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="company">个性签名</label>
                                        <input id="company" type="text" class="form-control" name="company" required
                                               autofocus>
                                        <div class="invalid-feedback">
                                            What's your company?
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
                                        Already have an account? <a href="user_login.jsp">Login</a>
                                    </div>
                                </form>
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
