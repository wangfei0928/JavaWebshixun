<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/15
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="application/javascript" src="js/jquery.js"></script>
    <script>
        function addUpdate() {
            location.href = "loginOut";
        }
        $(function () {
            $("#sub_btn").click(function () {
                var productImg = new FormData($("#myform")[0]);
                $.ajax({
                    url:"${pageContext.servletContext.contextPath}/product",
                    type:"post",
                    dataType:"json",
                    data:productImg,
                    cache:false,//是否缓存
                    processData:false,//当设置为false的时候，jquery的ajax提交的时候会序列化data
                    contentType:false,
                    success:function (d) {
                        location.href = "<%=request.getContextPath()%>/login_suc.jsp?pageNo=1&pageSize="+d;

                    }
                })
                return false;
            })
        })
    </script>
</head>
<body>
<h1 align="center">欢迎${user.uname}来到商品更改界面</h1>
<form method="post" action="<%=request.getContextPath()%>/product" enctype="multipart/form-data">
    <input type="hidden" name="op" value="update">
    <input type="hidden" name="id" value="${id}">
    <input type="hidden" name="pageSize" value="<%=request.getParameter("pageSize")%>">
    <p align="right"><button onclick="addUpdate()">退出修改</button></p>
    <table>
        <tr>
            <td>产品名称</td>
            <td><input type="text" name="productName" value="${name}"></td>
        </tr>
        <tr>
            <td>产品价格</td>
            <td><input type="text" name="productPrice" value="${price}"></td>
        </tr>
        <tr>
            <td>产品图片</td>
<%--            <td><input type="text" name="productImg" value="${img}"></td>--%>
            <td><img src="img/${img}"+ width="100px" height="100px" ></td>

            <td><input type="file" name="productImg"></td>
        </tr>
        <tr>
            <td colspan="2" ><input id="sub_btn" type="submit" value="提交" style="width: 250px"></td>
        </tr>
    </table>
</form>
</body>
</html>
