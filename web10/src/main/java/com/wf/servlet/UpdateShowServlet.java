package com.wf.servlet;

import com.wf.bean.Product;
import com.wf.util.JDBCUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateShowServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");
        String pageSize = req.getParameter("pageSize");

        String sql = "select * from product where id = ?";
        Object [] objects = {id};
        try {
            Product product = JDBCUtil.getOne(sql, objects, Product.class);
            System.out.println(product);
            req.setAttribute("id",id);
            req.setAttribute("name",product.getName());
            req.setAttribute("price",product.getPrice());
            req.setAttribute("img",product.getImg());
            req.getRequestDispatcher("updateProduct.jsp").forward(req,resp);
//            resp.sendRedirect("update?pageSize="+pageSize);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
