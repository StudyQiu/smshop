package com.smshop.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class Goods implements Serializable {
    private static final long serialVersionUID = -3693996069785626239L;
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
}
