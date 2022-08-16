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
public class Carts implements Serializable {
    private static final long serialVersionUID = -5255372282465543641L;
    private Integer id;
    private Integer amount;
    private Integer good_id;
    private Integer user_id;
    private Goods goods;
    private Integer total;
}
