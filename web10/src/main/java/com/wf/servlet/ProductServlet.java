package com.wf.servlet;

import com.wf.service.IProductService;
import com.wf.service.impl.IProductServiceImpl;
import com.wf.util.JDBCUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

@MultipartConfig()
@WebServlet("/product")
public class ProductServlet extends HttpServlet {

    private IProductService productService = new IProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String op = req.getParameter("op");

        if (op.equals("delete")){
            String pageSize = req.getParameter("pageSize");
            Integer id = Integer.parseInt(req.getParameter("id"));
            System.out.println(id);
            String sql = "delete from product where id = ?";
            Object[] objects = {id};
            try {
                JDBCUtil.doExecute(sql,objects);
                PrintWriter out = resp.getWriter();
                out.write(pageSize);
                out.flush();
                out.close();

            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String op = req.getParameter("op");

        if (op.equals("add")){
            String productName = req.getParameter("productName");
            String productPrice = req.getParameter("productPrice");
            String pageSize = req.getParameter("pageSize");
            Part part = req.getPart("productImg");
            if (productName!=null&&productPrice!=null&&part!=null){

                String img = part.getSubmittedFileName();//????????????(??????)??????
                String suffix = img.substring(img.lastIndexOf(".")); // ????????????????????????
                System.out.println("???????????????:"+suffix);

                String uuid = UUID.randomUUID().toString();
                String newImg = uuid + suffix; //???????????????
                System.out.println(newImg);
                IProductService iProductService = new IProductServiceImpl();

                try {
                    //1. ???????????????
                    iProductService.addProduct(productName,Double.parseDouble(productPrice),newImg);

                    //2. ????????????
//                String path = req.getServletContext().getRealPath("/img");
                    String path = "D:\\JavaProject\\JAVAWEB_sx\\web10\\src\\main\\webapp\\img";
                    System.out.println(path);
                    File file = new File(path);
                    if (!file.exists()){
                        file.mkdir(); //????????????
                    }
                    part.write(path+"/"+newImg);

                    PrintWriter out = resp.getWriter();

                    out.write(pageSize);
                    out.flush();
                    out.close();
                    //???????????????servlet??????
//                resp.sendRedirect("list");

                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            }else {
                String msg = "Your input is wrong";
                resp.sendRedirect("addproduct.jsp?msg="+msg);
            }
        }



        if (op.equals("update")){

            String productName = req.getParameter("productName");
            String productPrice =req.getParameter("productPrice");
            String pageSize = req.getParameter("pageSize");

            Part part = req.getPart("productImg");
            if (productName!=null&&productPrice!=null&&part!=null){
                String img = part.getSubmittedFileName();//????????????(??????)??????

                String suffix = img.substring(img.lastIndexOf(".")); // ????????????????????????
                System.out.println("???????????????:"+suffix);

                String uuid = UUID.randomUUID().toString();
                String newImg = uuid + suffix; //???????????????
                System.out.println(newImg);

                IProductService iProductService = new IProductServiceImpl();
                String id = req.getParameter("id");
                try {
                    iProductService.updateProduct(Integer.valueOf(id),productName,Double.valueOf(productPrice),newImg);
                    String path = "D:\\JavaProject\\JAVAWEB_sx\\web10\\src\\main\\webapp\\img";
                    System.out.println(path);
                    part.write(path+"/"+newImg);
                    PrintWriter out = resp.getWriter();
                    out.write(pageSize);
                    out.flush();
                    out.close();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            }
        }
    }
}
