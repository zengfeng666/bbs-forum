<%--
  Created by IntelliJ IDEA.
  User: WangYuYang
  Date: 2019/12/15
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
        <title>个人主页</title>
        <style>
            td {
                width: 200px;
                text-align: center;
                height: 50px;
            }
        </style>
    </head>
    <body>
        <table border="1px" cellspacing="0" cellpadding="0" align="center">
            <tr>
                <td>用户名:</td>
                <td>${USER_SESSION.username}</td>
                <td></td>
            </tr>
            <tr>
                <td>昵称:</td>
                <form action="${pageContext.request.contextPath}/user/updateNickname?uid=${USER_SESSION.uid}" method="post">
                    <td>
                        <input type="text" name="nickname" value="${USER_SESSION.nickname}">
                    </td>
                    <td>
                        <input type="submit" value="确定"/>
                    </td>
                </form>
            </tr>
            <tr>
                <td>邮箱:</td>
                <form action="${pageContext.request.contextPath}/user/updateEmail?uid=${USER_SESSION.uid}" method="post">
                    <td>
                        <input type="text" name="email" value="${USER_SESSION.email}">
                    </td>
                    <td>
                        <input type="submit" value="确定"/>
                    </td>
                </form>
            </tr>
            <tr>
                <td>积分:</td>
                <td>${USER_SESSION.credit}</td>
                <td></td>
            </tr>
            <tr>
                <td>头像:</td>
                <form action="${pageContext.request.contextPath}/user/updatePhoto?uid=${USER_SESSION.uid}" method="post">
                    <td>
                        <input type="text" name="photo" value="${USER_SESSION.photo}">
                    </td>
                    <td>
                        <input type="submit" value="确定"/>
                    </td>
                </form>
            </tr>
            <tr>
                <td>电话:</td>
                <form action="${pageContext.request.contextPath}/user/updateTel?uid=${USER_SESSION.uid}" method="post">
                    <td>
                        <input type="text" name="tel" value="${USER_SESSION.tel}">
                    </td>
                    <td>
                        <input type="submit" value="确定"/>
                    </td>
                </form>
            </tr>
            <tr>
                <td>性别:</td>
                <form action="${pageContext.request.contextPath}/user/updateSex?uid=${USER_SESSION.uid}" method="post">
                    <td>
                        <input type="text" name="sex" value="${USER_SESSION.sex}">
                    </td>
                    <td>
                        <input type="submit" value="确定"/>
                    </td>
                </form>
            </tr>
            <tr>
                <td>个性签名:</td>
                <form action="${pageContext.request.contextPath}/user/updateDescription?uid=${USER_SESSION.uid}" method="post">
                    <td>
                        <input type="text" name="description" value="${USER_SESSION.description}">
                    </td>
                    <td>
                        <input type="submit" value="确定"/>
                    </td>
                </form>
            </tr>
            <tr>
                <td>工作:</td>
                <form action="${pageContext.request.contextPath}/user/updateJob?uid=${USER_SESSION.uid}" method="post">
                    <td>
                        <input type="text" name="job" value="${USER_SESSION.job}">
                    </td>
                    <td>
                        <input type="submit" value="确定"/>
                    </td>
                </form>
            </tr>
            <tr>
                <td>公司:</td>
                <form action="${pageContext.request.contextPath}/user/updateCompany?uid=${USER_SESSION.uid}" method="post">
                    <td>
                        <input type="text" name="company" value="${USER_SESSION.company}">
                    </td>
                    <td>
                        <input type="submit" value="确定"/>
                    </td>
                </form>
            </tr>
            <tr>
                <td>经验:</td>
                <td>${USER_SESSION.exp}</td>
                <td></td>
            </tr>
            <tr>
                <td>等级:</td>
                <td>${USER_SESSION.rank}</td>
                <td></td>
            </tr>
        </table>
    </body>
</html>
