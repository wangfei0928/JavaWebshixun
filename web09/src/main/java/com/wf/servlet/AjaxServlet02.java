package com.wf.servlet;

import com.wf.bean.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ajax02")
public class AjaxServlet02 extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Student s = new Student(001,"张三",18);
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        String jsonStr = "{\"id\":"+s.getId()+","+"name":\"张三\",\"age\":12}";
        out.write();
        out.flush();
        out.close();
    }
}
