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
            /*List<Product> all = productService.getAll();
            req.setAttribute("all",all);*/
            IProductService productService = new IProductServiceImpl();
            String pageNo = req.getParameter("pageNo");
            String pageSize = req.getParameter("pageSize");
            if (pageNo == null || pageNo.equals("")){
                pageNo = "1"; //默认显示第一页
            }
            if (pageSize ==null|| pageSize.equals("")){
                pageSize = "5";
            }
            List<Product> list = productService.getByPage(Integer.parseInt(pageNo), Integer.parseInt(pageSize));
            req.setAttribute("list",list);
            req.setAttribute("pageNo",pageNo);
            req.setAttribute("pageSize",pageSize);
            Long count = productService.getCount();
            Long pageTotal = 0L;
            if (count%Integer.parseInt(pageSize)==0){
                pageTotal = count/Integer.parseInt(pageSize);
            }else {
                pageTotal = count/Integer.parseInt(pageSize)+1;
            }
            req.setAttribute("pageTotal",pageTotal);
            req.setAttribute("count",count);
            req.getRequestDispatcher("login_suc.jsp").forward(req,resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
