package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.model.Student;

import jakarta.servlet.RequestDispatcher;
import jdbcConnection.jdbcConn1;

public class dataDaoImple implements dataDao {

	jdbcConn1 conn=new jdbcConn1();
	Connection con = conn.gConnection();

	@Override
	public String insertData(Student student) {
		// TODO Auto-generated method stub
		
		try {
			PreparedStatement psmt=con.prepareStatement("insert into employee (name,password,email,dob,gender,language,city,image) values(?,?,?,?,?,?,?,?)");

			psmt.setString(1, student.getName());
			psmt.setString(2, student.getPassword());
			psmt.setString(3, student.getEmail());
			psmt.setDate(4,student.getDob());
			psmt.setString(5, student.getGender());
			psmt.setString(6, student.getLanguage());
			psmt.setString(7, student.getCity());
			psmt.setBlob(8, student.getImage());
			
			int i=psmt.executeUpdate();
			if(i>0) {
				return "success";
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	
}
