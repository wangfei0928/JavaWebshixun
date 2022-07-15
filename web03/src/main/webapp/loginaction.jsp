<%@ page import="com.wf.service.IUserService" %>
<%@ page import="com.wf.service.impl.IUserviceImpl" %>
<%@ page import="com.wf.bean.User" %>
<%@ page import="com.wf.service.IProductService" %>
<%@ page import="com.wf.service.impl.IProductServiceImpl" %>
<%@ page import="com.wf.bean.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/14
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    System.out.println(name);
    System.out.println(password);
    IUserService iUserService = new IUserviceImpl();
    User user = iUserService.login(name, password);
    if (user!=null) {
        //登录成功
        //查询product的list放到request范围中
        IProductService productService = new IProductServiceImpl();
        List<Product> all = productService.getAll();
        request.setAttribute("all",all);
        request.getRequestDispatcher("login_suc.jsp").forward(request,response);//另一种请求转发的方式
    }else {
        //登录失败
        String msg = "username or password is wrong";
        response.sendRedirect("login.jsp?msg="+msg);//重定向
    }
%>
</body>
</html>
