package com.smshop.controller;

import com.github.pagehelper.PageInfo;
import com.smshop.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/order")
public class OrdersController {

    @Autowired
    private OrdersService ordersService;

    @GetMapping("/ordersList/{page}/{status}")
    public String ordersList(Model model, @PathVariable("page") Integer page, @PathVariable("status") Integer status){
        PageInfo pageInfo = ordersService.selectOrders(page, status);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("status", status);
        return "order_list";
    }

    @GetMapping("/orderUpdate/{id}/{status}")
    public String orderUpdate(Model model, @PathVariable("id") Integer id, @PathVariable("status") Integer status) {
        Integer update = ordersService.orderUpdate(id, status);
        //根据id修改状态
        if (update > 0) {
            model.addAttribute("msg","ok");
        } else {
            model.addAttribute("msg","on");
        }
        return "redirect:/order/ordersList/1/0";
    }

    @GetMapping("/orderDelete/{id}")
    public String orderDelete(@PathVariable("id") Integer id) {
        //根据id删除
        ordersService.orderDelete(id);
        return "redirect:/order/ordersList/1/0";
    }

}
