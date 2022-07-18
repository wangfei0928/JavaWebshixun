<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/18
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        function loginOut() {
            location.href = "loginOut";
        }
    </script>
</head>
<body>
<%
    Object isLogin = session.getAttribute("isLogin");
    if (isLogin == null){
        //没有登录成功
        response.sendRedirect("login.jsp");
    }
%>
登陆成功
<button onclick="loginOut()">安全退出</button>
</body>
</html>
