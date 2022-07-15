package com.wf.servlet;

import com.wf.bean.Product;
import com.wf.bean.User;
import com.wf.service.IProductService;
import com.wf.service.IUserService;
import com.wf.service.impl.IProductServiceImpl;
import com.wf.service.impl.IUserviceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class LoginServlet extends HttpServlet {
    private IUserService iUserService = new IUserviceImpl();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        String name = req.getParameter("name");
        String password = req.getParameter("password");
        System.out.println(name);
        System.out.println(password);
        try {
            User user = iUserService.login(name, password);
            if (user!=null) {
                //登录成功
                //查询product的list放到request范围中
                IProductService productService = new IProductServiceImpl();
                List<Product> all = productService.getAll();
                req.setAttribute("all",all);
                req.getRequestDispatcher("login_suc.jsp").forward(req,resp);//另一种请求转发的方式
            }else {
                //登录失败
                String msg = "username or password is wrong";
                resp.sendRedirect("login.jsp?msg="+msg);//重定向
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
