package com.Sportsbackend;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.DAO.SupplierDao;
import com.model.Supplier;

public class SupplierDAOTest {

static SupplierDao supplierDao;
	
	@BeforeClass
	public static void initialize() {
		AnnotationConfigApplicationContext configApplnContext = new AnnotationConfigApplicationContext();
		configApplnContext.scan("com");
		configApplnContext.refresh();

		// SessionFactory
		// sessionFactory=(SessionFactory)configApplnContext.getBean("sessionFactory");
		supplierDao = (SupplierDao) configApplnContext.getBean("supplierDao");
		System.out.println(supplierDao);
	}
	@Test
	public void addSuppliertest() {
		Supplier supplier = new Supplier();
		supplier.setSupplierName("Ram");
		supplier.setSupplierAddress("Raipur");
		supplier.setSupplierId(1001);
		assertTrue(supplierDao.addSupplier(supplier));
	}

}
