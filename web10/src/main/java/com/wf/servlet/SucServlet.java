package com.wf.servlet;

import com.alibaba.fastjson.JSON;
import com.wf.bean.Product;
import com.wf.service.IProductService;
import com.wf.service.impl.IProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class SucServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {

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

            resp.setContentType("text/html;charset=utf-8");

            PrintWriter out = resp.getWriter();
            String jsonStr = JSON.toJSONString(list);
            System.out.println(jsonStr);
            out.write(jsonStr);//需要是json格式的字符串
            out.flush();
            out.close();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
