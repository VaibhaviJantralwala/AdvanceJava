package com.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

import com.dao.dataDaoImple;
import com.model.Product;

/**
 * Servlet implementation class productServlet
 */
@MultipartConfig
@WebServlet("/productServlet")
public class productServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action = request.getParameter("action");
		
		if( action.equals("edit")) {
			//edit code
			String id = request.getParameter("id");
			dataDaoImple dd = new dataDaoImple();
			Product product = dd.fetchProduct(Integer.parseInt(id));
			
			if(product != null && product.getpImg() != null) {
				
				InputStream is = product.getpImg();
				
				ByteArrayOutputStream buffer = new ByteArrayOutputStream();
				int read;
				byte[] data = new byte[1024];
				
				while( (read = is.read(data)) != -1 ) {
					buffer.write(data,0,read);
				}
				
				String base64Img = Base64.getEncoder().encodeToString(buffer.toByteArray());
				
				product.setBase64Image(base64Img);
			}
			
			if( product != null ) {
				request.setAttribute("edit", product);
				RequestDispatcher rd = request.getRequestDispatcher("editData.jsp");
				rd.forward(request, response);
			}
		}
		
		else if ("delete".equals(action)) {
	        // DELETE logic — was empty before
	        String id = request.getParameter("id");
	        dataDaoImple dd = new dataDaoImple();
	        dd.deleteProduct(Integer.parseInt(id));  // add this method to your DAO
	        response.sendRedirect("showAllProduct");  // redirect back to list
	    }
		
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String pName = request.getParameter("pName");
		String pPrice = request.getParameter("pPrice");
		String pDesc = request.getParameter("pDesc");
		String pCategory = request.getParameter("pCategory");
		String pSubCategory = request.getParameter("pSubCategory");
		String pStock = request.getParameter("pStock");
		
		Part pImg = request.getPart("pImg");
		InputStream is = pImg.getInputStream();
		
		Product product = new Product();
		product.setpName(pName);
		product.setpPrice(pPrice);
		product.setpDesc(pDesc);
		product.setpCategory(pCategory);
		product.setpSubCategory(pSubCategory);
		product.setpStock(pStock);
		product.setpImg(is);
		
		dataDaoImple dd = new dataDaoImple();
		
		String s = dd.insertProduct(product);
		System.out.println("DAO returned: " + s);
		
		if( s.equals("success") ) {
			RequestDispatcher rd = request.getRequestDispatcher("AdminHomePage.jsp");
			rd.forward(request, response);
			return;
		}	
		
		doGet(request, response);
	}

}
