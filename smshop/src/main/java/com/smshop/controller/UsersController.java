package com.smshop.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.smshop.entity.Types;
import com.smshop.entity.Users;
import com.smshop.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UsersController {

    @Autowired
    private UsersService usersService;

    @GetMapping("/userList/{page}")
    public ModelAndView userList(@PathVariable("page") Integer page) {
        ModelAndView mv = new ModelAndView();
        //第一步：执行startPage方法
        PageHelper.startPage(page,5);
        //第二歩：执行你的SQL
        List<Users> users = usersService.selectUsers();
        //第三歩：创建pageInfo对象
        PageInfo<Types> pageInfo = new PageInfo(users);
        //返回数据到页面
        mv.setViewName("user_list");
        mv.addObject("pageInfo",pageInfo);
        return mv;
    }

    @PostMapping("/addUsers")
    public String addUsers(Users users) {
        //添加
        usersService.addUsers(users);
        return "redirect:userList/1";
    }

    @GetMapping("/toUserReset/{id}/{username}")
    public String toUserReset(Model model, @PathVariable("id") Integer id, @PathVariable("username") String username) {
        model.addAttribute("id",id);
        model.addAttribute("username",username);
        return "user_reset";
    }

    @PostMapping("/userReset")
    public String userReset(Model model, Integer id, String password, String password1) {
        //根据id查询全部信息
        Users users = usersService.selectUsersById(id);
        //校验
        if (users.getPassword() != password && password.equals(password1)) {
            //修改密码
            usersService.userReset(id, password1);
            return "redirect:/user/userList/1";
        }
        model.addAttribute("msg", "修改失败");
        return "user_reset";
    }

    @GetMapping("/toUpdateUsers/{id}")
    public String toUpdateUsers(Model model, @PathVariable("id") Integer id) {
        //跳转到修改页面
        model.addAttribute("user",usersService.selectUsersById(id));
        return "user_edit";
    }

    @PostMapping("/userUpdate")
    public String userUpdate(Users users) {
        //根据id修改
        usersService.userUpdate(users);
        return "redirect:/user/userList/1";
    }

    @GetMapping("/userDelete/{id}")
    public String userDelete(@PathVariable("id") Integer id) {
        //根据id删除
        usersService.userDelete(id);
        return "redirect:/user/userList/1";
    }

}
