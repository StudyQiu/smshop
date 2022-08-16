package com.smshop;

import com.smshop.mapper.ItemsMapper;
import com.smshop.mapper.OrdersMapper;
import com.smshop.entity.Items;
import com.smshop.entity.Orders;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SpringBootTest
class SmshopApplicationTests {
	@Autowired
	private ItemsMapper itemsMapper;
	@Autowired
	private OrdersMapper ordersMapper;
	@Test
	void contextLoads() {
		List<Orders> ordersList = ordersMapper.selectOrders();
		Map<Integer,List<Items>> map = new HashMap<>();
		for (Orders orders : ordersList) {
			map.put(orders.getId(),itemsMapper.selectItems(orders.getId()));
		}
		System.out.println(map);
	}

}
