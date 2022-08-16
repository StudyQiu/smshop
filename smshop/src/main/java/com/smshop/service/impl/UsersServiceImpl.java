package com.smshop.service.impl;

import com.smshop.mapper.UsersMapper;
import com.smshop.entity.Users;
import com.smshop.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsersServiceImpl implements UsersService {

    @Autowired
    private UsersMapper usersMapper;


    @Override//查询全部
    public List<Users> selectUsers() {
        return usersMapper.selectUsers();
    }

    @Override
    public Users toLogin(String username, String password) {
        return usersMapper.toLogin(username, password);
    }

    @Override//添加
    public Integer addUsers(Users users) {
        return usersMapper.addUsers(users);
    }

    @Override//根据id查询
    public Users selectUsersById(Integer id) {
        return usersMapper.selectUsersById(id);
    }

    @Override//修改密码
    public Integer userReset(Integer id, String password) {
        return usersMapper.userReset(id, password);
    }

    @Override//根据id修改
    public Integer userUpdate(Users users) {
        return usersMapper.userUpdate(users);
    }

    @Override//根据id删除
    public void userDelete(Integer id) {
        usersMapper.userDelete(id);
    }
}
