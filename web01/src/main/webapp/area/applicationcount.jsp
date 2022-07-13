<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/13
  Time: 17:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>我是一个手机</h1>
<%
    Object o = application.getAttribute("dian");
    Integer n = 0;
    if (o==null){
        n = 1;
        application.setAttribute("dian",n);
    }else {
        n = (Integer) o;
        n = n + 1;
        application.setAttribute("dian",n);
    }
%>

<p>我被访问了<%=n%>次</p>
</body>
</html>
