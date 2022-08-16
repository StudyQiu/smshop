package com.smshop.mapper;

import com.smshop.entity.Admins;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdminsMapper {

    /**
     * 查询账号
     * @param username
     * @return
     */
    List<Admins> login(@Param("username") String username);

    /**
     * 查询账号和密码
     * @param username
     * @param password
     * @return
     */
    Admins islogin(@Param("username") String username, @Param("password") String password);

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
    Integer resetAdmins(@Param("id") Integer id,@Param("password") String password);

    /**
     * 根据id删除
     * @param id
     */
    void deleteAdmins(@Param("id") Integer id);

}
