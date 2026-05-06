<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%@ page import="com.model.Product" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Products</title>

 <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
        font-family: 'Segoe UI', sans-serif;
        background: #f0f2f5;
        padding: 2rem;
    }

    h2 {
        font-size: 1.5rem;
        font-weight: 600;
        color: #1a1a2e;
        margin-bottom: 1.5rem;
        padding-left: 1rem;
        border-left: 4px solid #4f46e5;
        border-radius: 0;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background: #fff;
        border-radius: 14px;
        overflow: hidden;
        box-shadow: 0 2px 16px rgba(79, 70, 229, 0.08);
        border: none;
    }

    thead {
        background: linear-gradient(135deg, #4f46e5 0%, #7c3aed 100%);
        color: white;
    }

    thead th {
        padding: 16px 18px;
        text-align: left;
        font-weight: 500;
        font-size: 0.82rem;
        letter-spacing: 0.7px;
        text-transform: uppercase;
        border: none;
    }

    tbody tr {
        border-bottom: 1px solid #f1f0fb;
        transition: all 0.2s ease;
    }

    tbody tr:last-child {
        border-bottom: none;
    }

    tbody tr:hover {
        background: #f5f3ff;
        transform: scale(1.002);
    }

    tbody td {
        padding: 14px 18px;
        font-size: 0.88rem;
        color: #374151;
        border: none;
        vertical-align: middle;
    }

    tbody td img {
        width: 64px;
        height: 64px;
        object-fit: cover;
        border-radius: 10px;
        border: 2px solid #e0e7ff;
        display: block;
        transition: transform 0.2s;
    }

    tbody td img:hover {
        transform: scale(1.08);
    }

    tbody td:nth-child(1) {
        color: #a0aec0;
        font-size: 0.8rem;
        font-weight: 600;
    }

    tbody td:nth-child(2) {
        font-weight: 600;
        color: #1a1a2e;
    }

    tbody td:nth-child(3) {
        font-weight: 700;
        color: #4f46e5;
    }

    tbody td:nth-child(4),
    tbody td:nth-child(5) {
        font-size: 0.8rem;
    }

    tbody td:nth-child(4) span,
    tbody td:nth-child(5) span {
        background: #eef2ff;
        color: #4338ca;
        padding: 3px 10px;
        border-radius: 20px;
        font-weight: 500;
    }

    tbody td:nth-child(6) {
        font-weight: 600;
        color: #059669;
    }

    td a {
        display: inline-block;
        padding: 5px 14px;
        background: #eef2ff;
        color: #4f46e5;
        border-radius: 8px;
        font-size: 0.82rem;
        font-weight: 600;
        text-decoration: none;
        border: 1px solid #c7d2fe;
        transition: all 0.2s;
    }

    td a:hover {
        background: #4f46e5;
        color: white;
        border-color: #4f46e5;
    }

    p {
        text-align: center;
        padding: 3rem;
        color: #999;
        font-size: 1rem;
        background: #fff;
        border-radius: 14px;
        box-shadow: 0 2px 16px rgba(79, 70, 229, 0.08);
    }
    
    
    
</style>

</head>
<body>

<h2>Products List</h2>

<c:choose>

<c:when test="${ empty data }">
<p>No Products Found !</p>
</c:when>


<c:otherwise>
        <table border="1" cellpadding="8" cellspacing="0">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Category</th>
                <th>Sub Category</th>
                <th>Stock</th>
                <th>Description</th>
                <th>Image</th>
                <th colspan="2">Updates</th>
            </tr>

            <c:forEach var="p" items="${data}">
            
                <tr>
                    <td>${p.pID}</td>
                    <td>${p.pName}</td>
                    <td>${p.pPrice}</td>
                    <td>${p.pCategory}</td>
                    <td>${p.pSubCategory}</td>
                    <td>${p.pStock}</td>
                    <td>${p.pDesc} </td>
                    <td><img src="data:image/jpeg;base64,${p.base64Image}" width="200" height="200"/></td>
                    <td><a href="productServlet?action=edit&id=${p.pID}">Edit</a></td>
                    <td><a href="productServlet?action=delete&id=${p.pID}">Delete</a></td>
                </tr>
            </c:forEach>

        </table>
</c:otherwise>

</c:choose>

</body>
</html>