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
    <title>忘记密码</title>
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

                        <form action="${pageContext.request.contextPath}/user/forget" method="post"
                              class="my-login-validation" novalidate="">
                            <div class="form-group">
                                <label for="username">账号</label>
                                <input id="username" type="text" class="form-control" name="username"
                                       placeholder="请输入姓名" required autofocus>
                                <div class="invalid-feedback">
                                    username is invalid
                                </div>
                            </div>

                            <div class="form-group m-0">
                                <button type="submit" class="btn btn-primary btn-block">
                                    Submit
                                </button>
                            </div>

                        </form>
                        <font color="red">${msg}</font>
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
