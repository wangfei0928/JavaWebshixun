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
}
