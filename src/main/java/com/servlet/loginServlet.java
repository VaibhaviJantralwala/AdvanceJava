package com.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.PreparedStatement;

import com.dao.dataDaoImple;
import com.model.Customer;
import com.model.Student;

/**
 * Servlet implementation class loginServlet
 */
@MultipartConfig
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
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
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String redirect = request.getParameter("redirect");
		
		dataDaoImple dd = new dataDaoImple();
		Customer s = dd.login(email, password);
		
		if(s != null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("user", s);
		    
			if( redirect.equals("cart") ) {
				// go to payment page
				response.sendRedirect("checkoutServlet");
			}else {
				// go to homepage
				response.sendRedirect("userServlet");
			}
		    
		} else {
		    response.sendRedirect("ErrorPage.jsp");
		    return;
		}
		
//		doGet(request, response);
	}

}
