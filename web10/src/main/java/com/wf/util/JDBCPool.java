package com.wf.util;

import java.sql.Connection;
import java.sql.DriverManager;


public class JDBCPool {

    public static Connection[] connections = new Connection[5];  //最多能放5个连接

    public static boolean[] allStatus = new boolean[5];   //默认false  fasle代表空闲，true代表使用

//    static {
//        //给connections附上三个初始的连接,因为要求是默认有三个连接
//        for (int i = 0; i < 3; i++) {
//            try {
//                Class.forName("com.mysql.jdbc.Driver");
//                String url = "jdbc:mysql://localhost:3306/homework?useUnicode=true&characterEncoding=utf-8";
//                String username = "root";
//                String password = "wangfei.*0928";
//
//                Connection connection = DriverManager.getConnection(url, username, password);
//                connections[i] =connection;
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//    }

    //从连接池中获取一个连接
    public static Connection getConn() throws Exception {

        int index = -1;  //初始化一个获取连接的索引
        for (int i = 0; i < connections.length; i++) {
            if (allStatus[i] == false){
                index = i;
                break;
            }
        }

        if (index == -1){
            //说明五个连接都在用
            System.out.println("连接池已满！");
        }else {
            //说明连接池中还有可以用的连接
            Connection connection = connections[index];
            allStatus[index] = true; //要把false改成true 说明此连接被使用
            if (connection != null){  //有可能connections中有null
                return  connection;
            }else {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/homework?useUnicode=true&characterEncoding=utf-8";
                String username = "root";
                String password = "wangfei.*0928";
                Connection conn= DriverManager.getConnection(url, username, password);
                connections[index] = conn;
                return conn;
            }
        }
        return null;
    }

    //用完了释放连接 把连接对应
    public static void releaseCon(Connection connection){
        int index = -1;
        for (int i = 0; i < connections.length; i++) {
            if (connections[i] == connection){
                index = i; //得到连接对应的index
                break;
            }
        }

        allStatus[index] = false;
    }
}
