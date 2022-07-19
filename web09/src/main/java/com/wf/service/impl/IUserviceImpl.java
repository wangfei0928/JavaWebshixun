package com.wf.service.impl;

import com.wf.bean.User;
import com.wf.dao.IUserDao;
import com.wf.dao.impl.IUserDaoImpl;
import com.wf.service.IUserService;

public class IUserviceImpl implements IUserService {
    @Override
    public User login(String name, String password) throws Exception {
        IUserDao iUserDao = new IUserDaoImpl();
        return iUserDao.login(name, password);
     }
}
