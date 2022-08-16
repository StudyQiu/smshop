package com.smshop.service;

import com.smshop.entity.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UsersService {

    /**
     * 查询用户信息
     * @return
     */
    List<Users> selectUsers();

    /**
     * 查询账号和密码
     * @param username
     * @param password
     * @return
     */
    Users toLogin(String username, String password);

    /**
     * 添加
     * @param users
     * @return
     */
    Integer addUsers(Users users);

    /**
     * 根据id查询
     * @param id
     * @return
     */
    Users selectUsersById(Integer id);

    /**
     * 修改密码
     * @param id
     * @param password
     * @return
     */
    Integer userReset(Integer id, String password);

    /**
     * 根据id修改
     * @param users
     * @return
     */
    Integer userUpdate(Users users);

    /**
     * 根据id删除
     * @param id
     */
    void userDelete(Integer id);

}
