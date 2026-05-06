package com.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.jasper.compiler.Node.ForwardAction;
import java.util.Base64;

import com.dao.dataDaoImple;
import com.model.Product;

/**
 * Servlet implementation class showAllProduct
 */
@MultipartConfig
@WebServlet("/showAllProduct")
public class showAllProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showAllProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		dataDaoImple dd = new dataDaoImple();
		List <Product> li = dd.showAllproduct();
		request.setAttribute("data", li);
		
		for(Product p : li) {
			
			InputStream is = p.getpImg();
			
			if( is != null ) {
				byte[] bytes = is.readAllBytes();
				 String base64Image = Base64.getEncoder().encodeToString(bytes);
				 p.setBase64Image(base64Image);
			}
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("showAllProduct.jsp");
		rd.forward(request, response);
		
		
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
