<%@ page import="com.wf.web01.Student" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/13
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  Student student = new Student("张飞",18);
  out.write(String.valueOf(student));
%>
</body>
</html>
