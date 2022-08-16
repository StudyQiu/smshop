package com.smshop.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.smshop.entity.Goods;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface GoodsMapper extends BaseMapper<Goods> {

    /**
     * 模糊查询
     * @param name
     * @return
     */
    List<Goods> selectGoodsLikeName(@Param("name") String name);

    /**
     * 查询商品
     * @return
     */
    List<Goods> selectGoods();

    /**
     * 查询商品排序
     * @return
     */
    List<Goods> selectGoodsDescSales();

    /**
     * 查询商品排序
     * @return
     */
    List<Goods> selectGoodsAscSales();

    /**
     * 根据类别查询
     * @param type_id
     * @return
     */
    List<Goods> selectGoodsByTypeId(@Param("type_id") Integer type_id);

    /**
     * 根据id查询
     * @param id
     * @return
     */
    Goods selectGoodsById(@Param("id") Integer id);

    /**
     * 查询推荐商品
     * @return
     */
    List<Goods> selectGoodsInTops();

    /**
     * 添加信息
     * @param goods
     * @return
     */
    Integer addGoods(Goods goods);

    /**
     * 根据id修改
     * @param goods
     * @return
     */
    Integer goodUpdate(Goods goods);

    /**
     * 根据id删除
     * @param id
     */
    void goodDelete(@Param("id") Integer id);
}
