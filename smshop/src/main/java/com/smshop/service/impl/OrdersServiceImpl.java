package com.smshop.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.smshop.mapper.ItemsMapper;
import com.smshop.mapper.OrdersMapper;
import com.smshop.entity.Items;
import com.smshop.entity.Orders;
import com.smshop.service.OrdersService;
import com.smshop.vo.OrdersVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    private OrdersMapper ordersMapper;
    @Autowired
    private ItemsMapper itemsMapper;

    @Override
    public PageInfo selectOrders(Integer page, Integer status) {
        PageHelper.startPage(page, 5);
        List<Orders> ordersList;
        if (status != 0){
            //查询推荐商品
            ordersList = ordersMapper.selectOrdersByStatus(status);
        } else {
            //查询全部商品
            ordersList = ordersMapper.selectOrders();
        }
        PageInfo pageInfo = new PageInfo<>(ordersList);
        List<OrdersVO> goodsVOS = copyBean(ordersList);
        pageInfo.setList(goodsVOS);
        return pageInfo;
    }

    @Override
    public Integer orderUpdate(Integer id, Integer status) {
        return ordersMapper.orderUpdate(id, status);
    }

    @Override
    public Integer updateOrders(Integer id, String paytype, String name, String phone, String address) {
        return ordersMapper.updateOrders(id, paytype, name, phone, address);
    }

    @Override
    public void orderDelete(Integer id) {
        ordersMapper.orderDelete(id);
    }

    public List<OrdersVO> copyBean(List<Orders> ordersList) {
        if (ordersList.size() > 0) {
            List<OrdersVO> ordersVOList = new ArrayList<>();
            for (Orders orders : ordersList){
                OrdersVO ordersVO = new OrdersVO();
                BeanUtils.copyProperties(orders,ordersVO);
                if (null != orders.getUsers()) {
                    ordersVO.setUsername(orders.getUsers().getUsername());
                }
                List<Items> items = itemsMapper.selectItems(orders.getId());
                ordersVO.setItemsList(items);
                ordersVOList.add(ordersVO);
            }
            return ordersVOList;
        }
        return null;
    }
}
