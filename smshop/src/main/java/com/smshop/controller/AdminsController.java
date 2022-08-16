package com.smshop.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.smshop.entity.Admins;
import com.smshop.entity.Types;
import com.smshop.service.AdminsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/admin")
public class AdminsController {

    @Autowired
    private AdminsService adminsService;
    @Autowired
    HttpSession session;

    @RequestMapping("/login")
    @ResponseBody
    public String login(String username){
        //非空判断，对账号进行校验
        if (!StringUtils.isEmpty(username.trim())) {
            //数据库中数据进行交互
            List<Admins> list = adminsService.login(username);
            //判断是否存在
            return list.size() > 0 ? "true" : "false";
        }
        return "false";
    }

    @PostMapping("/islogin")
    public String isLogin(String username, String password){
        //获取用户名的长度
        int unameLength = username.length();
        //获取密码的长度
        int upassLength = username.length();
        //对账号密码长度进行校验
        if (unameLength >= 2 && unameLength <= 20 && upassLength >= 2 && upassLength <= 20){
            //正则表达式
            String reg = "^[A-Za-z0-9]+$";
            //对密码的格式进行校验
            if (Pattern.matches(reg,username)&&Pattern.matches(reg, password)) {
                //登录账号信息
                Admins admins = adminsService.islogin(username, password);
                //判断数据是否存在，管理员或用户
                if (admins != null) {
                    //将信息存储到会话
                    session.setAttribute("admin",admins);
                    return "index";
                }
            }
        }
        return "login";
    }

    @GetMapping("/index")
    public String index() {
        return "index";
    }

    @GetMapping("/adminsList/{page}")
    public ModelAndView adminsList(@PathVariable("page") Integer page){
        ModelAndView mv = new ModelAndView();
        //第一步：执行startPage方法
        PageHelper.startPage(page,5);
        //第二歩：执行你的SQL
        List<Admins> admins = adminsService.adminsList();
        //第三歩：创建pageInfo对象
        PageInfo<Types> pageInfo = new PageInfo(admins);
        //返回数据到页面
        mv.setViewName("admin_list");
        mv.addObject("pageInfo",pageInfo);
        return mv;
    }

    //跳转到添加页面
    @GetMapping("/toAddAdmins")
    public String toAddAdmins() {
        return "admin_add";
    }

    @PostMapping("/addAdmins")
    public String addAdmins(Admins admins) {
        //添加
        adminsService.addAdmins(admins);
        return "redirect:adminsList/1";
    }

    @PostMapping("/resetAdmins")
    public String resetAdmins(Integer id, String password) {
        //根据id修改密码
        adminsService.resetAdmins(id,password);
        //跳转
        return "redirect:/admin/adminsList/1";
    }

    @GetMapping("/deleteAdmins/{id}")
    public String deleteAdmins(@PathVariable("id") Integer id) {
        //根据id删除
        adminsService.deleteAdmins(id);
        return "redirect:/admin/adminsList/1";
    }

}
