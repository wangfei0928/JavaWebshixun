package com.wf.servlet;

import com.wf.service.IProductService;
import com.wf.service.impl.IProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@MultipartConfig()
public class addServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String productName = req.getParameter("productName");
        Double productPrice = Double.valueOf(req.getParameter("productPrice"));
//        String productImg = req.getParameter("productImg");

        Part part = req.getPart("productImg");
        String img = part.getSubmittedFileName();//获取文件(图片)名称
        System.out.println(img);
        IProductService iProductService = new IProductServiceImpl();

        if (productName!=null&&productPrice!=null&&part!=null){
            try {
                //1. 把数据入库
                iProductService.addProduct(productName,productPrice,img);
                //2. 上传图片
//                String path = req.getServletContext().getRealPath("/img");
                String path = "D:\\JavaProject\\JAVAWEB_sx\\web05\\src\\main\\webapp\\img";
                System.out.println(path);
                File file = new File(path);
                if (!file.exists()){
                    file.mkdir(); //创建目录
                }
                part.write(path+"/"+img);

                //重定向一个servlet跳板
                resp.sendRedirect("list");
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
