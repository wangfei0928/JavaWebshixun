<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>欢迎来到cookie，浏览器已经放入cookie啦</h1>
<%

    Object isLogin = session.getAttribute("isLogin");
    if (isLogin == null) {
        //没有登录成功
        response.sendRedirect("list");
    }
    Cookie cookie = new Cookie("name","admin"); //新建cookie
    cookie.setMaxAge(60); //指定cookie的有效期
    response.addCookie(cookie);   //把cookie的数据放到客户端



    Cookie cookie1 = new Cookie("password","123");//默认关闭浏览器就没了
    cookie1.setMaxAge(60);

    response.addCookie(cookie1);
%>
</body>
</html>