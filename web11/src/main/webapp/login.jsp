<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/20
  Time: 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/mycs.css" type="text/css">
</head>
<body>
<h1>欢迎来到登录界面</h1>
<form method="post" action="<%=request.getContextPath()%>/login">
    <table>
        <tr>
            <td>用户名</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input type="text" name="password"></td>
        </tr>
        <tr>
            <td><input type="submit" value="提交"></td>
        </tr>
    </table>
</form>
</body>
</html>
