<%@ page import="com.example.web02.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/14
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Student s1 = new Student(1,"lisi");
    Student s2 = new Student(2,"wangwu");
    Student s3 = new Student(3,"zhaoliu");
    List<Student> students = new ArrayList<>();
    students.add(s1);
    students.add(s2);
    students.add(s3);
    request.setAttribute("students",students);
%>
<c:forEach items="${students}" var="stu">
    <p>学号:${stu.id}-----姓名:${stu.name}</p>
</c:forEach>
<c:forTokens items="zhangsan=lisi=wangwu" delims="=" var="name">
    ${name}<br>
</c:forTokens>
</body>
</html>
