package com.wf.dao;

import com.wf.bean.Product;
import com.wf.util.JDBCUtil;

import java.util.List;

public class IProductDaoImpl implements IProductDao{
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
