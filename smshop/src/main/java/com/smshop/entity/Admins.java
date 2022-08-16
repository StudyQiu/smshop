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
public class Admins implements Serializable {
    private static final long serialVersionUID = 8372209417765798465L;
    private Integer id;
    private String username;
    private String password;
}
