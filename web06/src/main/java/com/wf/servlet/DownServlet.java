package com.wf.servlet;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;

@WebServlet("/down")
public class DownServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String fname =req.getParameter("fname");
        System.out.println(fname);
        String path = req.getServletContext().getRealPath("/img");
        System.out.println(path);
        String fpath = path+"/"+fname;  //文件全路径
        System.out.println(fpath);

        resp.setHeader("Content-Disposition","attachment;filename="+fname);
        FileInputStream fileInputStream = new FileInputStream(fpath);
        int len;
        byte [] buf = new byte[1024];
        ServletOutputStream outputStream = resp.getOutputStream();
        while ((len=fileInputStream.read(buf))!=-1){
            outputStream.write(buf,0,len);
        }
        outputStream.close();
        fileInputStream.close();
    }
}
