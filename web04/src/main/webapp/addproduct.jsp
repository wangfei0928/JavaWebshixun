<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/14
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加页面</title>
</head>
<body>
<h1 align="center">添加商品</h1>
<p style="color: red;text-align: center" >${param.msg}</p>
<form method="post" action="<%=request.getContextPath()%>/add">
<table align="center">
    <tr>
        <td>产品名称</td>
        <td><input type="text" name="productName"></td>
    </tr>
    <tr>
        <td>产品价格</td>
        <td><input type="text" name="productPrice" ></td>
    </tr>
    <tr>
        <td>产品图片</td>
        <td><input type="text" name="productImg"></td>
    </tr>
    <tr>
        <td colspan="2" ><input type="submit" value="提交" style="width: 250px"></td>
    </tr>

</table>
</form>
</body>
</html>
