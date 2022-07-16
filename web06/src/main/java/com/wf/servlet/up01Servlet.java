package com.wf.servlet;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet("/up01")
public class up01Servlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
//        upload.setFileSizeMax(1024*1024);//指定上传文件的大小
        try{
            List<FileItem> items = upload.parseRequest(req);
            for (FileItem item : items) {
                //如果这个返回 的是true  非文件上传字段
                if (item.isFormField()){  //判断是否是文件
                    //不是文件的上传字段

                }else {
                    //是文件的item
                    File file = new File("D:/upload02/"+item.getName()); //指定文件的上传位置
                    item.write(file);
                }
            }
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
