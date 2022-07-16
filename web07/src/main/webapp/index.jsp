<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <script>

        function lastPage() {
            var pageNo = ${pageNo};
            var pageSize = ${pageSize};
            pageNo = pageNo-1;
            if (pageNo < 1){
                pageNo =1
            }
            location.href="list?pageNo="+pageNo+"&pageSize="+pageSize;
        }
        function nextPage() {
            var pageNo = ${pageNo};
            var totalPage = ${totalPage};
            var pageSize = ${pageSize};
            if (pageNo!=totalPage){
                pageNo = pageNo+1;
            }
            location.href="list?pageNo="+pageNo+"&pageSize="+pageSize;
        }

        function toPage(){
            var pageSize = ${pageSize};
            var pageNo = document.getElementById("jump").value;
            var totalPage = ${totalPage};
            if (pageNo<1||pageNo>totalPage||pageNo==null){
                alert("请输入1到"+totalPage+"之间的数字");
            }else {
                location.href="list?pageNo="+pageNo+"&pageSize="+pageSize;
            }

        }

        function change(o) {
            // alert(o.value);
            var pageSize = o.value;

            //每次出发这里，让pageNo =1
            location.href = "list?pageNo=1&&pageSize="+pageSize;
        }

    </script>
</head>
<body>
<table>
    <tr>
        <td>编号</td>
        <td>名称</td>
        <td>价格</td>
        <td>图片</td>
    </tr>
    <c:forEach items="${list}" var="pro">
        <tr>
            <td>${pro.id}</td>
            <td>${pro.name}</td>
            <td>${pro.price}</td>
            <td>${pro.img}</td>
        </tr>
    </c:forEach>
</table>
<button onclick=" lastPage()">上一页</button><button onclick="nextPage()">下一页</button><br>
跳转到<input type="text" id="jump"><button onclick="toPage()"> 跳转</button>
每页显示<select onchange="change(this)">
    <option value="5" ${pageSize==5?'selected':''}>5</option>
    <option value="10" ${pageSize==10?'selected':''}>10</option>
    <option value="15" ${pageSize==15?'selected':''}>15</option>
    <option value="20" ${pageSize==20?'selected':''}>20</option>
</select>条数据
</body>
</html>