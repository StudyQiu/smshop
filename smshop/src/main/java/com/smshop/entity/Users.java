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
public class Users implements Serializable {
    private static final long serialVersionUID = 6684718295297530836L;
    private Integer id;
    private String username;
    private String password;
    private String name;
    private String phone;
    private String address;
}
