package com.DAO;

import java.io.IOException;
import com.model.Cart;

public interface CartDao 
{
	Cart getCartByCartId(int cartId);

	Cart validate(int cartId) throws IOException;
	
}
