package com.wf.servlet;

import com.alibaba.fastjson.JSON;
import com.wf.bean.Product;
import com.wf.service.IProductService;
import com.wf.service.impl.IProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/proPage")
public class ProductPageServlet extends HttpServlet{

    private IProductService productService = new IProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String pageNo = req.getParameter("pageNo");
        String pageSize = req.getParameter("pageSize");
        try {
            List<Product> all = productService.getByPage(Integer.parseInt(pageNo), Integer.parseInt(pageSize));

            resp.setContentType("text/html;charset=utf-8");
            PrintWriter out = resp.getWriter();
            String jsonStr = JSON.toJSONString(all);
            System.out.println(jsonStr);
            out.write(jsonStr);//需要是json格式的字符串
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}

