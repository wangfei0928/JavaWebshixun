package com.wf.servlet;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
//1. 自己写servlet需要实现此接口
//2. 我们要在浏览器中访问servlet 我们要知道url
public class MyServlet implements Servlet {

    public MyServlet(){
        System.out.println("调用创建对象的默认构造方法");
    }
    @Override
    public void init(ServletConfig servletConfig) throws ServletException {
        System.out.println("调用初始化方法");
    }

    @Override
    public ServletConfig getServletConfig() {
        return null;
    }

    @Override
    public void service(ServletRequest servletRequest, ServletResponse servletResponse) throws ServletException, IOException {
        //默认走进service方法中
        System.out.println("hello servlet");
        ServletOutputStream out = servletResponse.getOutputStream();
        out.print("<html>\n");
        out.print("<head>\n");
        out.print("    <title>JSP - Hello World</title>\n");
        out.print("</head>\n");
        out.print("<body>\n");
        out.print("<h1>");
        out.print( "Hello World!" );
        out.print("\n");
        out.print("</h1>\n");
        out.print("<br/>\n");
        out.print("<a href=\"hello-servlet\">Hello Servlet</a>\n");
        out.print("</body>\n");
        out.print("</html>");

    }

    @Override
    public String getServletInfo() {
        return null;
    }

    @Override
    public void destroy() {
        System.out.println("调用销毁方法");
    }
}
