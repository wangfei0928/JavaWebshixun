<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/13
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
登陆成功
用户名为:
<%=
    request.getParameter("uname")
%>
<%=    request.getParameter("upassword")
%>
</body>
</html>
