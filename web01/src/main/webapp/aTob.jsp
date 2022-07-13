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
你好我是a页面
<%--请求转发的跳转 服务器内部的转发--%>
<jsp:forward page="bfroma.jsp">
    <jsp:param name="name" value="zhagnsna"/>
</jsp:forward>
</body>
</html>
