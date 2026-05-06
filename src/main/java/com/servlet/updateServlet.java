package com.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;

import com.dao.dataDaoImple;
import com.model.Product;

/**
 * Servlet implementation class updateServlet
 */
@MultipartConfig
@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateServlet() {
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
		
		int pID = Integer.parseInt(request.getParameter("pID"));
		String pName = request.getParameter("pName");
		String pPrice = request.getParameter("pPrice");
		String pCategory = request.getParameter("pCategory");
		String pSubCategory = request.getParameter("pSubCategory");
		String pDesc = request.getParameter("pDesc");
		String pStock = request.getParameter("pStock");
		
		Part pImg = request.getPart("pImg");
		InputStream is = null;
		
		if (pImg != null && pImg.getSize() > 0) {
		    is = pImg.getInputStream();
		}
		
		Product product = new Product();
		
		product.setpID(pID);
		product.setpName(pName);
		product.setpPrice(pPrice);
		product.setpCategory(pCategory);
		product.setpSubCategory(pSubCategory);
		product.setpDesc(pDesc);
		product.setpStock(pStock);
		product.setpImg(is);
		
		dataDaoImple dd = new dataDaoImple();
		String s = dd.updateProduct(product);
		
		if(s.equals("success")) {
			
			 response.sendRedirect("showAllProduct"); 
		        return;
		}
		
		doGet(request, response);
	}

}
