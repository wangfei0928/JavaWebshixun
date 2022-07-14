<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/14
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:out value="zhangsan"></c:out><br>
<c:set var="name" value="lisi" scope="request"></c:set>
<%--<c:remove var="name" scope="request"></c:remove>--%>
${requestScope.name}<br>

<c:if test="${param.id>10}">
    <h1>你好啊</h1>
</c:if>
<c:if test="${name=='lisi' }">
    <h2>名字很对</h2>
</c:if>

<c:choose>
    <c:when test="${param.id==2}">
        <p>我是二号</p>
    </c:when>
    <c:when test="${param.id==3}">
        <p>我是3号</p>
    </c:when>
    <c:otherwise>
        <p>我是其他号码啊</p>
    </c:otherwise>
</c:choose>


<%
    List<String> list = new ArrayList<>();
    list.add("hellow");
    list.add("world");
    list.add("lanou");
    request.setAttribute("list",list);
%>
<c:forEach items="${list}" var="n">
    <p>${n}</p>
</c:forEach>
</body>
</html>
