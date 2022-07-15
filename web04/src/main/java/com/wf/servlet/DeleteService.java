package com.wf.servlet;

import com.wf.util.JDBCUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteService extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id =req.getParameter("id");
        String sql = "delete from product where id = ?";
        Object[] objects = {id};
        try {
            JDBCUtil.doExecute(sql,objects);
            resp.sendRedirect("list");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
