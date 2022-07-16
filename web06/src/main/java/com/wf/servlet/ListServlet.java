package com.wf.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@WebServlet("/list")
public class ListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletContext().getRealPath("/img");
        File file = new File(path);
        String [] list = file.list();  //img文件下所有的文件名称
        req.setAttribute("list",list);
        req.getRequestDispatcher("/list.jsp").forward(req,resp);
    }
}
