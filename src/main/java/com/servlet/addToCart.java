package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import com.dao.dataDaoImple;
import com.model.Product;

/**
 * Servlet implementation class addToCart
 */
@WebServlet("/addToCart")
public class addToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		
		Map<Integer,Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
		
		if(cart == null) {
		    cart = new LinkedHashMap<>(); 
		}
		
		if( "add".equals(action)) {
			int pID = Integer.parseInt(request.getParameter("pID"));
			
			dataDaoImple dd = new dataDaoImple();
			Product p = dd.fetchProduct(pID);
			
			// If already in cart, increment. Else add with qty 1
		    if(cart.containsKey(pID)) {
		        cart.put(pID, cart.get(pID) + 1);
		    } else {
		        cart.put(pID, 1);
		    }
			
			session.setAttribute("cart", cart);

			response.sendRedirect("userServlet");
		}
		
		

		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);		
	}

}
