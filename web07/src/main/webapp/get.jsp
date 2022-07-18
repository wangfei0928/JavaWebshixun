<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/18
  Time: 10:28
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
    for (Cookie cookie : cookies) {
        out.print(cookie.getName()+"----"+cookie.getValue()+"<br>");
    }
%>
</body>
</html>
