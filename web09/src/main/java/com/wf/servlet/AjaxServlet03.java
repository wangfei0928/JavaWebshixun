package com.wf.servlet;

import com.alibaba.fastjson.JSON;
import com.wf.bean.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ajax03")
public class AjaxServlet03 extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Student s1 = new Student(1,"张三",15);
        Student s2 = new Student(2,"李四",19);

        List<Student> list = new ArrayList<>();
        list.add(s1);
        list.add(s2);
        resp.setCharacterEncoding("utf-8");

        PrintWriter out = resp.getWriter();
        String jsonStr = JSON.toJSONString(list);
        out.write(jsonStr);
        out.flush();
        out.close();
    }




}
