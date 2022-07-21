package com.wf.service;

import com.wf.bean.User;

public interface IUserService {

    public User login(String name, String password) throws Exception;
}
