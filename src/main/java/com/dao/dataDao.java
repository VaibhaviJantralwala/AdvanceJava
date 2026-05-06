package com.dao;

import java.util.List;

import com.model.Admin;
import com.model.Customer;
import com.model.Product;
import com.model.Student;

public interface dataDao {

	// insert user
//	public String insertUser(Student student);
	
	// insert user
	public String insertUser(Customer customer);
	
	// login user
	public Customer login(String email,String password);
	
	// admin login
	public Admin adminLogin(String email,String password);
	
	// product insert by admin
	public String insertProduct(Product product);
	
	//show product data
	public List<Product> showAllproduct();
	
	// fetch product
	public Product fetchProduct(int id);
	
	// update/edit product
	public String updateProduct(Product product);
	
	// delete product
	public void deleteProduct(int id);
	
	// fetch product by category
	public List<Product> showAllproductCategory(String category);

}
