<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/18
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Object isLogin = session.getAttribute("isLogin");
    if (isLogin == null) {
        //没有登录成功
        response.sendRedirect("list");
    }
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie : cookies) {
        out.print(cookie.getName()+"----"+cookie.getValue()+"<br>");
    }
%>
</body>
</html>
