<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/19
  Time: 10:35
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

                // var name = $("input")[0].value;
                // var password = $("input")[1].value;

                $.ajax({
                    url:"${pageContext.servletContext.contextPath}/login",
                    // dataType:"json",
                    data:$("#myform").serialize(),  //是上一种方式的简写
                    method:"get",
                    success:function (d) {
                        if (d=='ok'){
                            location.href = "list.jsp";
                        }else {
                            alert("用户名或者密码错误");
                        }
                    }
                });
                return false;
            })
        })
    </script>
</head>
<body>
<form method="post" action="" id="myform">
    <table>
        <tr>
            <td>用户名</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input type="password" name="password"></td>
        </tr>
        <tr>
            <td><input type="submit" value="登录"></td>
        </tr>
    </table>
</form>
</body>
</html>
