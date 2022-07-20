package com.wf.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String password = req.getParameter("password");
        System.out.println(name+"----"+password);

        if (name.equals("admin")&&password.equals("123")){
            req.getSession().setAttribute("isLogin","ok");
            req.getRequestDispatcher("list.jsp").forward(req,resp);
        }else {

            resp.sendRedirect("login.jsp");
        }

    }
}
