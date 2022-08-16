package com.smshop.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.smshop.entity.Tops;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TopsMapper extends BaseMapper<Tops> {

    /**
     * 查询推荐商品id
     * @return
     */
    List<Tops> selectGoodsIdInTops();

    /**
     * 添加每日推荐
     * @param tops
     * @return
     */
    Integer topSave(Tops tops);

    /**
     * 删除每日推荐
     * @param good_id
     */
    Integer topDelete(@Param("good_id") Integer good_id);
}
