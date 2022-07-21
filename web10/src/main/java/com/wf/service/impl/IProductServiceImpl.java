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

    @Override
    public void updateProduct(Integer id, String name, Double price, String img) throws Exception {
        iProductDao.updateProduct(id,name,price,img);
    }

    @Override
    public List<Product> getByPage(Integer pageNo, Integer pageSize) throws Exception {
       return iProductDao.getByPage(pageNo,pageSize);
    }

    @Override
    public Long getCount() throws Exception {
        return iProductDao.getCount();
    }
}
