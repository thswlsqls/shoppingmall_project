package com.care.root.mybatis.cart;

import java.util.ArrayList;

import com.care.root.cart.dto.CartDTO;

public interface CartMapper {
	public int insertUserCart(CartDTO dto);
}
