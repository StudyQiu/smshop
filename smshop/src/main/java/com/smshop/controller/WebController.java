package com.smshop.controller;

import com.smshop.mapper.*;
import com.smshop.entity.*;
import com.smshop.service.GoodsService;
import com.smshop.service.OrdersService;
import com.smshop.service.UsersService;
import com.smshop.vo.GoodsVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class WebController {

    @Autowired
    private UsersService usersService;
    @Autowired
    private TopsMapper topsMapper;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private TypesMapper typesMapper;
    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private OrdersMapper ordersMapper;
    @Autowired
    private ItemsMapper itemsMapper;
    @Autowired
    private CartsMapper cartsMapper;
    @Autowired
    private OrdersService ordersService;
    @Autowired
    HttpServletRequest request;
    @Autowired
    HttpSession session;

    @GetMapping("/toRegister")
    public String toRegister() {
        //跳转到注册页面
        return "../index/register";
    }

    @GetMapping("/toLogin")
    public String toLogin() {
        //跳转到前台登录页面
        return "redirect:/web";
    }

    @PostMapping("/register")
    public String register(Model model, Users users) {
        for(Users user : usersService.selectUsers()) {
            if (users.getUsername() != user.getUsername() && usersService.addUsers(users) > 0) {
                return "redirect:/web";
            }
        }
        model.addAttribute("msg","注册失败");
        return "../index/register";
    }

    @PostMapping("/toLogin")
    public String toLogin(Model model, String username, String password) {
        //用户登录
        Users users = usersService.toLogin(username, password);
        //是否成功
        if (users != null) {
            //成功，查询商品
            //获取需要的数据的表里的值
            List<Tops> topsList = topsMapper.selectGoodsIdInTops();
            List<Types> typesList = typesMapper.selectTypes();
            List<Goods> goodsList1 = new ArrayList<>();
            List<GoodsVO> goodsList2 = new ArrayList<>();
            for (Tops tops : topsList) {
                Goods good = goodsMapper.selectGoodsById(tops.getGood_id());
                if (good != null){
                    goodsList1.add(good);
                }
            }
            for (Goods goods : goodsList1) {
                GoodsVO goodsVO = new GoodsVO();
                BeanUtils.copyProperties(goods, goodsVO);//这里是把goodsList1的每一个goods转换为GoodsVO
                goodsList2.add(goodsVO);
            }
            for (GoodsVO goodsVO : goodsList2) {
                for (Types types : typesList) {
                    if (types.getId() == goodsVO.getType_id()){
                        goodsVO.setTypeName(types.getName());
                    }
                }
            }
            //new一个map集合获取值用来前台渲染
            Map<Integer,List<Goods>> map = new HashMap<>();
            for (Types types : typesList) {
                map.put(types.getId(),goodsMapper.selectGoodsByTypeId(types.getId()));
            }
            //把购物车商品种类数存到会话
            Integer carts = cartsMapper.selectCartsByUserId(users.getId());
            session.setAttribute("cartCount", carts);
            //存储当前账号
            session.setAttribute("user", usersService.selectUsersById(users.getId()));
            model.addAttribute("todayList", goodsList2);
            model.addAttribute("hotList", goodsService.selectGoodsDescSales());
            model.addAttribute("dataList",typesList);
            model.addAttribute("goodList",map);
            model.addAttribute("typeList",typesList);
            model.addAttribute("flag",1);
            return "../index/index";
        }
        //失败
        model.addAttribute("msg","登录失败，账号或密码不能为空");
        return "../index/login";
    }

    //跳转到商品首页
    @GetMapping("/toIndex/{id}")
    public String toIndex(Model model, @PathVariable("id") Integer id) {
        //查询商品
        //获取需要的数据的表里的值
        List<Tops> topsList = topsMapper.selectGoodsIdInTops();
        List<Types> typesList = typesMapper.selectTypes();
        List<Goods> goodsList = new ArrayList<>();
        //遍历集合获取需要的信息
        for (Tops tops : topsList) {
            Goods good = goodsMapper.selectGoodsById(tops.getGood_id());
            //存在就添加到集合
            if (good != null){
                goodsList.add(good);
            }
        }
        //new一个map集合获取值用来前台渲染
        Map<Integer,List<Goods>> map = new HashMap<>();
        for (Types types : typesList) {
            map.put(types.getId(),goodsMapper.selectGoodsByTypeId(types.getId()));
        }
        model.addAttribute("todayList", goodsList);
        model.addAttribute("hotList", goodsService.selectGoodsDescSales());
        model.addAttribute("dataList",typesList);
        model.addAttribute("goodList",map);
        model.addAttribute("typeList",typesList);
        model.addAttribute("flag",1);
        return "../index/index";
    }

    @GetMapping("/todayList/{id}")
    public String todayList(Model model, @PathVariable("id") Integer id) {
        //查询今日推荐商品
        List<Tops> topsList = topsMapper.selectGoodsIdInTops();
        List<Goods> goodsList = new ArrayList<>();
        for (Tops tops : topsList) {
            Goods goods = goodsMapper.selectGoodsById(tops.getGood_id());
            goodsList.add(goods);
        }
        model.addAttribute("typeList",typesMapper.selectTypes());
        model.addAttribute("goodList",goodsList);
        //跳转到今日推荐
        model.addAttribute("flag",2);
        return "../index/goods";
    }

    @GetMapping("/hotList/{id}")
    public String hotList(Model model, @PathVariable("id") Integer id) {
        //查询热销商品
        model.addAttribute("goodList",goodsMapper.selectGoodsDescSales());
        model.addAttribute("typeList",typesMapper.selectTypes());
        //跳转到热销排行
        model.addAttribute("flag",3);
        return "../index/goods";
    }

    @GetMapping("/newList/{id}")
    public String newList(Model model, @PathVariable("id") Integer id) {
        //查询新品上市
        model.addAttribute("goodList",goodsMapper.selectGoodsAscSales());
        model.addAttribute("typeList",typesMapper.selectTypes());
        //跳转到新品上市
        model.addAttribute("flag",4);
        return "../index/goods";
    }

    @GetMapping("/goodList/{id}")
    public String goodList(Model model, @PathVariable("id") Integer id) {
        List<Goods> goodsList;
        if (id == 0) {
            //查询全部
            goodsList = goodsMapper.selectGoods();
        } else {
            //根据typeId查询
            goodsList = goodsMapper.selectGoodsByTypeId(id);
        }
        model.addAttribute("goodList",goodsList);
        model.addAttribute("typeList",typesMapper.selectTypes());
        //跳转到查看更多
        model.addAttribute("flag",5);
        return "../index/goods";
    }

    @GetMapping("/logout")
    public String logout() {
        //退出登录销毁会话
        request.getSession().invalidate();
        return "redirect:toIndex/0";
    }

    @GetMapping("/password")
    public String password() {
        //跳转到修改
        return "../index/password";
    }

    @PostMapping("/passwordUpdate")
    public String passwordUpdate(Model model,Integer id, String password, String passwordNew) {
        //根据id查询全部信息
        Users users = usersService.selectUsersById(id);
        //校验原密码是否正确，新密码与原密码是否相同
        if (users.getPassword().equals(password) && password != passwordNew) {
            //修改密码
            usersService.userReset(id,passwordNew);
            return "redirect:/web";
        }
        model.addAttribute("msg", "修改失败");
        return "../index/password";
    }

    @PostMapping("/myUpdate")
    public String myUpdate(Model model,Users users) {
        //个人中心修改信息
        if (usersService.userUpdate(users) > 0) {
            session.setAttribute("user", usersService.selectUsersById(users.getId()));
            return "redirect:/toIndex/0";
        }
        model.addAttribute("msg", "修改失败");
        return "../index/password";
    }

    @PostMapping("/addressUpdate")
    public String addressUpdate(Model model,Users users) {
        //修改收货地址信息
        if (usersService.userUpdate(users) > 0) {
            session.setAttribute("user", usersService.selectUsersById(users.getId()));
            return "redirect:/toIndex/0";
        }
        model.addAttribute("msg", "修改失败");
        return "../index/password";
    }

    @PostMapping("/addCart")
    @ResponseBody
    public String addCart(Integer id){
        //加入购物车
        //设置一个受影响的行数
        int line = 0;
        //首先获取现在用户的id
        //获取会话里面的
        Users user = (Users) request.getSession().getAttribute("user");
        Carts carts = new Carts();
        Goods goods = new Goods();
        //拿需要的值
        goods.setId(id);
        carts.setGoods(goods);
        carts.setAmount(1);
        carts.setUser_id(user.getId());
        int isExit=0;
        //查询数量
        int num = cartsMapper.cartSelectByIdAndGoodId(carts);
        //判断购物车里面是否存在
        if (num > 0){
            //如果购物车里面存在就数量加一
            line = cartsMapper.cartSelectByIdAndGoodIdAdd(carts);
        }else {
            //否则就添加到购物车
            line = cartsMapper.addCart(carts);
            isExit = 1;
        }
        //刷新会话
        session.setAttribute("cartCount", cartsMapper.selectCartsByUserId(user.getId()));
        //购物车商品数量受影响且内容受影响
        if (line > 0 && isExit == 1){
            return "{\"result\":\"ok\",\"isExit\":\"" + isExit +"\"}";
            //购物车商品数量受影响且内容没受影响
        }else if (line > 0 && isExit == 0){
            return "{\"result\":\"ok\",\"isExit\":\"" + isExit +"\"}";
            //没有添加或添加失败
        }else {
            return "{\"result\":\"no\",\"isExit\":\"" + isExit +"\"}";
        }
    }

    @GetMapping("/toCart")
    public String toCart(Model model) {
        //查询购物车商品
        Users user = (Users) request.getSession().getAttribute("user");
        List<Carts> cartsList = cartsMapper.queryById(user.getId());
        Integer sum = 0;
        for (Carts carts : cartsList) {
            carts.setTotal(carts.getGoods().getPrice() * carts.getAmount());//获取每个商品的值
            sum += carts.getTotal();//总价格
        }
        //跳转到购物车
        model.addAttribute("cartTotal",sum);
        model.addAttribute("cartList",cartsList);
        model.addAttribute("typeList",typesMapper.selectTypes());
        return "../index/cart";
    }

    @PostMapping("/add")
    public String add(Integer id) {
        //修改商品数量
        if (cartsMapper.add(id) > 0) {
            return "redirect:/toCart";
        }
        return null;
    }

    @PostMapping("/reduce")
    public String reduce(Integer id) {
        //修改商品数量
        if (cartsMapper.reduce(id) > 0) {
            return "redirect:/toCart";
        }
        return null;
    }

    @PostMapping("/cartDelete/{id}")
    @ResponseBody
    public String cartDelete(@PathVariable("id") Integer id) {
        //删除购物车商品
        if (cartsMapper.cartDelete(id) > 0) {
            return "ok";
        }
        return "no";
    }

    @GetMapping("/orderSave")
    public String orderSave() {
        //获取当前账号id
        Users user = (Users) request.getSession().getAttribute("user");
        //查询每个商品的单价和数量及good_id
        List<Carts> cartsList = cartsMapper.queryById(user.getId());
        Integer price = 0;
        Integer amount = 0;
        Integer good_id = 0;
        //获取总金额
        Integer totals = 0;
        for (Carts carts : cartsList) {
            carts.setTotal(carts.getGoods().getPrice() * carts.getAmount());//获取每个商品的值
            totals += carts.getTotal();//总价格
        }
        //获取商品数量
        Integer sum = cartsMapper.selectCartsByUserId(user.getId());
        //添加到orders表
        Integer i = ordersMapper.addOrderByUserId(totals, sum, user.getName(), user.getPhone(), user.getAddress(), user.getId());
        //根据user_id查询orders的id
        Integer order_id = ordersMapper.selectIdByUserId(user.getId());
        //判断orders表内容是否添加成功
        if (i > 0) {
            //添加到items表
            for (Carts carts : cartsList) {
                price = carts.getGoods().getPrice();
                amount = carts.getAmount();
                good_id = carts.getGood_id();
                itemsMapper.addItems(price, amount, order_id, good_id);
            }
        }
        //清空购物车
        cartsMapper.cartDeleteByUserId(user.getId());
        //刷新会话
        session.setAttribute("cartCount", cartsMapper.selectCartsByUserId(user.getId()));
        //提交订单
        return "redirect:/toCart";
    }

    @GetMapping("/order")
    public String order(Model model) {
        //查询当前账号订单信息
        Users user = (Users) request.getSession().getAttribute("user");
        List<Orders> ordersList = ordersMapper.selectOrdersByUserId(user.getId());
        Map<Integer,List<Items>> map = new HashMap<>();
        for (Orders orders : ordersList) {
            map.put(orders.getId(),itemsMapper.selectItems(orders.getId()));
        }
        //跳转到我的订单
        model.addAttribute("orderList",ordersList);
        model.addAttribute("itemsList",map);
        model.addAttribute("typeList",typesMapper.selectTypes());
        return "../index/order";
    }

    @GetMapping("/orderPay/{id}")
    public String orderPay(Model model, @PathVariable("id") Integer id) {
        //获取当前订单情况
        List<Items> itemsList = itemsMapper.selectItems(id);
        Integer sum = 0;
        for (Items items : itemsList) {
            sum += items.getGoods().getPrice() * items.getAmount();//总价格
        }
        model.addAttribute("id",id);
        model.addAttribute("total",sum);
        model.addAttribute("itemsList",itemsList);
        //跳转到支付页面
        return "../index/pay";
    }

    @GetMapping("/orderDeletePay/{id}")
    public String orderDeletePay(@PathVariable("id") Integer id) {
        //删除当前订单
        ordersMapper.orderDelete(id);
        //刷新当前页面
        return "redirect:/order";
    }

    @RequestMapping("/pay")
    public String pay(Integer id, String paytype, String name, String phone, String address) {
        //根据订单id进行修改
        Integer i = ordersService.updateOrders(id, paytype, name, phone, address);
        if (i > 0) {
            //跳转支付成功
            return "../index/payok";
        } else {
            return "../index/error";
        }
    }

}
