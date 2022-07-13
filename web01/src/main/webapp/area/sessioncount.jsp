<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/13
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Object dian = session.getAttribute("dian");
    Integer sum = 0;
    if (dian == null){
        sum = 1;
        session.setAttribute("dian",sum);
    }else {
        sum = (Integer) dian + 1;
        session.setAttribute("dian",sum);
    }
%>
我被点了<%=sum%>次
</body>
</html>
