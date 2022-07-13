<%--
  Created by IntelliJ IDEA.
  User: 王斐
  Date: 2022/7/13
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    public int sum(int m) {
        if(m==1){
            return 1;
        }
        return m+sum(m-1);
    }
%>

<%!
    int year = 2000;
    public void isLeapYear(){
        if (year%4==0&&year%100!=0||year%400==0){
           System.out.println("是闰年");
        }else {
            System.out.println("不是闰年");
        }
    }
%>
<%
    isLeapYear();
    int sum = sum(100);
%>
<%=sum%>
</body>
</html>
