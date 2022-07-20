package com.wf.filter;

import com.sun.xml.internal.bind.v2.model.core.EnumLeafInfo;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        Object isLogin =req.getSession().getAttribute("isLogin");
        String requestURI = req.getRequestURI();

        if (isLogin != null){
            filterChain.doFilter(req,resp);
        }else {
            if (requestURI.contains("login")||requestURI.contains("css")||requestURI.contains("js")||requestURI.contains("img")){
                filterChain.doFilter(req,resp);
            }else {
                resp.sendRedirect("login.jsp");
            }
        }
    }

    @Override
    public void destroy() {

    }
}
