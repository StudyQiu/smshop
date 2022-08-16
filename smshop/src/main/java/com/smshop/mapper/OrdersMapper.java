package com.smshop.mapper;

import com.smshop.entity.Carts;
import com.smshop.entity.Orders;
import com.smshop.entity.Users;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OrdersMapper {

    /**
     * 查询订单
     * @return
     */
    List<Orders> selectOrders();

    /**
     * 根据id查询total
     * @param user_id
     * @return
     */
    List<Orders> selectTotalByUserId(@Param("user_id") Integer user_id);

    /**
     * 根据id查询
     * @param user_id
     * @return
     */
    List<Orders> selectOrdersByUserId(@Param("user_id") Integer user_id);

    /**
     * 根据id查询
     * @param user_id
     * @return
     */
    Integer selectIdByUserId(@Param("user_id") Integer user_id);

    /**
     * 根据status查询订单
     * @return
     */
    List<Orders> selectOrdersByStatus(@Param("status") Integer status);

    /**
     * 根据id修改状态
     * @param id
     * @param status
     * @return
     */
    Integer orderUpdate(@Param("id") Integer id, @Param("status") Integer status);

    /**
     * 根据id修改
     * @param id
     * @param paytype
     * @param name
     * @param phone
     * @param address
     * @return
     */
    Integer updateOrders(
            @Param("id") Integer id,
            @Param("paytype") String paytype,
            @Param("name") String name,
            @Param("phone") String phone,
            @Param("address") String address);

    /**
     * 根据id删除
     * @param id
     */
    void orderDelete(@Param("id") Integer id);

    /**
     * 添加
     * @param total
     * @param amount
     * @param name
     * @param phone
     * @param address
     * @param user_id
     * @return
     */
    Integer addOrderByUserId(
            @Param("total") Integer total,
            @Param("amount") Integer amount,
            @Param("name") String name,
            @Param("phone") String phone,
            @Param("address") String address,
            @Param("user_id") Integer user_id);

}
