package com.wf.servlet;

import com.wf.service.IProductService;
import com.wf.service.impl.IProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/getCount")
public class ProductCountServlet extends HttpServlet {

    private IProductService productService = new IProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            Long count = productService.getCount();
            PrintWriter out = resp.getWriter();
            out.write(count+"");
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
