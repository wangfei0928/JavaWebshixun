package com.wf.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/list")
public class ListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Object isLogin = req.getSession().getAttribute("isLogin");
        if (isLogin == null) {
            //没有登录成功
            resp.sendRedirect("login.jsp");
        }else {
            System.out.println("要访问数据库获取数据啦");
        }
    }
}
