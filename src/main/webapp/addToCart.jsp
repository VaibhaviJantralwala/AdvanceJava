<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="com.model.Product" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.InputStream" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FoodMart - Cart</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600&family=Inter:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', sans-serif; background: #FDF6EE; min-height: 100vh; }

        .navbar { background: #2C1810; padding: 16px 32px; display: flex; justify-content: space-between; align-items: center; }
        .navbar h1 { font-family: 'Playfair Display', serif; color: white; font-size: 22px; }
        .nav-links { display: flex; gap: 24px; }
        .nav-links a { color: #C96A2B; text-decoration: none; font-size: 14px; font-weight: 500; }

        .content { padding: 32px; display: flex; gap: 28px; align-items: flex-start; }

        .cart-section { flex: 2; }
        .cart-title { font-family: 'Playfair Display', serif; font-size: 26px; color: #2C1810; margin-bottom: 20px; }

        .cart-table { width: 100%; border-collapse: collapse; background: white; border-radius: 16px; overflow: hidden; box-shadow: 0 4px 20px rgba(0,0,0,0.06); }
        .cart-table thead { background: #2C1810; color: white; }
        .cart-table thead th { padding: 14px 18px; text-align: left; font-size: 13px; font-weight: 500; }
        .cart-table tbody tr { border-bottom: 1px solid #F5F0EB; }
        .cart-table tbody tr:last-child { border-bottom: none; }
        .cart-table tbody td { padding: 14px 18px; font-size: 14px; color: #444; vertical-align: middle; }

        .product-cell { display: flex; align-items: center; gap: 12px; }
        .product-cell img { width: 56px; height: 56px; object-fit: cover; border-radius: 10px; }
        .product-name { font-weight: 500; color: #2C1810; font-size: 14px; }
        .product-cat { font-size: 12px; color: #C96A2B; }
        .price-cell { font-weight: 600; color: #2C1810; font-size: 15px; }
        .qty-badge { background: #FDF6EE; border: 1.5px solid #C96A2B; color: #C96A2B; padding: 4px 14px; border-radius: 20px; font-weight: 600; font-size: 13px; }
        .remove-btn { color: #e53935; font-size: 12px; text-decoration: none; padding: 4px 10px; border: 1px solid #e53935; border-radius: 6px; transition: all 0.2s; }
        .remove-btn:hover { background: #e53935; color: white; }

        .empty-cart { text-align: center; padding: 60px; color: #999; font-size: 15px; background: white; border-radius: 16px; }
        .empty-cart a { color: #C96A2B; text-decoration: none; font-weight: 500; }

        .payment-section { flex: 1; position: sticky; top: 20px; }
        .payment-card { background: white; border-radius: 16px; padding: 24px; box-shadow: 0 4px 20px rgba(0,0,0,0.06); margin-bottom: 16px; }
        .payment-title { font-family: 'Playfair Display', serif; font-size: 20px; color: #2C1810; margin-bottom: 20px; }

        .summary-row { display: flex; justify-content: space-between; font-size: 14px; color: #666; margin-bottom: 10px; }
        .summary-row.total { font-weight: 700; color: #2C1810; font-size: 16px; border-top: 1px solid #F5F0EB; padding-top: 12px; margin-top: 4px; }

        .method-options { display: flex; flex-direction: column; gap: 8px; margin-bottom: 16px; }
        .method-btn { display: flex; align-items: center; gap: 10px; padding: 10px 14px; border: 1.5px solid #EEE; border-radius: 10px; cursor: pointer; transition: all 0.2s; font-size: 13px; color: #444; background: white; }
        .method-btn:hover { border-color: #C96A2B; color: #C96A2B; }
        .method-btn.selected { border-color: #C96A2B; background: #FDF6EE; color: #C96A2B; font-weight: 500; }

        .upi-input { width: 100%; padding: 10px 14px; border: 1.5px solid #EEE; border-radius: 10px; font-size: 13px; margin-bottom: 8px; outline: none; font-family: 'Inter', sans-serif; }
        .upi-input:focus { border-color: #C96A2B; }

        .pay-btn { width: 100%; padding: 14px; background: #C96A2B; color: white; border: none; border-radius: 12px; font-size: 15px; font-weight: 600; cursor: pointer; transition: background 0.2s; font-family: 'Inter', sans-serif; }
        .pay-btn:hover { background: #A8521E; }
        .secure-note { text-align: center; font-size: 11px; color: #aaa; margin-top: 10px; }
    </style>
</head>
<body>

<div class="navbar">
    <h1>FoodMart</h1>
    <div class="nav-links">
        <a href="userServlet">← Continue Shopping</a>
        <a href="logoutServlet">Logout</a>
    </div>
</div>

<%
    Map<Product, Integer> cart = (Map<Product,Integer>) request.getAttribute("cartData");
    double grandTotal = 0;
    int totalItems = 0;
    if (cart != null) {
        for(Map.Entry<Product,Integer> entry : cart.entrySet()){
        	 try{
        		 grandTotal += Double.parseDouble(entry.getKey().getpPrice()) * entry.getValue(); 
                 totalItems += entry.getValue();
        	 }catch(Exception e){}
        }
    }
%>

<div class="content">

    <div class="cart-section">
        <h2 class="cart-title">Your Cart 🛒</h2>
        <% if (cart == null || cart.isEmpty()) { %>
            <div class="empty-cart">
                <p style="font-size:40px; margin-bottom:12px;">🛒</p>
                <p>Your cart is empty!</p><br>
                <a href="userServlet">Start Shopping →</a>
            </div>
        <% } else { %>
            <table class="cart-table">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Qty</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                <% for (Map.Entry<Product,Integer> entry : cart.entrySet()) {
                	 Product p = entry.getKey();  
                	    Integer qty = entry.getValue();   
                	    
                	    String base64Img = p.getBase64Image() != null ? p.getBase64Image() : "";
                %>
                    <tr>
                        <td>
                            <div class="product-cell">
                                <% if (!base64Img.isEmpty()) { %>
                                    <img src="data:image/jpeg;base64,<%= base64Img %>" alt="<%= p.getpName() %>">
                                <% } %>
                                <div>
                                    <div class="product-name"><%= p.getpName() %></div>
                                    <div class="product-cat"><%= p.getpSubCategory() %></div>
                                </div>
                            </div>
                        </td>
                        <td><%= p.getpCategory() %></td>
                        <td class="price-cell">₹<%= p.getpPrice() %></td>
                        
                        <td>
                        		 <div style="display:flex; align-items:center; gap:8px;">
        						<a href="updateCart?action=dec&pID=<%= p.getpID() %>" 
           					style="text-decoration:none; background:#f5f0eb; border:1.5px solid #C96A2B; 
                  			color:#C96A2B; width:28px; height:28px; border-radius:50%; 
                  			display:flex; align-items:center; justify-content:center; font-weight:bold;">−</a>
        
        					<span class="qty-badge"><%= qty %></span>
        
        						<a href="updateCart?action=inc&pID=<%= p.getpID() %>" 
         				  style="text-decoration:none; background:#C96A2B; border:1.5px solid #C96A2B; 
                  		color:white; width:28px; height:28px; border-radius:50%; 
                  		display:flex; align-items:center; justify-content:center; font-weight:bold;">+</a>
    						</div>
                        </td>
                        <td><a href="updateCart?action=remove&pID=<%= p.getpID() %>" class="remove-btn">Remove</a></td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        <% } %>
    </div>

    <div class="payment-section">
        <div class="payment-card">
            <h3 class="payment-title">Order Summary</h3>
            <div class="summary-row"><span>Items (<%= totalItems %>)</span><span>₹<%= String.format("%.2f", grandTotal) %></span></div>
            <div class="summary-row"><span>Delivery</span><span style="color:#2e7d32;">FREE</span></div>
            <div class="summary-row"><span>Discount</span><span style="color:#e53935;">- ₹0.00</span></div>
            <div class="summary-row total"><span>Total</span><span>₹<%= String.format("%.2f", grandTotal) %></span></div>
        </div>

        <div class="payment-card">
            <h3 class="payment-title">Payment Method</h3>
            <div class="method-options">
                <div class="method-btn selected" onclick="selectMethod(this, 'upi')"><span>📱</span> UPI</div>
                <div class="method-btn" onclick="selectMethod(this, 'card')"><span>💳</span> Credit / Debit Card</div>
                <div class="method-btn" onclick="selectMethod(this, 'cod')"><span>💵</span> Cash on Delivery</div>
                <div class="method-btn" onclick="selectMethod(this, 'netbanking')"><span>🏦</span> Net Banking</div>
            </div>

            <div id="upi-section">
                <input type="text" class="upi-input" placeholder="Enter UPI ID (e.g. name@upi)">
            </div>
            <div id="card-section" style="display:none;">
                <input type="text" class="upi-input" placeholder="Card Number">
                <div style="display:flex; gap:8px;">
                    <input type="text" class="upi-input" placeholder="MM/YY">
                    <input type="text" class="upi-input" placeholder="CVV">
                </div>
            </div>

			<a href="checkoutServlet?"><button class="pay-btn">Pay ₹<%= String.format("%.2f", grandTotal) %></button></a>
            
            <p class="secure-note">🔒 100% Secure & Encrypted Payment</p>
        </div>
    </div>
</div>

<script>
    function selectMethod(el, type) {
        document.querySelectorAll('.method-btn').forEach(b => b.classList.remove('selected'));
        el.classList.add('selected');
        document.getElementById('upi-section').style.display = 'none';
        document.getElementById('card-section').style.display = 'none';
        if (type === 'upi') document.getElementById('upi-section').style.display = 'block';
        if (type === 'card') document.getElementById('card-section').style.display = 'block';
    }
</script>

</body>
</html>