package com.wf.filter;

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
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        Object isLogin = request.getSession().getAttribute("user");

        String requestURI = request.getRequestURI();
        System.out.println(requestURI);
        if (isLogin != null){
            filterChain.doFilter(request,response);
        }else {
            if (requestURI.contains("login")||requestURI.contains("css")||requestURI.contains("img")){
                filterChain.doFilter(request,response);
            }else {
                response.sendRedirect("/error.jsp");
            }
        }
    }

    @Override
    public void destroy() {

    }
}
