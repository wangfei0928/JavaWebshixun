<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/14
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String name = request.getParameter("name");
    String [] hobbies = request.getParameterValues("hobby");
    String sex = request.getParameter("sex");
%>
<%=name%>
<%=Arrays.toString(hobbies)%>
<%=sex%><br>
${pageContext.servletContext.contextPath}<br>

</body>
</html>
