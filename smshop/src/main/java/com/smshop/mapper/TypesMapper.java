package com.smshop.mapper;

import com.smshop.entity.Types;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TypesMapper {

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
    Types selectTypesById(@Param("id") Integer id);

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
    Integer typeDelete(@Param("id") Integer id);
}
