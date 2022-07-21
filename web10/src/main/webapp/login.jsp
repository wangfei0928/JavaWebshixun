<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/14
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="application/javascript" src="js/jquery.js"></script>
    <script>
        $(function () {
            $("#myform").submit(function () {
                $.ajax({
                    url:"${pageContext.servletContext.contextPath}/login",
                    method:"post",
                    data:$("#myform").serialize(),
                    success:function (d) {
                        if (d == 'ok'){
                            location.href = "login_suc.jsp";
                        }else {
                            alert("用户名或者密码错误，请重新登录");
                        }
                    }
                })
                return false;
            })
        })
    </script>
</head>
<body>
<h1 align="center">欢迎登陆</h1>
<p style="color: red;text-align: center" >${param.msg}</p>
<%
    Cookie[] cookies = request.getCookies();
    String name = "";
    String password = "";
    if (cookies!=null&&cookies.length>0){
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("name")){
                name = cookie.getValue();
            }
            if (cookie.getName().equals("password")){
                password=cookie.getValue();
            }
        }
    }

%>
<form  method="post" id="myform">
  <table align="center">
    <tr>
      <td>用户名:</td>
      <td><input type="text" name="name" value="<%=name%>"></td>
    </tr>
    <tr>
      <td>密码:</td>
      <td><input type="password" name="password" value="<%=password%>"></td>
    </tr>
    <tr>
      <td><input type="checkbox" value="1" name="isRemember">记住我</td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input type="submit" value="登录" style="width: 230px"></td>
    </tr>
  </table>
</form>
</body>
</html>
