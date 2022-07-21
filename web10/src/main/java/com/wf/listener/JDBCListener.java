package com.wf.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        Connection[] connections = new Connection[5];  //最多能放5个连接
        for (int i = 0; i < 3; i++) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/homework?useUnicode=true&characterEncoding=utf-8";
                String username = "root";
                String password = "wangfei.*0928";

                Connection connection = DriverManager.getConnection(url, username, password);
                connections[i] =connection;
                System.out.println("数据库创建好啦");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
