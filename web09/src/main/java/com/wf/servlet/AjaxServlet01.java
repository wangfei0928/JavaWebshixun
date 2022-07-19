package com.wf.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ajax01")
public class AjaxServlet01 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String str = "大家好！";
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        out.write(str);
        out.flush();
        out.close();
    }
}
