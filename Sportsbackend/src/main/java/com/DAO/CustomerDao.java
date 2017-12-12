package com.DAO;

import java.util.List;

import com.model.Customer;

public interface CustomerDao {

	void addCustomer(Customer customer);

	List<Customer> getAllCustomers();

	public Customer getCustomerByUsername(String username);
}
