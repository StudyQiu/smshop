package com.smshop.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class Orders implements Serializable {
    private static final long serialVersionUID = 4944287803613644584L;
    private Integer id;
    private Integer total;
    private Integer amount;
    private Integer status;
    private Integer paytype;
    private String name;
    private String phone;
    private String address;
    private Integer user_id;
    private Date systime;
    private Users users;

}
