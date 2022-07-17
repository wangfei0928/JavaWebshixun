<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/14
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>Title</title>
    <script>
        function updateProduct(id,pageSize) {
            // location.href="updateProduct.jsp?id="+id;
            location.href="<%=request.getContextPath()%>/updateShow?id="+id+"&&pageSize="+pageSize;
        }
        function deleteProduct(id,pageSize) {
            location.href="<%=request.getContextPath()%>/delete?id="+id+"&&pageSize="+pageSize;
        }
        function lastPage() {
            var pageSize = ${pageSize};
            var pageNo = ${pageNo};
            pageNo = pageNo - 1;
            if (pageNo <= 1){
                pageNo = 1;
            }
            location.href="<%=request.getContextPath()%>/list?pageNo="+pageNo+"&&pageSize="+pageSize;
        }
        function nextPage() {
            var pageSize = ${pageSize};
            var pageNo = ${pageNo};
            var pageTotal = ${pageTotal}
            if (pageNo != pageTotal){
                pageNo = pageNo + 1;
            }
            location.href="<%=request.getContextPath()%>/list?pageNo="+pageNo+"&&pageSize="+pageSize;
        }
        
        function jumpPage() {
            var pageSize = ${pageSize}
            var pageTotal = ${pageTotal};
            var pageNo = document.getElementById("jump").value;
            if (pageNo < 1||pageNo>pageTotal){
                alert("请输入1到"+pageTotal+"的数字！");
            }else {
                location.href = "<%=request.getContextPath()%>/list?pageNo="+pageNo+"&&pageSize="+pageSize;
            }
        }

        function change(o) {
            var pageSize = o.value;

            //每次出发这里，让pageNo =1
            location.href = "list?pageNo=1&&pageSize="+pageSize+"&&pageNo=1";
        }
    </script>
</head>
<body>
<h1 align="center">欢迎来到商品界面</h1>
<table border="1px" align="center">
    <tr>
        <td>产品编号</td>
        <td>产品名称</td>
        <td>产品价格</td>
        <td>产品图片</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${list}" var="pro">
        <tr>
            <td>${pro.id}</td>
            <td>${pro.name}</td>
            <td>${pro.price}</td>
            <td><img src="img/${pro.img}" width="100px" height="100px"></td>
            <td><button onclick="updateProduct('${pro.id}','${pageSize}')">修改</button>
                <button onclick="deleteProduct('${pro.id}','${pageSize}')">删除</button></td>
        </tr>
    </c:forEach>
</table>
<p align="center"><button onclick="lastPage()">上一页</button><button onclick="nextPage()">下一页</button></p>
<p align="center">跳转到第<input type="text" id="jump" style="width: 20px">页<button onclick="jumpPage()">点击跳转</button></p>
<p align="center">每页显示
    <select onchange="change(this)">
        <option value="5"  ${pageSize==5?'selected':''}>5</option>
        <option value="10" ${pageSize==10?'selected':''}>10</option>
        <option value="15" ${pageSize==15?'selected':''}>15</option>
        <option value="20" ${pageSize==20?'selected':''}>20</option>
    </select>条数据
</p>
<p align="center"><a href="addproduct.jsp" style="text-decoration: none" >新增商品</a></p>

</body>
</html>
