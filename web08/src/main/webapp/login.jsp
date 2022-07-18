<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/18
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Cookie[] cookies = request.getCookies();
    String name = "";
    String password = "";
    if (cookies!=null&&cookies.length>0){
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("name")){
                name = cookie.getValue();
            }
            if (cookie.getName().equals("password")){
                password=cookie.getValue();
            }
        }
    }
%>
<form action="<%=request.getContextPath()%>/login" method="post">
    <table>
        <tr>
            <td>用户名：</td>
            <td><input type="text" name="name" value="<%=name%>"></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input type="password" name="password" value="<%=password%>"></td>
        </tr>
        <tr>
            <td><input type="checkbox" name="isRem" value="1">记住我</td>
        </tr>
        <tr>
            <td><input type="submit" value="提交"></td>
        </tr>
    </table>
</form>
</body>
</html>
