package com.smshop.controller;

import com.github.pagehelper.PageInfo;
import com.smshop.mapper.TopsMapper;
import com.smshop.entity.Goods;
import com.smshop.entity.Tops;
import com.smshop.entity.Types;
import com.smshop.service.GoodsService;
import com.smshop.service.TypesService;
import com.smshop.util.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/good")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;
    @Autowired
    private TypesService typesService;
    @Autowired
    private TopsMapper topsMapper;
    @Autowired
    HttpServletRequest request;

    @GetMapping("/goodsList/{page}/{type}")
    public String goodsList(Model model, @PathVariable("page") Integer page, @PathVariable("type") Integer type){
        PageInfo pageInfo = goodsService.selectGoods(page, type);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("pageType", type);
        return "good_list";
    }

    @GetMapping("/toAddGoods")
    public String toAddGoods(Model model){
        List<Types> types = typesService.selectTypes();
        model.addAttribute("typeList",types);
        return "good_add";
    }

    @PostMapping("/addGoods")
    public String addGoods(Goods goods, MultipartFile file) throws IOException {
        goods.setCover(UploadUtil.upload(file, request));
        goodsService.addGoods(goods);
        return "redirect:goodsList/1/0";
    }

    @GetMapping("/goodEdit/{id}")
    public String goodEdit (Model model, @PathVariable("id") Integer id){
        model.addAttribute("good",goodsService.selectGoodsById(id));
        model.addAttribute("typeList",typesService.selectTypes());
        return "good_edit";
    }

    @PostMapping("/goodUpdate")
    public String goodUpdate(Goods goods, MultipartFile file) throws IOException {
        goods.setCover(UploadUtil.upload(file, request));
        goodsService.goodUpdate(goods);
        return "redirect:goodsList/1/0";
    }

    @GetMapping("/goodDelete/{id}")
    public String goodDelete(@PathVariable("id") Integer id){
        goodsService.goodDelete(id);
        return "redirect:/good/goodsList/1/0";
    }

    //添加每日推荐
    @PostMapping("/topSave")
    @ResponseBody
    public String topSave(Tops tops){
        Integer integer = topsMapper.topSave(tops);
        if (integer > 0){
            return "ok";
        } else {
            return "on";
        }
    }

    //删除每日推荐
    @PostMapping("/topDelete")
    @ResponseBody
    public String topDelete(Integer good_id){
        Integer delete = topsMapper.topDelete(good_id);
        if (delete > 0){
            return "ok";
        } else {
            return "on";
        }
    }

}
