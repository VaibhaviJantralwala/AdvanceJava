package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Map;

/**
 * Servlet implementation class updateCart
 */
@WebServlet("/updateCart")
public class updateCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		Map<Integer, Integer> cart=(Map<Integer, Integer> )   session.getAttribute("cart");
		if(cart!=null)
		{
			
			String action=request.getParameter("action");
			String pid=request.getParameter("pID");
			
			if (action != null && pid != null) {
				   int pId = Integer.parseInt(pid);
				   int qty= cart.getOrDefault(pId, 0);
				  
				   if ("inc".equals(action)) {
	                    qty++;
				   }
				   else if ("dec".equals(action)) {
			 		 	qty--;
				   } 
				   else if ("remove".equals(action)) {
					   qty = 0; 
				   }
				   if (qty <= 0) {
	                    cart.remove(pId);
	                } else {
	                    cart.put(pId, qty);
	                }
			}
			session.setAttribute("cart", cart);
			response.sendRedirect("cartServlet");
		}
		
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
