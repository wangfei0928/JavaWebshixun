<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/19
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="application/javascript" src="js/jquery.js"></script>
    <script>
        $(function () {
            $("#btn").click(function () {
                $.ajax({
                    url:"${pageContext.servletContext.contextPath}/ajax02",
                    method:"post",
                    dataType:"json",
                    success:function (data) {
                        var id = data.id;
                        var name = data.name;
                        var age = data.age;
                        $("input")[0].value = id;
                        $("input")[1].value = name;
                        $("input")[2].value = age;

                    }
                })
            })
        })
    </script>
</head>
<body>
<form>
    <table>
        <tr>
            <td>编号</td>
            <td><input type="text"></td>
        </tr>
        <tr>
            <td>姓名</td>
            <td><input type="text"></td>
        </tr>
        <tr>
            <td>年龄</td>
            <td><input type="text"></td>
        </tr>
    </table>
</form>
<button id="btn">ajax获取</button>

</body>
</html>
