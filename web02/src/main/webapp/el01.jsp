<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/14
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setAttribute("req","reqMsg");
    session.setAttribute("session","sessionMsg");
%>
<%=request.getAttribute("req")%>
<%=session.getAttribute("session")%><br>
${requestScope.req}<br>
${sessionScope.session}<br>
${req}<br>
${session}
<br><br><br>
${13 mod 5}<br>
${2+5}<br>
${12/4}<br>
${'2'eq'2'}<br>
${not true}<br>
是空值吗？${empty param.name}<br>
${empty param.name?"ok":"no"}
</body>
</html>
