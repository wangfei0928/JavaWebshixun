<%@ page import="java.util.Random" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/13
  Time: 18:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--使用JSP技术在网页上展示一个九九乘法表的效果， 要求每个格子颜色随机--%>
</head>
<body>
<table>
    <%
        for (int i = 1; i < 10; i++) {
    %>
        <tr>
    <%
         for(int j=1;j<=i;j++){
             Random random = new Random();
             int r = random.nextInt(256);
             int g = random.nextInt(256);
             int b = random.nextInt(256);
             //给每一个单元格添加随机颜色
             out.print("<td style='background-color: rgb("+r+","+g+"," +b+" );'>"+j+"*"+i+"="+i*j+"</td>");
         %>
        <%
        }
    %>

</table>
</body>
</html>
