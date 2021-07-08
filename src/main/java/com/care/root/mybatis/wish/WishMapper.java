package com.care.root.mybatis.wish;

import java.util.ArrayList;
import com.care.root.wish.dto.WishDTO;

public interface WishMapper {
	public ArrayList<WishDTO> getUserWishes(String memberIdx);
	public void deleteUserWishes(String wishId);
}
