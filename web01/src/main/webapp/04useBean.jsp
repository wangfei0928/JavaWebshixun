<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/13
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--Student stu = new Student()--%>
<jsp:useBean id="stu" class="com.wf.web01.Student" scope="request"></jsp:useBean>
<%--stu.setName("张三")--%>
<jsp:setProperty name="stu" property="name" value="张三"></jsp:setProperty>
<%--out.print(stu.getName());--%>
<jsp:getProperty name="stu" property="name"/>

</body>
</html>
