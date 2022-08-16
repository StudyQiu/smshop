package com.smshop.mapper;

import com.smshop.entity.Items;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ItemsMapper {

    /**
     * 根据id查询订单详情
     * @return
     */
    List<Items> selectItems(@Param("order_id") Integer order_id);

    /**
     * 查询订单详情
     * @return
     */
    List<Items> selectItem();

    /**
     * 添加
     * @param price
     * @param amount
     * @param order_id
     * @param good_id
     * @return
     */
    Integer addItems(
            @Param("price") Integer price,
            @Param("amount")Integer amount,
            @Param("order_id")Integer order_id,
            @Param("good_id")Integer good_id);

}
