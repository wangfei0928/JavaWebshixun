package com.wf.dao;

import com.wf.bean.Product;

import java.util.List;

public interface IProductDao {

    public List<Product> getByPage(Integer pageNo,Integer pageSize) throws Exception;


    public Long getCount() throws Exception;
}
