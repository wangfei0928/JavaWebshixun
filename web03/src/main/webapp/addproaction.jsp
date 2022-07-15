<%@ page import="com.wf.service.IProductService" %>
<%@ page import="com.wf.service.impl.IProductServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/14
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String productName = request.getParameter("productName");
    Double productPrice = Double.valueOf(request.getParameter("productPrice"));
    String productImg = request.getParameter("productImg");
    IProductService iProductService = new IProductServiceImpl();
    System.out.println(productName);
    System.out.println(productPrice);
    System.out.println(productImg);
    if (productName!=null&&productPrice!=null&&productImg!=null){
        iProductService.addProduct(productName,productPrice,productImg);
        response.setHeader("refresh", "5;url=login_suc.jsp");
    }else {
        String msg = "Your input is wrong";
        response.sendRedirect("addproduct.jsp?msg="+msg);
    }
%>
</body>
</html>
