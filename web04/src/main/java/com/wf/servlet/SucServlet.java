package com.wf.servlet;

import com.wf.bean.Product;
import com.wf.service.IProductService;
import com.wf.service.impl.IProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class SucServlet extends HttpServlet {

    private IProductService productService = new IProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            List<Product> all = productService.getAll();
            req.setAttribute("all",all);
            req.getRequestDispatcher("login_suc.jsp").forward(req,resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
