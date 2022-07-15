<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/14
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1 align="center">欢迎登陆</h1>
<p style="color: red;text-align: center" >${param.msg}</p>
<form action="loginaction.jsp" method="post">
  <table align="center">
    <tr>
      <td>用户名:</td>
      <td><input type="text" name="name"></td>
    </tr>
    <tr>
      <td>密码:</td>
      <td><input type="password" name="password"></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input type="submit" value="登录" style="width: 230px"></td>
    </tr>
  </table>
</form>
</body>
</html>
