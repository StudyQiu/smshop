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
public class Types implements Serializable {
    private static final long serialVersionUID = 6304072659073493997L;
    private Integer id;
    private String name;
    private Integer num;
}
