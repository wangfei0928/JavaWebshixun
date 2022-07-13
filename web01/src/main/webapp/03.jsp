<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/13
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <style>
    div{
      width: 200px;
      height: 200px;
        background-color: red;
    }
  </style>
</head>
<body>
<%@include file="01.jsp"%>   <%--包含另外一个jsp的内容进来--%>
<jsp:include page="01.jsp"></jsp:include>

<div></div>
</body>
</html>
