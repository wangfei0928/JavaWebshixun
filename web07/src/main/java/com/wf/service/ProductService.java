package com.wf.service;

import com.wf.bean.Product;

import java.util.List;

public interface ProductService {
    public List<Product> getByPage(Integer pageNo, Integer pageSize) throws Exception;
    public Long getCount() throws Exception;
}
