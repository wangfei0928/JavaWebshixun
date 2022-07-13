<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/13
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    pageContext.setAttribute("page","pageMsg");
    request.setAttribute("request","requestMsg");
    session.setAttribute("session","sessionMsg");
    application.setAttribute("application","applicationMsg");
%>
pageContext:<%=pageContext.getAttribute("page")%><br>
request:<%=request.getAttribute("request")%>
session:
<jsp:forward page="b.jsp"></jsp:forward>
</body>
</html>
