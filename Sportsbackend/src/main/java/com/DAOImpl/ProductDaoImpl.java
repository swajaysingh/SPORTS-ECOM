package com.DAOImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.DAO.ProductDao;
import com.model.Product;

@Repository("productDao")
@Transactional
public class ProductDaoImpl implements ProductDao {
	@Autowired
	SessionFactory sessionFactory;

	public boolean addProduct(Product product) {

		try {
			Session session = sessionFactory.openSession();
			Transaction tx = session.beginTransaction();
			session.saveOrUpdate(product);
			tx.commit();
			session.flush();
			session.close();
			return true;
		}

		catch (Exception e) {

			return false;
		}
	}

	public List<Product> retriveProduct() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Product");
		List<Product> listProducts = query.list();
		session.close();
		return listProducts;
	}

	public Product getProduct(int productId) {
		Session session = sessionFactory.openSession();
		// Product product = (Product) session.get(Product.class, productId);

		Query query = session.createQuery("from Product where productId=" + productId);
		Product product = (Product) query.uniqueResult();
		session.close();
		return product;

	}

	public boolean updateProduct(Product product) {
		try {
			System.out.println("ProductDao Update called***");
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			session.update(product);
			session.getTransaction().commit();
			session.flush();
			session.close();
			System.out.println("ProductDao Update finishd***");
			return true;
		}

		catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}
	/*
	 * Session session = sessionFactory.openSession(); Transaction tx =
	 * session.beginTransaction(); session.saveOrUpdate(product); tx.commit();
	 * session.flush(); session.close(); return true;
	 * 
	 * } catch (Exception e) { System.out.println("Exception Arised:" + e);
	 * return false; }
	 * 
	 * }
	 */

	public boolean deleteProduct(Product product) {
		try {
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			session.clear();
			session.delete(product);
			session.getTransaction().commit();
			session.flush();
			session.close();
			return true;
		}

		catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
	}
}
