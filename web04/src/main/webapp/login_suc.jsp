<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/14
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>Title</title>
    <script>
        function updateProduct(id) {
            // location.href="updateProduct.jsp?id="+id;
            location.href="<%=request.getContextPath()%>/updateShow?id="+id;
        }
        function deleteProduct(id) {
            location.href="<%=request.getContextPath()%>/delete?id="+id;
        }
    </script>
</head>
<body>
<h1 align="center">欢迎来到商品界面</h1>
<table border="1px" align="center">
    <tr>
        <td>产品编号</td>
        <td>产品名称</td>
        <td>产品价格</td>
        <td>产品图片</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${all}" var="pro">
        <tr>
            <td>${pro.id}</td>
            <td>${pro.name}</td>
            <td>${pro.price}</td>
            <td>${pro.img}</td>
            <td><button onclick="updateProduct('${pro.id}')">修改</button><button onclick="deleteProduct('${pro.id}')">删除</button></td>
        </tr>
    </c:forEach>
</table>
<p align="center"><a href="addproduct.jsp" style="text-decoration: none" >新增商品</a></p>

</body>
</html>
