package com.smshop.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class Tops {
    public static final byte TYPE_TODAY = 1;
    private Integer id;
    private Byte type;
    private Integer good_id;
}
