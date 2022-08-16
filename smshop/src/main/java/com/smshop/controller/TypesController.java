package com.smshop.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.smshop.entity.Types;
import com.smshop.service.TypesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/type")
public class TypesController {

    @Autowired
    private TypesService typesService;

    @GetMapping("/typeList/{page}")
    public ModelAndView typeList(@PathVariable("page") Integer page){
        ModelAndView mv = new ModelAndView();
        //第一步：执行startPage方法
        PageHelper.startPage(page,5);
        //第二歩：执行你的SQL
        List<Types> types = typesService.selectTypes();
        //第三歩：创建pageInfo对象
        PageInfo<Types> pageInfo = new PageInfo(types);
        //返回数据到页面
        mv.setViewName("type_list");
        mv.addObject("pageInfo",pageInfo);
        return mv;
    }

    //用于跳转分类添加页面
    @GetMapping("/toAddTypes")
    public String toAddTypes(){
        return "type_add";
    }

    @PostMapping("/addTypes")
    public String addTypes(Types types){
        ModelAndView mv = new ModelAndView();
        //调用添加方法判断是否为假
        if (typesService.addTypes(types) > 0){
            //不为假添加成功返回到分类页面进行刷新
            return "redirect:typeList/1";
        }
        //添加失败
        mv.addObject("addMsg","新增失败");
        //添加失败刷新
        return "type_add";
    }

    @GetMapping("/typeEdit/{id}")
    public ModelAndView typeEdit(@PathVariable("id") Integer id){
        ModelAndView mv = new ModelAndView();
        //跳转并返回数据到修改页面
        mv.setViewName("type_edit");
        //根据id查询信息以types传值到修改页面
        mv.addObject("types",typesService.selectTypesById(id));
        return mv;
    }

    @PostMapping("/updateTypes")
    public String updateTypes(Types types){
        //根据获取的值进行修改
        typesService.updateTypes(types);
        //修改后返回到分类页面进行刷新
        return "redirect:/type/typeList/1";
    }

    @GetMapping("/typeDelete/{id}")
    //获取当前删除信息的id
    public String typeDelete(@PathVariable("id") Integer id){
        //根据id删除信息
        typesService.typeDelete(id);
        //删除之后返回到分类页面进行刷新
        return "redirect:/type/typeList/1";
    }
}
