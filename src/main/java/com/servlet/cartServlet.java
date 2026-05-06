package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.Map;

import com.dao.dataDaoImple;
import com.model.Product;

/**
 * Servlet implementation class cartServlet
 */
@WebServlet("/cartServlet")
public class cartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();

		Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
		Map<Product, Integer> cartDisplay = new LinkedHashMap<>();

		if(cart != null) {
		    dataDaoImple dd = new dataDaoImple();
		    for(Map.Entry<Integer, Integer> entry : cart.entrySet()) {
		        Product p = dd.fetchProduct(entry.getKey());
		        // Image convert 
	            try {
	                InputStream is = p.getpImg();
	                if(is != null) {
	                    byte[] bytes = is.readAllBytes();
	                    String base64 = Base64.getEncoder().encodeToString(bytes);
	                    p.setBase64Image(base64);
	                }
	            } catch(Exception e) {
	                e.printStackTrace();
	            }
		        
		        cartDisplay.put(p, entry.getValue());
		    }
		}

		 request.setAttribute("cartData", cartDisplay);   
	     request.getRequestDispatcher("addToCart.jsp").forward(request, response);

       
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
