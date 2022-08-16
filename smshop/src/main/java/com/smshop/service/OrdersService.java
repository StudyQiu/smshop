package com.smshop.service;

import com.github.pagehelper.PageInfo;
import com.smshop.entity.Orders;
import com.smshop.vo.OrdersVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrdersService {

    /**
     * 查询订单
     * @return
     */
    PageInfo selectOrders(Integer page, Integer status);

    /**
     * 根据id修改状态
     * @param id
     * @param status
     * @return
     */
    Integer orderUpdate(Integer id, Integer status);

    /**
     * 根据id修改
     * @param id
     * @param paytype
     * @param name
     * @param phone
     * @param address
     * @return
     */
    Integer updateOrders(Integer id, String paytype, String name, String phone, String address);

    /**
     * 根据id删除
     * @param id
     */
    void orderDelete(Integer id);


}
