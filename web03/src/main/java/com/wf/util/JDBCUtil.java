package com.wf.util;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class JDBCUtil {

    private static Connection connection = null;

    private static PreparedStatement preparedStatement = null;

    private static ResultSet resultSet = null;
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/homework?useUnicode=true&characterEncoding=utf-8";
            String username = "root";
            String password = "wangfei.*0928";
            connection = DriverManager.getConnection(url,username,password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //先封装增删改的通用方法   prepareStatement接口   如果sql有参数  使用的是？ 占位符  没有参数值，需要传过来参数
    public static void doExecute(String sql,Object [] objects) throws Exception {
        preparedStatement = connection.prepareStatement(sql);
        if (objects != null && objects.length > 0){
            //sql中有占位符
            for (int i = 0; i < objects.length; i++) {
                preparedStatement.setObject(i+1,objects[i]);
            }
        }
        preparedStatement.executeUpdate(); //交给数据库执行
    }

    //第三个参数 确定了返回了List的泛型 利用反射
    public static <T> List<T> getAll(String sql, Object[] objects, Class<T> c) throws Exception {
        List<T> list = new ArrayList<>();  //定义一个泛型为T的list
        preparedStatement = connection.prepareStatement(sql);
        if (objects != null && objects.length > 0){
            //sql中有占位符
            for (int i = 0; i < objects.length; i++) {
                preparedStatement.setObject(i+1,objects[i]);
            }
        }
        resultSet = preparedStatement.executeQuery();
        //处理结果集
        while (resultSet.next()){
            //Class<T> c 这里有属性变量
            Field[] fields = c.getDeclaredFields();
//            resultSet.getObject("sno");
//            resultSet.getObject("sname");
//            resultSet.getObject("ssex");
//            resultSet.getObject("sage");

            //for循环走一遍就把一个student的属性值获取一遍 需要有对象存放
            T t = c.newInstance();  //通过反射创建的对象
            for (int i = 0; i < fields.length; i++) {
                Field field = fields[i];  //获取每一个field
                //如果添加了@NOColumn注解，说明不进行result.getObject操作
                if (field.isAnnotationPresent(NoColumn.class)){
                    continue;
                }
                field.setAccessible(true);
                String column = field.getName();   //表中的人字段和实体类中的人属性变量一直
                Object value = resultSet.getObject(column); //获取到值
                field.set(t,value);   //必须是public 才能放进去  将field.setAccessible(true); 就可以放进去
            }
            list.add(t);  //while执行几次，就放入几个对象
        }
        return list;
    }

    //用户名 密码登录
    //根据id查询，都是返回一个对象
    public static <T> T getOne(String sql,Object[] objects,Class<T> c) throws Exception {
        List<T> all = getAll(sql, objects, c);
        if (all != null && all.size() > 0){
            return all.get(0);
        }else {
            return null;
        }

    }

    public static void shutDown() throws Exception{
        //如果只是执行增删改，我们没有resultSet  会报空指针异常
        if (connection !=null){
            connection.close();
        }
        if (preparedStatement!=null){
            preparedStatement.close();
        }
        if (resultSet !=null){
            resultSet.close();
        }
    }
    // 如果使用分组(把整张表)或者查询 的是 一条数据一个字段
    public static Object getGroupMethod(String sql,Object[] objects) throws Exception{
        preparedStatement = connection.prepareStatement(sql);
        if (objects != null && objects.length > 0){
            //sql中有占位符
            for (int i = 0; i < objects.length; i++) {
                preparedStatement.setObject(i+1,objects[i]);
            }
        }
        resultSet = preparedStatement.executeQuery();
        if (resultSet.next()){
            return resultSet.getObject(1);
        }else {
            return null;
        }
    }
}
