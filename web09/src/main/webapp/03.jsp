<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/19
  Time: 9:31
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
                    url:"${pageContext.servletContext.contextPath}/ajax03",
                    method:"post",
                    dataType:"json",
                    success:function (d) {

                        var $par = $("table")
                        for (let i = 0; i < d.length; i++) {
                            var stu = d[i];
                            var id = stu.id;
                            var name = stu.name;
                            var age = stu.age;
                            var $tr = $("<tr><td>"+id+"</td><td>"+name+"</td><td>"+age+"</td></tr>");
                            $par.append($tr);
                        }
                    }
                });
            });
        });
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
