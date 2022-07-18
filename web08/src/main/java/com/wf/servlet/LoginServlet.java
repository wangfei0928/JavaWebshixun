package com.wf.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name =req.getParameter("name");
        String password = req.getParameter("password");
        String isRem = req.getParameter("isRem");

        if (name.equals("admin")&&password.equals("123")){

            //登录成功，向session里添加一个登录标识
            req.getSession().setAttribute("isLogin","1");


            /**
             * 处理cookie的
             */
            if (isRem!=null&&isRem.equals("1")){  //设置cookie
                Cookie c1 = new Cookie("name",name);
                Cookie c2 = new Cookie("password",password);
                c1.setMaxAge(60 * 2); //默认时间两分钟
                c2.setMaxAge(60 * 2);
                resp.addCookie(c1);
                resp.addCookie(c2);
            }else {
                Cookie[] cookies = req.getCookies();
                if (cookies!=null&&cookies.length>0){
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("name")||cookie.getName().equals("password")){
                            cookie.setMaxAge(0);
                            resp.addCookie(cookie);  //取消cookie
                        }

                    }
                }
            }
            req.getRequestDispatcher("success.jsp").forward(req,resp);
        }
    }
}
