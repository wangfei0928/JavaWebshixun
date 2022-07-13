<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/13
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
我是b页面
<%
    String name = request.getParameter("name");
%>
<br>
<%=name%>
</body>
</html>
