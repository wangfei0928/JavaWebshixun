package com.wf.dao;

import com.wf.bean.User;

public interface IUserDao {

    public User login(String name,String password) throws Exception;
}
