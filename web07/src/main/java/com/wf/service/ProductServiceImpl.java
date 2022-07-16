package com.wf.service;

import com.wf.bean.Product;
import com.wf.dao.IProductDao;
import com.wf.dao.IProductDaoImpl;

import java.util.List;

public class ProductServiceImpl implements ProductService{

    private IProductDao iProductDao = new IProductDaoImpl();
    @Override
    public List<Product> getByPage(Integer pageNo, Integer pageSize) throws Exception {

        return iProductDao.getByPage(pageNo,pageSize);
    }

    @Override
    public Long getCount() throws Exception {
        return iProductDao.getCount();
    }
}
