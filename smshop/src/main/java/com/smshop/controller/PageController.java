package com.smshop.controller;

import com.smshop.mapper.CartsMapper;
import com.smshop.mapper.GoodsMapper;
import com.smshop.mapper.TypesMapper;
import com.smshop.entity.Carts;
import com.smshop.entity.Goods;
import com.smshop.entity.Users;
import com.smshop.service.GoodsService;
import com.smshop.service.TypesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class PageController {

    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private TypesService typesService;
    @Autowired
    private CartsMapper cartsMapper;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private TypesMapper typesMapper;
    @Autowired
    HttpServletRequest request;
    @Autowired
    HttpSession session;

    //设置login.jsp页面为根目录
    @RequestMapping("/")
    public String index(){
        return "login";
    }

    @RequestMapping("/web")
    public String indexWeb(){
        return "../index/login";
    }

    @GetMapping("/detail/{id}")
    public String detail(Model model, @PathVariable("id") Integer id) {
        /**
         * 根据商品id查询到商品传递给前台渲染
         */
        //查看商品详情
        Goods goods = goodsMapper.selectGoodsById(id);
        model.addAttribute("todayList",goodsMapper.selectGoodsByTypeId(goods.getType_id()));
        model.addAttribute("good",goods);
        model.addAttribute("types",typesService.selectTypesById(goods.getType_id()));
        return "../index/detail";
    }

    @GetMapping("/goodsByType/{id}")
    public String goodsByType(@PathVariable("id") Integer id) {
        //跳转到查看更多
        return "redirect:/goodList/"+id;
    }

    /**
     *计算购物车总额
     * @return
     */
    @GetMapping("/cartTotal")
    @ResponseBody
    public double cartTotal(){
        Users user = (Users) request.getSession().getAttribute("user");
        List<Carts> carts = cartsMapper.queryById(user.getId());
        double allTolal=0;
        for (Integer i = 0; i < carts.size(); i++) {
            Integer total = carts.get(i).getAmount() * carts.get(i).getGoods().getPrice();
            allTolal= allTolal+total;
            carts.get(i).setTotal(total);
        }
        return allTolal;
    }

    /**
     *计算购物车商品数量
     * @return
     */
    @GetMapping("/cartAllAmount")
    @ResponseBody
    public double cartAllAmount(){
        Users user = (Users) request.getSession().getAttribute("user");
        List<Carts> carts = cartsMapper.queryById(user.getId());
        Integer size = carts.size();
        session.setAttribute("cartCount", size);
        return size;
    }

    /**
     * 模糊查询
     * @param model
     * @param name
     * @return
     */
    @PostMapping("/search")
    public String search(Model model, String name) {
        //模糊查询
        List<Goods> goodsList = goodsService.selectGoodsLikeName(name);
        model.addAttribute("search",name);
        model.addAttribute("goodList",goodsList);
        model.addAttribute("typeList",typesMapper.selectTypes());
        //跳转到查看更多
        model.addAttribute("flag",5);
        return "../index/goods";
    }

}
