package com.wf.dao.impl;

import com.wf.bean.Product;
import com.wf.dao.IProductDao;
import com.wf.util.JDBCUtil;

import java.util.List;

public class IProductDaoImpl implements IProductDao {
    @Override
    public List<Product> getAll() throws Exception {
        String sql = "select * from product";
        return JDBCUtil.getAll(sql,null,Product.class);
    }

    @Override
    public void addProduct(String name,Double price,String img) throws Exception {
        String sql = "insert into product(name,price,img) values(?,?,?)";
        Object [] objects = {name,price,img};
        JDBCUtil.doExecute(sql,objects);
    }

    @Override
    public void updateProduct(Integer id, String name, Double price, String img) throws Exception {
        String sql = "update product set name=?,price=?,img=? where id=?";
        Object[] objects={name,price,img,id};
        JDBCUtil.doExecute(sql,objects);
    }

    @Override
    public List<Product> getByPage(Integer pageNo, Integer pageSize) throws Exception {
        String sql = "select * from product limit ?,?";
        Object [] objects = {(pageNo-1)*pageSize,pageSize};
        return JDBCUtil.getAll(sql,objects,Product.class);
    }

    @Override
    public Long getCount() throws Exception {
        String sql = "select count(id) from product";
        return (Long) JDBCUtil.getGroupMethod(sql,null);
    }
}
