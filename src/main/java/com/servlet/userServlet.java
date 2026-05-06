package com.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.List;

import com.dao.dataDaoImple;
import com.model.Product;

/**
 * Servlet implementation class userServlet
 */
@WebServlet("/userServlet")
public class userServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pcategory = request.getParameter("category");
		
		dataDaoImple dd = new dataDaoImple();
		List <Product> li;
		
		 if ( pcategory == null || pcategory.isEmpty() ) {
		        li = dd.showAllproduct();
		    } else {
		        li = dd.showAllproductCategory(pcategory);
		    }
		 
//		 System.out.println("list size : "+li.size());
		
		for(Product p : li) {
			
			InputStream is = p.getpImg();
			
			if( is != null ) {
				byte[] bytes = is.readAllBytes();
				 String base64Image = Base64.getEncoder().encodeToString(bytes);
				 p.setBase64Image(base64Image);
			}
		}
		
		request.setAttribute("data", li);
		
//		System.out.println("session set : "+request.getSession().getAttribute("data"));
		
		RequestDispatcher rd = request.getRequestDispatcher("HomePage.jsp");
		rd.forward(request, response);
		
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
	}

}
