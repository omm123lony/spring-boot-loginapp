package com.demo.test.config;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;


@Configuration
@PropertySource("classpath:application.properties")
@ComponentScan(basePackages={"com.demo.test"})
@EnableTransactionManagement
public class DatabaseConfig {

	@Autowired
	private Environment env;
	
	@Bean
	public DataSource getDataSource() {
	
		final String DRIVERCLASSNAME = env.getProperty("spring.datasource.driver-class-name");
		final String URL = env.getProperty("spring.datasource.url");
		final String USERNAME = env.getProperty("spring.datasource.username");
		final String PASSWORD = env.getProperty("spring.datasource.password");
		

		DataSourceBuilder dataSourceBuilder = DataSourceBuilder.create();
        dataSourceBuilder.driverClassName(DRIVERCLASSNAME);
        dataSourceBuilder.url(URL);
        dataSourceBuilder.username(USERNAME);
        dataSourceBuilder.password(PASSWORD);
        return dataSourceBuilder.build();
	}
	
	@Bean
	public JpaTransactionManager transactionManager(EntityManagerFactory emf) {
	    JpaTransactionManager transactionManager = new JpaTransactionManager();
	    transactionManager.setEntityManagerFactory(emf);
	    return transactionManager;
	}
	
}
