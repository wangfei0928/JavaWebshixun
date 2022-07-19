<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/19
  Time: 10:26
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
                    url:"${pageContext.servletContext.contextPath}/ajax04",
                    method:"get",
                    data:{id:1,name:"张三"},
                    success: function () {

                    }
                })
            })

        })
    </script>
</head>
<body>
<table>
    <tr>
        <Td>编号</Td>
        <td>姓名</td>
        <td>年龄</td>
    </tr>
</table>
<button id="btn">ajax获取</button>
</body>
</html>
