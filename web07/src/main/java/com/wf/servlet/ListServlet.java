package com.wf.servlet;

import com.wf.bean.Product;
import com.wf.service.ProductService;
import com.wf.service.ProductServiceImpl;

import java.io.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/list")
public class ListServlet extends HttpServlet {

    private ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageNo = req.getParameter("pageNo");
        String pageSize = req.getParameter("pageSize");
        if (pageNo == null || pageNo.equals("")){
            pageNo = "1"; //默认显示第一页
        }
        if (pageSize == null ||pageSize.equals("")){
            pageSize ="5";//每条显示物业
        }
        try {
            List<Product> list = productService.getByPage(Integer.parseInt(pageNo), Integer.parseInt(pageSize));
            req.setAttribute("list",list);
            req.setAttribute("pageNo",pageNo);
            req.setAttribute("pageSize",pageSize);
            //总页数=总数量/每页条数+1
            Long count = productService.getCount();
            Long totalPage = count%5==0 ? count/Integer.parseInt(pageSize) : count/Integer.parseInt(pageSize)+1;
            req.setAttribute("totalPage",totalPage);
            req.getRequestDispatcher("index.jsp").forward(req,resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}