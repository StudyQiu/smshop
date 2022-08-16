package com.smshop.service;

import com.smshop.entity.Admins;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminsService {

    /**
     * 查询账号
     * @param username
     * @return
     */
    List<Admins> login(String username);

    /**
     * 查询账号和密码
     * @param username
     * @param password
     * @return
     */
    Admins islogin(String username, String password);

    /**
     * 查询全部
     * @return
     */
    List<Admins> adminsList();

    /**
     * 添加
     * @param admins
     * @return
     */
    Integer addAdmins(Admins admins);

    /**
     * 根据id修改密码
     * @param id
     * @param password
     * @return
     */
    Integer resetAdmins(Integer id, String password);

    /**
     * 根据id删除
     * @param id
     */
    void deleteAdmins(@Param("id") Integer id);

}
