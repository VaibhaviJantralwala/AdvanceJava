package com.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jdbcConnection.jdbcConn1;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.dao.dataDaoImple;
import com.model.Student;

/**
 * Servlet implementation class registerServlet
 */

@WebServlet("/StudentregisterServlet")
@MultipartConfig
public class StudentregisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentregisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//		PrintWriter pw = response.getWriter();
//		pw.println("Hello");
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String city = request.getParameter("city");
		
		String date = request.getParameter("date");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate localDate = LocalDate.parse(date, formatter);
		Date sqlDate = Date.valueOf(localDate);
		
		String lan[]=request.getParameterValues("lang");
		String landata=String.join(",", lan);
		
		Part file = request.getPart("file");
		String fileName = file.getSubmittedFileName();
		String uploadPath =	"C:/uploads/" + fileName;
		InputStream is = file.getInputStream();
		file.write(uploadPath);	
			
		Student student = new Student();
		student.setName(username);
		student.setPassword(password);
		student.setEmail(email);
		student.setGender(gender);
		student.setCity(city);
		student.setDob(sqlDate);
		student.setLanguage(landata);
		student.setImage(is);
		
		dataDaoImple dao = new dataDaoImple();
//		String s = dao.insertData(student);
		
//		if( s.equals("success")) {
//			RequestDispatcher rd=request.getRequestDispatcher("Homepage.jsp");
//			rd.forward(request, response);
//		}
		
		doGet(request, response);
	}

}
