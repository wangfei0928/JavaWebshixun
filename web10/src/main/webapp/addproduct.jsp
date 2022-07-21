<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/14
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加页面</title>
    <script type="application/javascript" src="js/jquery.js"></script>
    <script>
        function addOut() {
            location.href = "list";
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
                        // $(window).attr("location","http://localhost:8080/web10/login_suc.jsp?pageNo=1&pageSize="+d);
                        location.href = "<%=request.getContextPath()%>/login_suc.jsp?pageNo=1&pageSize="+d;
                    }
                })
                return false;
            })
        })

    </script>
</head>
<body>
<h1 align="center">添加商品</h1>
<h2 align="center">欢迎${user.uname}来到商品添加界面</h2>
<p align="right"><button onclick="addOut()">退出增加</button></p>
<p style="color: red;text-align: center" >${param.msg}</p>
<form method="post" id="myform" enctype="multipart/form-data">
    <input type="hidden" name="op" value="add">
    <input type="hidden" name="pageSize" value="<%=request.getParameter("pageSize")%>">
<table align="center">
    <tr>
        <td>产品名称</td>
        <td><input type="text" name="productName"></td>
    </tr>
    <tr>
        <td>产品价格</td>
        <td><input type="text" name="productPrice" ></td>
    </tr>
    <tr>
        <td>产品图片</td>
        <td><input type="file" name="productImg"></td>
    </tr>
    <tr>
        <td colspan="2" ><input id="sub_btn" type="button" value="提交" style="width: 250px"></td>
    </tr>

</table>
</form>
</body>
</html>
