package com.wf.servlet;

import com.wf.service.IProductService;
import com.wf.service.impl.IProductServiceImpl;
import com.wf.util.JDBCUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
@MultipartConfig()
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        String name = req.getParameter("productName");
        String price =req.getParameter("productPrice");
        String pageSize = req.getParameter("pageSize");
//        String img = req.getParameter("productImg");

        Part part = req.getPart("productImg");
        String img = part.getSubmittedFileName();//获取文件(图片)名称
        System.out.println(img);

        IProductService iProductService = new IProductServiceImpl();
        String id = req.getParameter("id");

        try {
            iProductService.updateProduct(Integer.valueOf(id),name,Double.valueOf(price),img);
            String path = "D:\\JavaProject\\JAVAWEB_sx\\web05\\src\\main\\webapp\\img";
            System.out.println(path);

            part.write(path+"/"+img);
            resp.sendRedirect("list?pageSize="+pageSize);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


}
