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

public class addServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String productName = req.getParameter("productName");
        Double productPrice = Double.valueOf(req.getParameter("productPrice"));
        String productImg = req.getParameter("productImg");
        IProductService iProductService = new IProductServiceImpl();
        System.out.println(productName);
        System.out.println(productPrice);
        System.out.println(productImg);
        if (productName!=null&&productPrice!=null&&productImg!=null){
            try {
                iProductService.addProduct(productName,productPrice,productImg);
//                List<Product> all = iProductService.getAll();
                //重定向一个servlet跳板
                resp.sendRedirect("list");
//                req.getSession().setAttribute("all",all); //不建议这么使用
//                resp.setHeader("refresh", "1;url=login_suc.jsp");
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }else {
            String msg = "Your input is wrong";
            resp.sendRedirect("addproduct.jsp?msg="+msg);
        }
    }
}
