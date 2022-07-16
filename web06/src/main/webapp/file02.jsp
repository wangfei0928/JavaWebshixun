<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/16
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/up02" enctype="multipart/form-data" method="post">
    名称:<input type="text" name="uname"><br>
    上传图片<input type="file" name="ff"><br>
    <input type="submit" value="上传">
</form>
</body>
</html>
