
package com.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Admin;
import com.model.Customer;
import com.model.Product;
import com.model.Student;

import jakarta.servlet.RequestDispatcher;
import jdbcConnection.jdbcConn1;

public class dataDaoImple implements dataDao {

	jdbcConn1 conn=new jdbcConn1();

//	@Override
//	public String insertData(Student student) {
//		// TODO Auto-generated method stub
//		
//		try {
//			Connection con = conn.gConnection();
//			PreparedStatement psmt=con.prepareStatement("insert into customer (name,password,email,dob,gender,language,city,image) values(?,?,?,?,?,?,?,?)");
//
//			psmt.setString(1, student.getName());
//			psmt.setString(2, student.getPassword());
//			psmt.setString(3, student.getEmail());
//			psmt.setDate(4,student.getDob());
//			psmt.setString(5, student.getGender());
//			psmt.setString(6, student.getLanguage());
//			psmt.setString(7, student.getCity());
//			psmt.setBlob(8, student.getImage());
//			
//			int i=psmt.executeUpdate();
//			if(i>0) {
//				return "success";
//			}
//		
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return null;
//	}

	@Override
	public Customer login(String email, String password) {
		// TODO Auto-generated method stub
		Customer s = null;
		try {
			Connection con = conn.gConnection();
			PreparedStatement pstmt = con.prepareStatement("select * from Customer where email = ? and password = ?");
			
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				s = new Customer();
				s.setEmail(rs.getString("email"));
				s.setPassword(rs.getString("password"));
			}
			
			return s;
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return s;
	}

	@Override
	public Admin adminLogin(String email, String password) {
		// TODO Auto-generated method stub
		
		Admin a = null;
		
		try {
			Connection con = conn.gConnection();
			PreparedStatement pstmt = con.prepareStatement("select * from admin where email = ? and password = ?");
			
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				a = new Admin();
				a.setEmail(rs.getString("email"));
				a.setPassword(rs.getString("password"));
			}
			
			return a;
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return a;
	}

	@Override
	public String insertProduct(Product product) {
		// TODO Auto-generated method stub
		
		try {
			Connection con = conn.gConnection();
			PreparedStatement pstmt = con.prepareStatement("insert into product(pName,pPrice,pCategory,pSubCategory,pStock,pImg,pDesc) values(?,?,?,?,?,?,?)");
			
			pstmt.setString(1, product.getpName());
			pstmt.setString(2, product.getpPrice());
			pstmt.setString(3, product.getpCategory());
			pstmt.setString(4, product.getpSubCategory());
			pstmt.setString(5, product.getpStock());
			pstmt.setBlob(6, product.getpImg());
			pstmt.setString(7, product.getpDesc());
			
			int i = pstmt.executeUpdate();
			
			if( i > 0 ) {
				
				return "success";
				
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List<Product> showAllproduct() {
		// TODO Auto-generated method stub
		
		List<Product> list = new ArrayList<Product>();
		
		try {
			Connection con = conn.gConnection();
			PreparedStatement pstmt = con.prepareStatement("select * from product");
			ResultSet rs = pstmt.executeQuery();
			
			Product product = null;
			
			while( rs.next() ) {
				
				product = new Product();
				product.setpID(rs.getInt("pID"));
				product.setpName(rs.getString("pName"));
				product.setpPrice(rs.getString("pPrice"));
				product.setpCategory(rs.getString("pCategory"));
				product.setpSubCategory(rs.getString("pSubCategory"));
				product.setpStock(rs.getString("pStock"));
				product.setpDesc(rs.getString("pDesc"));
				
				InputStream is = rs.getBinaryStream("pImg");
				product.setpImg(is);
				
				list.add(product);
				
			}
			
			return list;
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	public Product fetchProduct(int id) {
		// TODO Auto-generated method stub
		
		Product product = null;
		
		try {
			Connection con = conn.gConnection();
			PreparedStatement pstmt = con.prepareStatement("select * from product where pID=?");
	
			pstmt.setInt(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				product=new Product();
				product.setpID(rs.getInt("pID"));
				product.setpName(rs.getString("pName"));
				product.setpPrice(rs.getString("pPrice"));
				product.setpCategory(rs.getString("pCategory"));
				product.setpSubCategory(rs.getString("pSubCategory"));
				product.setpStock(rs.getString("pStock"));
				product.setpDesc(rs.getString("pDesc"));
				InputStream imageStream = rs.getBinaryStream("pImg");
				product.setpImg(imageStream);
			}
			
			return product;
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String updateProduct(Product product) {
		// TODO Auto-generated method stub
	
		try {
			Connection con = conn.gConnection();
			PreparedStatement pstmt;
			
			if (product.getpImg() != null) {
		
	        pstmt = con.prepareStatement(
	            "UPDATE product SET pName=?, pPrice=?, pCategory=?, pSubCategory=?, pStock=?,pImg=?, pDesc=? WHERE pID=?"
	        );
	        pstmt.setString(1, product.getpName());
	        pstmt.setString(2, product.getpPrice());
	        pstmt.setString(3, product.getpCategory());
	        pstmt.setString(4, product.getpSubCategory());
	        pstmt.setString(5, product.getpStock());
	        pstmt.setBlob(6, product.getpImg());
	        pstmt.setString(7, product.getpDesc());
	        pstmt.setInt(8, product.getpID());
			}
			else {
				 pstmt = con.prepareStatement(
			                "UPDATE product SET pName=?, pPrice=?, pCategory=?, pSubCategory=?, pStock=?, pDesc=? WHERE pID=?"
			            );
			            pstmt.setString(1, product.getpName());
			            pstmt.setString(2, product.getpPrice());
			            pstmt.setString(3, product.getpCategory());
			            pstmt.setString(4, product.getpSubCategory());
			            pstmt.setString(5, product.getpStock());
			            pstmt.setString(6, product.getpDesc());
			            pstmt.setInt(7, product.getpID());
			}
	        int i = pstmt.executeUpdate();
	        
	        if( i > 0 ) {
	        		return "success";
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }	
		
		return null;
	}

	@Override
	public void deleteProduct(int id) {
	    try {
	    		Connection con = conn.gConnection();
	        PreparedStatement ps = con.prepareStatement("DELETE FROM product WHERE pID = ?");
	        ps.setInt(1, id);
	        ps.executeUpdate();
	        ps.close();
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	@Override
	public List<Product> showAllproductCategory(String category) {
		// TODO Auto-generated method stub
		List<Product> li = new ArrayList<>();
		Product p = null;
		
		try {
			Connection con = conn.gConnection();
			PreparedStatement pst =con.prepareStatement("select * from product where pCategory = ?");
			pst.setString(1, category);
			ResultSet rs = pst.executeQuery();
			
			while( rs.next() ) {
				p = new Product();
				p.setpID(rs.getInt("pID"));
				p.setpName(rs.getString("pName"));
				p.setpPrice(rs.getString("pPrice"));
				p.setpCategory(rs.getString("pCategory"));
				p.setpSubCategory(rs.getString("pSubCategory"));
				InputStream imageStream = rs.getBinaryStream("pImg");
				p.setpImg(imageStream);
				p.setpStock(rs.getString("pStock"));
				p.setpDesc(rs.getString("pDesc"));
				
				li.add(p);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return li;
	}

	@Override
	public String insertUser(Customer customer) {
		// TODO Auto-generated method stub
		
		try {
			Connection con = conn.gConnection();
			PreparedStatement pstmt = con.prepareStatement("insert into customer(name,email,mobNum,password) values(?,?,?,?)");
			
			pstmt.setString(1, customer.getName());
			pstmt.setString(2, customer.getEmail());
			pstmt.setString(3, customer.getMobNum());
			pstmt.setString(4, customer.getPassword());
			
			int i = pstmt.executeUpdate();
			
			if( i > 0 ) {
				return "success";
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		return null;
	}
}
