<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/14
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  pageContext.setAttribute("abc","page");
  request.setAttribute("abc","request");
  session.setAttribute("abc","session");
  application.setAttribute("abc","application");

  String [] names = {"张三","李四","王五"};

    List list = new ArrayList<>();
    list.add("hello");
    list.add("world");
    list.add("lanou");
    request.setAttribute("list",list);
  request.setAttribute("names",names);
    Map<String,String> map= new HashMap<>();
    map.put("name","李思思");
    map.put("sex","18");
    map.put("sex","女");
    request.setAttribute("maps",map);
%>
${pageScope.abc}<br>
${requestScope.abc}<br>
${sessionScope.abc}<br>
${applicationScope.abc}<br>

${abc};<br>
${names[0]}<br>
${list[2]}<br>
${maps.name}
</body>
</html>
