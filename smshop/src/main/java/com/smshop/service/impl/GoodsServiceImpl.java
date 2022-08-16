package com.smshop.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.smshop.mapper.GoodsMapper;
import com.smshop.mapper.TopsMapper;
import com.smshop.mapper.TypesMapper;
import com.smshop.entity.Goods;
import com.smshop.entity.Tops;
import com.smshop.entity.Types;
import com.smshop.service.GoodsService;
import com.smshop.vo.GoodsVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private TypesMapper typesMapper;
    @Autowired
    private TopsMapper topsMapper;

    @Override
    public List<Goods> selectGoodsLikeName(String name) {
        return goodsMapper.selectGoodsLikeName(name);
    }

    @Override
    public Goods selectGoodsById(Integer id) {
        return goodsMapper.selectGoodsById(id);
    }

    @Override
    public List<Goods> selectGoodsDescSales() {
        return goodsMapper.selectGoodsDescSales();
    }

    @Override
    public List<Goods> selectGoodsAscSales() {
        return goodsMapper.selectGoodsAscSales();
    }

    @Override
    public PageInfo selectGoods(Integer page, Integer type) {
        PageHelper.startPage(page, 5);
        List<Goods> goodsList;
        if (type == 1){
            //查询推荐商品
            goodsList = goodsMapper.selectGoodsInTops();
        } else {
            //查询全部商品
            goodsList = goodsMapper.selectGoods();
        }
        PageInfo pageInfo = new PageInfo<>(goodsList);
        List<GoodsVO> goodsVOS = copyBean(goodsList);
        pageInfo.setList(goodsVOS);
        return pageInfo;
    }

    @Override
    public Integer addGoods(Goods goods) {
        return goodsMapper.addGoods(goods);
    }

    @Override
    public Integer goodUpdate(Goods goods) {
        return goodsMapper.goodUpdate(goods);
    }

    @Override
    public void goodDelete(Integer id) {
        goodsMapper.goodDelete(id);
    }

    public List<GoodsVO> copyBean(List<Goods> goodsList){
        if (goodsList.size() > 0) {
            ArrayList<GoodsVO> goodsVOList = new ArrayList<>();
            for (Goods goods : goodsList){
                GoodsVO goodsVO = new GoodsVO();
                BeanUtils.copyProperties(goods, goodsVO);
                goodsVO.setIsTop(false);
                Types types = typesMapper.selectTypesById(goods.getType_id());
                if (null != types) {
                    goodsVO.setTypeName(types.getName());
                }
                List<Tops> topsList = topsMapper.selectGoodsIdInTops();
                if (topsList.size() > 0) {
                    for (Tops tops : topsList) {
                        if (goodsVO.getId() == tops.getGood_id()) {
                            goodsVO.setIsTop(true);
                            break;
                        }
                    }
                }
                goodsVOList.add(goodsVO);
            }
            return goodsVOList;
        }
        return null;
    }
}
