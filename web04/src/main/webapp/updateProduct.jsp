<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/15
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="<%=request.getContextPath()%>/update">
    <input type="hidden" name="id" value="${id}">
    <table>
        <tr>
            <td>产品名称</td>
            <td><input type="text" name="productName" value="${name}"></td>
        </tr>
        <tr>
            <td>产品价格</td>
            <td><input type="text" name="productPrice" value="${price}"></td>
        </tr>
        <tr>
            <td>产品图片</td>
            <td><input type="text" name="productImg" value="${img}"></td>
        </tr>
        <tr>
            <td colspan="2" ><input type="submit" value="提交" style="width: 250px"></td>
        </tr>
    </table>
</form>
</body>
</html>
