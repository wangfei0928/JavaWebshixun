package com.wf.servlet;

import com.wf.util.JDBCUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String name = req.getParameter("productName");
        Double price = Double.valueOf(req.getParameter("productPrice"));
        String img = req.getParameter("productImg");
        String id = req.getParameter("id");
        String sql = "update product set name = ? ,price =?,img=? where id = ?";
        Object [] objects = {name,price,img,id};
        try {
            JDBCUtil.doExecute(sql,objects);
            resp.sendRedirect("list");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
