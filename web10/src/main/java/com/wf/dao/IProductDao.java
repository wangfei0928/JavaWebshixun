package com.wf.dao;

import com.wf.bean.Product;

import java.util.List;

public interface IProductDao  {

    public List<Product> getAll() throws Exception;

    public void addProduct(String name,Double price,String img) throws Exception;

    public void updateProduct(Integer id,String name,Double price,String img) throws Exception;

    public List<Product> getByPage(Integer pageNo,Integer pageSize) throws Exception;

    public Long getCount() throws Exception;
}
