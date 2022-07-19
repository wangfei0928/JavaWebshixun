<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/19
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="application/javascript" src="js/jquery.js"></script>
    <script>
        var pageNo = 1;
        var pageSize = 5;
        var totalSize;//总数量 需要通过ajax来获取
        var totalPage;//总页数

        //分页公用的方法
        function page(pageNo , pageSize) {
            $.ajax({
                url:"${pageContext.servletContext.contextPath}/proPage",
                data:{pageNo:pageNo,pageSize:pageSize},
                dataType:"json",
                success:function (d) {
                    var $par = $("table");
                    $par.empty();//每次先清空子节点
                    var $first = $("<tr><td>产品编号</td><td>产品名称</td><td>产品价格</td><td>产品图片</td></tr>");
                    $par.append($first);
                    for(var i=0;i<d.length;i++){
                        var pro = d[i];
                        var id = pro.id;
                        var name = pro.name;
                        var price = pro.price;
                        var img = pro.img;

                        var $tr = $("<tr>"+
                            "<td>"+id+"</td>"+
                            "<td>"+name+"</td>"+
                            "<td>"+price+"</td>"+
                            "<td>"+img+"</td>"+
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
                    totalPage = totalSize%pageSize == 0 ? totalSize/pageSize : Math.ceil(totalSize/pageSize);
                    console.log(totalPage);
                }
            });
        });

        function next() {
            if(pageNo != totalPage){
                pageNo = pageNo + 1;
            }

            page(pageNo,pageSize);
        }
    </script>
</head>
<body>
<h1>登录成功</h1>
<table>
    <tr>
        <td>产品编号</td>
        <td>产品名称</td>
        <td>产品价格</td>
        <td>产品图片</td>
        <td>操作</td>
    </tr>
</table>

<button onclick="before()">上一页</button><button onclick="next()">下一页</button>
跳转到<input id="in" type="text"><button onclick="toPage()">跳转</button>
每页显示<select onchange="change(this)">
    <option value="5" ${pageSize==5 ? 'selected' : ''}>5</option>
    <option value="10" ${pageSize==10 ? 'selected' : ''}>10</option>
    <option value="20" ${pageSize==20 ? 'selected' : ''}>20</option>
</select>
</body>
</html>
