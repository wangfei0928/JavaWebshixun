package com.wf.servlet;

import com.wf.bean.User;
import com.wf.service.IUserService;
import com.wf.service.impl.IUserviceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginServlet extends HttpServlet {
    private IUserService iUserService = new IUserviceImpl();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String password = req.getParameter("password");
        String isRemember = req.getParameter("isRemember");
        PrintWriter out = resp.getWriter();
        try {
            User user = iUserService.login(name, password);
            if (user!=null) {
                //登录成功

                //设置session
                req.getSession().setAttribute("user",user);
//                req.getSession().setAttribute("isLogin","ok");

                //设置记住密码的cookie
                if (isRemember!=null && isRemember.equals("1")){
                    Cookie c1 = new Cookie("name",name);
                    Cookie c2 = new Cookie("password",password);
                    c1.setMaxAge(60*2);
                    c2.setMaxAge(60*2);
                    resp.addCookie(c1);
                    resp.addCookie(c2);
                }else {
                    Cookie[] cookies = req.getCookies();
                    if (cookies!=null&&cookies.length>0){
                        for (Cookie cookie : cookies) {
                            if (cookie.getName().equals("name")||cookie.getName().equals("password")){
                                cookie.setMaxAge(0);
                                resp.addCookie(cookie);
                            }
                        }
                    }
                }

                out.write("ok");
            }else {
                //登录失败
                out.write("no");
            }
            out.flush();
            out.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
