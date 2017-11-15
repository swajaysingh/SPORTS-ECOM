package com.DAOImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DAO.CartDao;
import com.model.Cart;

@Repository("cartDao")
@Transactional
public class CartDaoImpl implements CartDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public CartDaoImpl(SessionFactory sessionFactory)
	{
		this.sessionFactory=sessionFactory;
	}
	public void insert(Cart cart) {
		 Session session = sessionFactory.openSession();
		    session.beginTransaction();
		    session.persist(cart);
		    session.getTransaction().commit();
		
	}

	public List<Cart> findCartById(String userId) {
		Session session = sessionFactory.openSession();
		List<Cart> cart = null;
	
		session.beginTransaction();
		Query query = session.createQuery("from Cart where email = :useremail");
		query.setParameter("useremail", userId);
		cart = query.list();
		return cart;
		
		
	}

	public Cart getCart(int cartId, String usermail) {
		  Session session = sessionFactory.openSession();
		    Cart cart = null;
		    try
		    {
		    	 session.beginTransaction();
		    	 cart = (Cart)session.createQuery("from Cart where email = mail and cartProductId = id").setString("mail", usermail).setInteger("id", cartId).uniqueResult();
		         session.getTransaction().commit();
		         
		    }
		    catch(Exception e)
		    {
		    	
		    }
		    return cart;
		
	}

	public boolean deleteCart(int cartId) {
		Session session = sessionFactory.openSession();
		   session.beginTransaction();
		   Cart cr = (Cart) session.get(Cart.class, cartId);
		   session.delete(cr);
		   session.getTransaction().commit();
		   return true;
	}

	public void updateCart(Cart cart) {
		Session session = sessionFactory.openSession();
	    session.beginTransaction();
	    session.update(cart);
	    session.getTransaction().commit();
		
	}

	

}
