package com.wf.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String password = req.getParameter("password");
        System.out.println(name);
        System.out.println(password);

        PrintWriter out = resp.getWriter();
        if (name.equals("zhangsan")&&password.equals("123")){
            out.write("ok");
        }else {
            out.write("wrong");
        }
        out.flush();
        out.close();
    }
}
