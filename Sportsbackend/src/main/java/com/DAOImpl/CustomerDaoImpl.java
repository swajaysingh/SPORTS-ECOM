package com.DAOImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DAO.CustomerDao;
import com.model.Cart;
import com.model.Customer;
import com.model.User;

@Repository("cdao")
@Transactional
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	private SessionFactory sessionFactory;

	// add a customer
	public void addCustomer(Customer customer) {
		Session session = sessionFactory.openSession();

		customer.getUser().setEnabled(true);
		customer.getUser().setRole("ROLE_USER");
		
		//String username = customer.getUser().getUserName();

		Cart cart = new Cart();
		customer.setCart(cart);      //setting cart to customer
		cart.setCustomer(customer);   //setting customer to cart

		session.save(customer);
		session.flush();
		session.close();

	}

	public List<Customer> getAllCustomers() {
		Session session = sessionFactory.openSession();
		List<Customer> customers = session.createQuery("from Customer").list();
		return customers;
	}

	public Customer getCustomerByUsername(String username) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from User where userName=?");
		query.setString(0, username);
		User user = (User) query.uniqueResult();
		Customer customer = user.getCustomer();
		return customer;
	}

}

