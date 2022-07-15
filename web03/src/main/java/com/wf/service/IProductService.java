package com.wf.service;

import com.wf.bean.Product;

import java.util.List;

public interface IProductService {

    public List<Product> getAll() throws Exception;

    public void addProduct(String name,Double price,String img) throws Exception;
}
