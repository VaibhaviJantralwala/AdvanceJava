
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="com.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<%
    Object data = request.getAttribute("data");
    if(data == null) {
        response.sendRedirect("userServlet");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FoodMart</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600&family=Inter:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', sans-serif; background: #FDF6EE; min-height: 100vh; }

        .navbar { background: #2C1810; padding: 16px 32px; display: flex; justify-content: space-between; align-items: center; }
        .navbar h1 { font-family: 'Playfair Display', serif; color: white; font-size: 22px; }
        .nav-links { display: flex; gap: 24px; }
        .nav-links a { color: #C96A2B; text-decoration: none; font-size: 14px; font-weight: 500; }

        .content { padding: 32px; }
        .page-title { font-family: 'Playfair Display', serif; font-size: 28px; color: #2C1810; margin-bottom: 8px; }
        .page-subtitle { color: #999; font-size: 14px; margin-bottom: 28px; }

        .categories { display: flex; gap: 8px; margin-bottom: 28px; flex-wrap: wrap; }
        .cat-btn {
            padding: 8px 20px; border: 1.5px solid #EEE; border-radius: 20px;
            background: white; font-size: 13px; cursor: pointer;
            color: #666; text-decoration: none; transition: all 0.2s;
            font-family: 'Inter', sans-serif;
        }
        .cat-btn:hover { border-color: #C96A2B; color: #C96A2B; }
        .cat-btn.active { background: #C96A2B; color: white; border-color: #C96A2B; }

        .menu-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(260px, 1fr)); gap: 20px; }

        .menu-card { background: white; border-radius: 16px; overflow: hidden; box-shadow: 0 4px 20px rgba(0,0,0,0.06); transition: transform 0.2s; }
        .menu-card:hover { transform: translateY(-4px); }
        .menu-card img { width: 100%; height: 180px; object-fit: cover; display: block; background: #F5F0EB; }
        .menu-card-body { padding: 18px; }
        .menu-card h3 { font-family: 'Playfair Display', serif; font-size: 17px; color: #2C1810; margin-bottom: 4px; }
        .sub-cat { font-size: 12px; color: #C96A2B; margin-bottom: 8px; }
        .desc { font-size: 13px; color: #999; margin-bottom: 14px; line-height: 1.5; }
        .menu-card-footer { display: flex; justify-content: space-between; align-items: center; }
        .price { font-size: 18px; font-weight: 600; color: #2C1810; }

        .badge { font-size: 11px; padding: 3px 10px; border-radius: 20px; font-weight: 500; display: inline-block; margin-top: 5px; }
        .in-stock  { background: #e6f4ea; color: #2e7d32; }
        .out-stock { background: #fdecea; color: #c62828; }

        .add-btn { text-decoration:none ; padding: 8px 18px; background: #C96A2B; color: white; border: none; border-radius: 8px; font-size: 13px; font-weight: 500; cursor: pointer; transition: background 0.2s; }
        .add-btn:hover { background: #A8521E; }
        .add-btn-disabled { padding: 8px 18px; background: #ddd; color: #999; border: none; border-radius: 8px; font-size: 13px; font-weight: 500; cursor: not-allowed; }

       	.empty { color: #999; font-size: 15px; padding: 60px 0; text-align: center; }
       	
       	.cart-link {
		    display: flex;
		    align-items: center;
		    gap: 8px;
		    background: rgba(201, 106, 43, 0.15);
		    border: 1px solid rgba(201, 106, 43, 0.35);
		    color: #C96A2B;
		    text-decoration: none;
		    padding: 7px 16px;
		    border-radius: 8px;
		    font-size: 13px;
		    font-weight: 500;
		}

		.cart-link:hover {
		    background: rgba(201, 106, 43, 0.25);
		}

		.cart-count {
		    background: #C96A2B;
		    color: #fff;
		    font-size: 11px;
		    font-weight: 600;
		    min-width: 19px;
		    height: 19px;
		    border-radius: 10px;
		    display: inline-flex;
		    align-items: center;
		    justify-content: center;
		    padding: 0 5px;
		}
		
    </style>
</head>
<body>


    <c:set var="cart" value="${sessionScope.cart}"/>
    <c:set var="cartCount" value="0"/>
    
   <c:if test="${not empty cart}">
    <c:forEach var="entry" items="${cart}">
        <c:set var="cartCount" value="${cartCount + entry.value}"/>
    </c:forEach>
	</c:if>
   

<div class="navbar">
    <h1>FoodMart</h1>
    
    <a href="cartServlet" class="cart-link">
    🛒 Cart <span class="cart-count"><c:out value="${cartCount}"/></span>
	</a>
    <div class="nav-links">
    
    		<a href="LoginPage.jsp">LogIn</a>
        <a href="logoutServlet">Logout</a>
        
    </div>
</div>


<div class="content">
    <h1 class="page-title">All Products</h1>
    <p class="page-subtitle">Supplied with love ❤️</p>

    <%-- Category buttons --%>
    
    <c:set var="selected" value="${param.category != null ? param.category : 'all'}"/>
    
    <div class="categories">
        
        <a href="userServlet?category=Beverages"    class="cat-btn  ${selected=='Beverages' ? 'active' : ''}">Beverages</a>
        <a href="userServlet?category=Snacks"       class="cat-btn  ${selected=='Snacks' ? 'active' : ''}">Snacks</a>
        <a href="userServlet?category=Grains"       class="cat-btn  ${selected=='Grains' ? 'active' : ''}">Grains</a>
        <a href="userServlet?category=Pulses"       class="cat-btn  ${selected=='Pulses' ? 'active' : ''}">Pulses</a>
        <a href="userServlet?category=Dairy"        class="cat-btn  ${selected=='Dairy' ? 'active' : ''}">Dairy</a>
        <a href="userServlet?category=Fruits"       class="cat-btn  ${selected=='Fruits' ? 'active' : ''}">Fruits</a>
        <a href="userServlet?category=Vegetables"   class="cat-btn  ${selected=='Vegetables' ? 'active' : ''}">Vegetables</a>
        <a href="userServlet?category=Oils"         class="cat-btn  ${selected=='Oils' ? 'active' : ''}">Oils</a>
        <a href="userServlet?category=Spices"       class="cat-btn  ${selected=='Spices' ? 'active' : ''}">Spices</a>
        <a href="userServlet?category=DryFruits"    class="cat-btn  ${selected=='DryFruits' ? 'active' : ''}">Dry Fruits</a>
        <a href="userServlet?category=PackagedFood" class="cat-btn  ${selected=='PackagedFood' ? 'active' : ''}">Packaged Food</a>
        <a href="userServlet?category=Bakery"       class="cat-btn  ${selected=='Bakery' ? 'active' : ''}">Bakery</a>
    </div>

    <%-- Product Grid --%>
    
    <c:choose>
    
    <c:when test="${empty requestScope.data}">
    		<p class="empty">No products found</p>
    </c:when>
    
    <c:otherwise>
        <div class="menu-grid">
        
        <c:forEach var="p" items="${requestScope.data}">
        
            <div class="menu-card">
                <img src="data:image/jpeg;base64,${p.base64Image}"
                     alt="${p.pName}">
                <div class="menu-card-body">
                    <h3>${p.pName}</h3>
                    <div class="sub-cat">${p.pCategory} › ${p.pSubCategory}</div>
                    <p class="desc">${p.pDesc}</p>
                    <div class="menu-card-footer">
                        <div>
                            <c:choose>
                                <c:when test="${p.pStock=='In Stock'}">
                                    <span class="badge in-stock">In Stock</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge out-stock">Out of Stock</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <c:choose>
                               <c:when test="${p.pStock=='In Stock'}">
                                  <a href="addToCart?action=add&pID=${p.pID}" class="add-btn"> Add</a>
                               </c:when>
                               <c:otherwise>
                                  <button class="add-btn-disabled">N/A</button>
                               </c:otherwise>
                           </c:choose>

                    </div>
                </div>
            </div>
        	   </c:forEach>
        </div>
    </c:otherwise>
    </c:choose>
</div>
</body>
</html>