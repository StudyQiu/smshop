package com.smshop.mapper;

import com.smshop.entity.Carts;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CartsMapper {

    /**
     * 添加商品到购物车
     * @param carts
     * @return
     */
    int addCart(Carts carts);

    /**
     * 查询数量
     * @param carts
     * @return
     */
    int cartSelectByIdAndGoodId(Carts carts);

    /**
     * 如果购物车里面有就商品加一
     * @param carts
     * @return
     */
    int cartSelectByIdAndGoodIdAdd(Carts carts);

    /**
     * 查询carts表和goods表
     * @return
     */
    List<Carts> toCart();

    /**
     * 根据user_id查询
     * @param user_id
     * @return
     */
    List<Carts> queryById(@Param("user_id") Integer user_id);

    /**
     * 查询数量
     * @param user_id
     * @return
     */
    Integer selectCartsByUserId(@Param("user_id") Integer user_id);

    /**
     * 更加id修改数量
     * @param id
     * @return
     */
    Integer add(@Param("id") Integer id);
    Integer reduce(@Param("id") Integer id);

    /**
     * 移除购物车商品
     * @param id
     * @return
     */
    Integer cartDelete(@Param("id") Integer id);

    /**
     * 清空当前账号购物车商品
     * @param user_id
     * @return
     */
    Integer cartDeleteByUserId(@Param("user_id") Integer user_id);

}
