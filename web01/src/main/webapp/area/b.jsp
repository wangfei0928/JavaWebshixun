<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/13
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    pageContext:<%=pageContext.getAttribute("page")%><br>
    request:<%=request.getAttribute("request")%><br>
    session:<%=session.getAttribute("session")%><br>
    application:<%=application.getAttribute("application")%>
</body>
</html>
