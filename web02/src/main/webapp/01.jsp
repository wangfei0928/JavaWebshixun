<%@ page import="com.sun.deploy.net.HttpResponse" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/14
  Time: 8:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    pageContext.setAttribute("page","pageConMsg");
    pageContext.setAttribute("page","张三");

    HttpServletRequest req = (HttpServletRequest) pageContext.getRequest();
    HttpServletResponse resp = (HttpServletResponse) pageContext.getResponse();
    pageContext.getServletConfig();/*当前jsp/java文件对应的配置*/
    ServletConfig app = pageContext.getServletConfig();//得到application
    HttpSession session1 = pageContext.getSession();  //session内助

%>
<%=pageContext.getAttribute("page")%>
</body>
</html>
