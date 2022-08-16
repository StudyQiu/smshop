package com.smshop.service;

import com.smshop.entity.Types;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TypesService {

    /**
     * 查询类目
     * @return
     */
    List<Types> selectTypes();

    /**
     * 添加信息
     * @param types
     * @return
     */
    Integer addTypes(Types types);

    /**
     * 根据id查询
     * @param id
     * @return
     */
    Types selectTypesById(Integer id);

    /**
     * 修改信息
     * @param types
     * @return
     */
    Integer updateTypes(Types types);

    /**
     * 根据id进行删除
     * @param id
     * @return
     */
    Integer typeDelete(Integer id);
}
