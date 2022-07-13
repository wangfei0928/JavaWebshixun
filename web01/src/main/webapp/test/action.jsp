<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/13
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String name = request.getParameter("uname");
    String password = request.getParameter("upassword");
    if (name.equals("曹操")&&password.equals("123")){
        //登录成功
%>
    <jsp:forward page="suc.jsp"></jsp:forward>
<%
    }else {
        //登录失败
%>
<jsp:forward page="fail.jsp"></jsp:forward>
<%
    }
%>
</body>
</html>
