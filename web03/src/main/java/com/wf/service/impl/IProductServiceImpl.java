package com.wf.service.impl;

import com.wf.bean.Product;
import com.wf.dao.IProductDao;
import com.wf.dao.impl.IProductDaoImpl;
import com.wf.service.IProductService;

import java.util.List;

public class IProductServiceImpl implements IProductService {

    private IProductDao iProductDao = new IProductDaoImpl();
    @Override
    public List<Product> getAll() throws Exception {
        return iProductDao.getAll();
    }

    @Override
    public void addProduct(String name, Double price, String img) throws Exception {
        iProductDao.addProduct(name, price, img);
    }
}