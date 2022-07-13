<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/13
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="action.jsp" method="get">
    <table>
        <tr>
            <td>用户名:</td>
            <td><input type="text" name="uname"></td>
        </tr>
        <tr>
            <td>密码:</td>
            <td><input type="password" name="upassword"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="登录"></td>
        </tr>
    </table>
</form>
</body>
</html>
