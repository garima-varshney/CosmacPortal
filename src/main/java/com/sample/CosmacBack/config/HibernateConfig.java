package com.sample.CosmacBack.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.sample.CosmacBack.model.Authorization;
import com.sample.CosmacBack.model.Billing;
import com.sample.CosmacBack.model.Cart;
import com.sample.CosmacBack.model.Category;
import com.sample.CosmacBack.model.CustomerOrder;
import com.sample.CosmacBack.model.Product;
import com.sample.CosmacBack.model.Shipping;
import com.sample.CosmacBack.model.Supplier;
import com.sample.CosmacBack.model.Users;

@Configuration
@EnableTransactionManagement
@ComponentScan(basePackages="com.sample.CosmacBack")
public class HibernateConfig {
	
	@Bean(name="dataSource")
	public DataSource geth2DataSource()
	{
		DriverManagerDataSource dataSource=new DriverManagerDataSource();	
		dataSource.setDriverClassName("org.h2.Driver");
		dataSource.setUrl("jdbc:h2:tcp://localhost/~/project");
		dataSource.setUsername("sa");
		dataSource.setPassword("sa");
		return dataSource;		
	}	
	
	@Autowired
	@Bean(name="sessionFactory")
	public  SessionFactory getSessionFactory(DataSource dataSource)
	{
		LocalSessionFactoryBuilder sessionFactory=new LocalSessionFactoryBuilder(dataSource);
		System.out.println("-- getSessionFactory: session created --");
		sessionFactory.addAnnotatedClass(Billing.class);
		sessionFactory.addAnnotatedClass(Supplier.class);
		sessionFactory.addAnnotatedClass(Product.class);
		sessionFactory.addAnnotatedClass(Users.class);
		sessionFactory.addAnnotatedClass(Shipping.class);
		sessionFactory.addAnnotatedClass(Category.class);
		sessionFactory.addAnnotatedClass(Authorization.class);
		sessionFactory.addAnnotatedClass(Cart.class);
		sessionFactory.addAnnotatedClass(CustomerOrder.class);
		sessionFactory.addProperties(getHibernateProperties());
		System.out.println("-- getSessionFactory: properties added --");
		return sessionFactory.buildSessionFactory();					
	}
	
	public Properties getHibernateProperties()
	{
		Properties properties=new Properties();
		System.out.println("-- getHibernateProperties: adding properties --");
		properties.setProperty("hibernate.hbm2ddl.auto","update");
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
		return properties;
	}
	
	@Autowired
	@Bean
	public HibernateTransactionManager geTransactionManager(SessionFactory sessionFactory)
	{
		HibernateTransactionManager transactionManager=new HibernateTransactionManager();
		transactionManager.setSessionFactory(sessionFactory);
		return transactionManager;
	}

}