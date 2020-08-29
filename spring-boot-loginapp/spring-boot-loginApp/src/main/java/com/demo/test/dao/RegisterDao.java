package com.demo.test.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;


import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.demo.test.model.Register;


@Transactional
@Repository
public class RegisterDao {

	@PersistenceContext
	public EntityManager entityManager;

	@Transactional(readOnly=false)
	public Register insert(Register data) {
		entityManager.persist(data);
		return data;
	}
	
	public Register getUserDetails(String uname,String pass) {
		Register reg=null; 
		String sql = "select r from Register r where r.email='"+uname
				+"' and r.password='"+pass+"'";

		Query query = entityManager.createQuery(sql);
		try {
			reg=(Register) query.getSingleResult();
		}catch (Exception e) {
			
		}
		
		return  reg;
	}
}
