package com.smshop.service.impl;

import com.smshop.mapper.TypesMapper;
import com.smshop.entity.Types;
import com.smshop.service.TypesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypesServiceImpl implements TypesService {

    @Autowired
    private TypesMapper typesMapper;

    @Override//查询分类页面信息
    public List<Types> selectTypes() {
        return typesMapper.selectTypes();
    }

    @Override//添加信息
    public Integer addTypes(Types types) {
        return typesMapper.addTypes(types);
    }

    @Override//根据id查询
    public Types selectTypesById(Integer id) {
        return typesMapper.selectTypesById(id);
    }

    @Override//修改信息
    public Integer updateTypes(Types types) {
        return typesMapper.updateTypes(types);
    }

    @Override//根据id删除信息
    public Integer typeDelete(Integer id) {
        return typesMapper.typeDelete(id);
    }

}
