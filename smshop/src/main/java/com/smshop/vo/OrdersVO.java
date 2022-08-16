package com.smshop.vo;

import com.smshop.entity.Items;
import com.smshop.entity.Users;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class OrdersVO {

    private Integer id;
    private Integer total;
    private Integer amount;
    private Integer status;
    private Integer paytype;
    private String name;
    private String phone;
    private String address;
    private Date systime;
    private String username;
    private List<Items> itemsList;

}
