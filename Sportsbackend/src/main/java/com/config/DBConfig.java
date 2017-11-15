package com.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.model.Cart;

import com.model.Category;
import com.model.Orders;
import com.model.Product;
import com.model.Supplier;
import com.model.User;

@Configuration
@EnableTransactionManagement
@ComponentScan("com")
public class DBConfig 
{
	
	@Bean("dataSource")
	public DataSource getH2DataSource() {
		DriverManagerDataSource driverMgrDataSource = new DriverManagerDataSource();
		driverMgrDataSource.setDriverClassName("org.h2.Driver");
		driverMgrDataSource.setUrl("jdbc:h2:tcp://localhost/~/abcd");
		driverMgrDataSource.setUsername("sa");
		driverMgrDataSource.setPassword("");
		return driverMgrDataSource;

	}

	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory() {
		Properties hibernateProperties = new Properties();
		hibernateProperties.setProperty("hibernate.hbm2ddl.auto", "update");
		hibernateProperties.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
		hibernateProperties.put("hibernate.show_sql",true);

		LocalSessionFactoryBuilder localSessionFacBuilder = new LocalSessionFactoryBuilder(getH2DataSource());
		localSessionFacBuilder.addProperties(hibernateProperties);
		localSessionFacBuilder.addAnnotatedClass(Category.class);
		localSessionFacBuilder.addAnnotatedClass(Product.class);
		localSessionFacBuilder.addAnnotatedClass(Supplier.class);
		localSessionFacBuilder.addAnnotatedClass(Cart.class);
		
		localSessionFacBuilder.addAnnotatedClass(Orders.class);
		localSessionFacBuilder.addAnnotatedClass(User.class);
		
		SessionFactory sessionFactory = localSessionFacBuilder.buildSessionFactory();
		System.out.println("Session Factory Object Created");
		System.out.println(sessionFactory);
		return sessionFactory;
	}

	@Bean(name="hibernatetransactionmanager")
	public HibernateTransactionManager getHibernateTransactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager hibernateTranMgr = new HibernateTransactionManager(sessionFactory);
		return hibernateTranMgr;
	}
/*	@Autowired
	@Bean(name="ordersDaoImpl")
	public OrdersDaoImpl getOrdersData(SessionFactory sessionFac)
	{
		return new OrdersDaoImpl(sessionFac);
	}*/
	
	
	
	
}
