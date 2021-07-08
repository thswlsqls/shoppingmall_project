package com.care.root.mybatis.order;

import java.util.ArrayList;

import com.care.root.order.dto.OrderDTO;
import com.care.root.order.dto.OrderDetailsDTO;

public interface OrderMapper {
	public ArrayList<String> getUserOrdersDeleveryStates(String memberIdx);
	public ArrayList<OrderDTO> getUserOrders(String memberIdx);
}
