package com.smshop.service.impl;

import com.smshop.mapper.AdminsMapper;
import com.smshop.entity.Admins;
import com.smshop.service.AdminsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminsServiceImpl implements AdminsService {
    @Autowired
    private AdminsMapper adminsMapper;

    @Override//账号
    public List<Admins> login(String username) {
        return adminsMapper.login(username);
    }

    @Override//账号密码
    public Admins islogin(String username, String password) {
        return adminsMapper.islogin(username,password);
    }

    @Override//查询全部
    public List<Admins> adminsList() {
        return adminsMapper.adminsList();
    }

    @Override//添加
    public Integer addAdmins(Admins admins) {
        return adminsMapper.addAdmins(admins);
    }

    @Override//根据id修改
    public Integer resetAdmins(Integer id, String password) {
        return adminsMapper.resetAdmins(id, password);
    }

    @Override
    public void deleteAdmins(Integer id) {
        adminsMapper.deleteAdmins(id);
    }

}
