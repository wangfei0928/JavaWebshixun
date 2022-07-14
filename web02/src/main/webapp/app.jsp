<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/14
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%=application.getRealPath("")%><%--硬盘上的路径--%>
<%=application.getContextPath()%>
<%
    session.setMaxInactiveInterval(100);
%>
</body>
</html>
