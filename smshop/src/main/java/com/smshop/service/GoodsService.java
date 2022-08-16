package com.smshop.service;

import com.github.pagehelper.PageInfo;
import com.smshop.entity.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsService {

    /**
     * 模糊查询
     * @param name
     * @return
     */
    List<Goods> selectGoodsLikeName(String name);

    /**
     * 根据id查询
     * @param id
     * @return
     */
    Goods selectGoodsById(Integer id);

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
     * 查询商品
     * @param page
     * @param type
     * @return
     */
    PageInfo selectGoods(Integer page, Integer type);

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
    void goodDelete(Integer id);
}
