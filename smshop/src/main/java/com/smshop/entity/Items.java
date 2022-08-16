package com.smshop.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class Items {
    private Integer id;
    private Integer price;
    private Integer amount;
    private Integer order_id;
    private Integer good_id;
    private Goods goods;
}
