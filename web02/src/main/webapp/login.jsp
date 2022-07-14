<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/14
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="loginaction.jsp" method="get">
    <table>
        <tr>
            <td>用户名</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>爱好</td>
            <td>
                <input type="checkbox" name="hobby" value="basketball">篮球
                <input type="checkbox" name="hobby" value="football">足球
                <input type="checkbox" name="hobby" value="pingpong">篮球
            </td>
        </tr>
        <tr>
            <td>学历</td>
            <td>
                <input type="radio" name="sex" value="本科">本科
                <input type="radio" name="sex" value="专科">专科
            </td>
        </tr>
        <tr>
            <td><input type="submit" value="提交"></td>
        </tr>
    </table>
</form>
</body>
</html>
