package com.woodcraft.dao;

import java.util.List;
import com.woodcraft.model.Product;

public interface CategoryDAO {

	public List<Product> getProductsByCategory(int categoryId);

}