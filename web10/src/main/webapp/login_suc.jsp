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
    <script type="application/javascript" src="js/jquery.js"></script>
    <script>

        var pageNo = 1;
        var pageSize = 5;
        var totalSize;//总数量 需要通过ajax来获取
        var totalPage;//总页数

        function page(pageNo,pageSize) {
            $.ajax({
                url:"${pageContext.servletContext.contextPath}/list",
                data:{pageNo:pageNo,pageSize:pageSize},
                dataType:"json",
                success:function (d) {
                    var $par = $("table");
                    $par.empty();//每次先清空子节点
                    var $first = $("<tr><td>产品编号</td><td>产品名称</td><td>产品价格</td><td>产品图片</td><td>操作</td></tr>");
                    $par.append($first);
                    pageSize = $('#myDlist option:selected').val();
                    for (let i = 0; i < d.length; i++) {
                        var pro = d[i];
                        var id = pro.id;
                        var name = pro.name;
                        var price = pro.price;
                        var proimg = pro.img;
                        // "D:\\JavaProject\\JAVAWEB_sx\\web05\\src\\main\\webapp\\img"
                        var $tr = $("<tr>"+
                            "<td>"+id+"</td>"+
                            "<td>"+name+"</td>"+
                            "<td>"+price+"</td>"+
                            "<td>"+"<img src='img/"+proimg+"' width='100px' height='100px'/>"+"</td>"+
                            "<td><button onclick='updateProduct("+id+","+pageSize+")'>修改</button>"+
                            "<button name='op' value='delete' onclick='deleteProduct("+id+","+pageSize+")' >删除</button>"+
                            "</tr>");
                        $par.append($tr);
                    }
                }
            });
        }


        $(function () {
            //第一次进来默认第一页 每页5条
            page(pageNo,pageSize);

            //再发送一次ajax请求获取总数量
            $.ajax({
                url:"${pageContext.servletContext.contextPath}/getCount",
                success:function (d) {
                    totalSize = d;
                    if (totalSize%pageSize == 0 ){
                        totalPage = totalSize/pageSize;
                    }else {
                        totalPage = Math.ceil((totalSize/pageSize) + 1 );
                    }
                    console.log(totalPage);
                }
            });
        });

        function updateProduct(id,pageSize) {
            location.href="<%=request.getContextPath()%>/updateShow?id="+id+"&&pageSize="+pageSize;
        }
        function deleteProduct(id,pageSize) {
            $.ajax({
                url:"${pageContext.servletContext.contextPath}/product",
                method:"get",
                data: {
                    op:"delete",
                    id:id,
                    pageSize:pageSize
                },
                success:function (c) {
                    location.href="login_suc.jsp?pageNo=1&pageSize="+c;
                }
            })
        }
        function lastPage() {
            pageSize = $('#myDlist option:selected').val();
            pageNo = pageNo - 1;
            if (pageNo <= 1){
                pageNo = 1;
            }
            page(pageNo,pageSize)
        }
        function nextPage() {
            pageSize = $('#myDlist option:selected').val();
            totalPage = Math.ceil((totalSize/pageSize));
            if (pageNo!=totalPage){
                pageNo+=1;
            }
            page(pageNo,pageSize);
        }
        
        function jumpPage() {
            pageSize = $('#myDlist option:selected').val();
            pageNo = document.getElementById("jump").value;
            totalPage = Math.ceil((totalSize/pageSize));
            if (pageNo < 1||pageNo>totalPage){
                alert("请输入1到"+totalPage+"的数字！");
            }else {
                page(pageNo,pageSize);
            }
        }

        function change(o) {
            var pageSize = o.value;
            pageNo = 1;
            page(pageNo,pageSize);
        }
        function loginOut() {
            location.href = "loginOut";
        }
        function insertProduct() {
            pageSize = $('#myDlist option:selected').val();
            location.href = "addproduct.jsp?pageSize="+pageSize;
        }

    </script>
</head>
<body>

<h1 align="center">欢迎${user.uname}来到商品界面</h1>
<p align="right"><button onclick="loginOut()">安全退出</button></p>
<table border="1px" align="center">
    <tr>
        <td>产品编号</td>
        <td>产品名称</td>
        <td>产品价格</td>
        <td>产品图片</td>
        <td>操作</td>
    </tr>
</table>
<p align="center"><button onclick="lastPage()">上一页</button><button onclick="nextPage()">下一页</button></p>
<p align="center">跳转到第<input type="text" id="jump" style="width: 20px">页<button onclick="jumpPage()">点击跳转</button></p>
<p align="center">每页显示
    <select onchange="change(this)" id="myDlist">
        <option value="5"  ${pageSize==5?'selected':''}>5</option>
        <option value="10" ${pageSize==10?'selected':''}>10</option>
        <option value="15" ${pageSize==15?'selected':''}>15</option>
        <option value="20" ${pageSize==20?'selected':''}>20</option>
    </select>条数据
</p>
<p align="center"><button onclick="insertProduct()">新增商品</button></p>

</body>
</html>
