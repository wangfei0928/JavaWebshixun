package com.wf.servlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Enumeration;

public class MyServlet2 extends HttpServlet {

   /* @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String initParameter = getInitParameter("address"); //获取servlet初始值，在web.xml中配置
        System.out.println(initParameter);
        String servletName = getServletName();  //获取servlet的name
        System.out.println(servletName);
        ServletContext servletContext = getServletContext();//得到application对象
        System.out.println(servletContext);
        Enumeration<String> initParameterNames = getInitParameterNames();
        System.out.println(initParameterNames);
        super.service(req, resp);
    }*/

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("我是doGet方法");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
