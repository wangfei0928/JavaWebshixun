<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/13
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
我是01jsp
<%
    String name = "zhangsan";
    String allname = name+"666";
    out.println(allname);
%>
<%=allname%>

<%--定义全局变量--%>
<%!
    public void print11(){
        System.out.println("123");
    }
%>
<%
    print11();
%>
</body>
</html>
