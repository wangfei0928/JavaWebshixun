<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <script type="application/javascript" src="js/jquery.js"></script>
    <script>
        $(function () {
            $("#btn").click(function () {
                $.ajax({
                    url:"${pageContext.servletContext.contextPath}/ajax01",
                    success:function (d) {
                        $("#dd").text(d);
                    }
                });
            });
        });
    </script>
</head>
<body>
<div id="dd">
    <button id="btn">ajax获取</button>
</div>
</body>
</html>