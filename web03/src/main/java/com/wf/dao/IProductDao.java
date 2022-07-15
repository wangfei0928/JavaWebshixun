package com.wf.dao;

import com.wf.bean.Product;

import java.util.List;

public interface IProductDao  {

    public List<Product> getAll() throws Exception;

    public void addProduct(String name,Double price,String img) throws Exception;
}
