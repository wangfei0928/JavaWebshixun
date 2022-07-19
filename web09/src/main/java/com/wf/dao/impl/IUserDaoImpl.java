package com.wf.dao.impl;

import com.wf.bean.User;
import com.wf.dao.IUserDao;
import com.wf.util.JDBCUtil;

public class IUserDaoImpl implements IUserDao {
    @Override
    public User login(String name, String password) throws Exception {

        String sql = "select * from user where uname=? and password=?";
        Object [] objects = {name,password};
        return JDBCUtil.getOne(sql,objects,User.class);
    }
}
