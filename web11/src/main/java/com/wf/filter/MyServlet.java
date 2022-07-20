package com.wf.filter;

import javax.servlet.*;
import java.io.IOException;

public class MyServlet implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("过滤器1初始化方法执行啦");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("浏览器被过滤器1拦截了");
        filterChain.doFilter(servletRequest, servletResponse);
    }



    @Override
    public void destroy() {
        System.out.println("过滤器1被销毁啦");
    }
}
