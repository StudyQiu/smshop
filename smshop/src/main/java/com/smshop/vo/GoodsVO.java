package com.smshop.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class GoodsVO implements Serializable {
    private static final long serialVersionUID = -9017888988968312341L;
    private Integer id;
    private String cover;
    private String name;
    private String intro;
    private String spec;
    private Integer price;
    private Integer stock;
    private Integer sales;
    private String content;
    private Integer type_id;
    private String typeName;
    private Boolean isTop;
}
