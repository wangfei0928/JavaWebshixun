<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/16
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/listup" method="post"enctype="multipart/form-data">
    上传图片<input type="file" name="ff"><br>
    <input type="submit" value="上传">
</form>
<c:forEach items="${list}" var="fname">
    <p><a href="<%=request.getContextPath()%>/down?fname=${fname}">${fname}</a></p>
</c:forEach>
</body>
</html>
