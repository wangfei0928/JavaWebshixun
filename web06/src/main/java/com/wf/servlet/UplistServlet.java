package com.wf.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@WebServlet("/listup")
@MultipartConfig()
public class UplistServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        Part part = req.getPart("ff");
        String fname = part.getSubmittedFileName();
        String path =req.getServletContext().getRealPath("/img");
        part.write(path+"/"+fname);
        resp.sendRedirect("list");
    }
}
