<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@
page import="com.model.Product"
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product Data</title>

<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
}

h1 {
    text-align: center;
    color: #333;
}

form {
    width: 400px;
    margin: 30px auto;
    padding: 20px;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0px 0px 10px gray;
}

table {
    width: 100%;
}

td {
    padding: 8px;
}

input[type="text"],
input[type="password"],
select {
    width: 100%;
    padding: 6px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="radio"],
input[type="checkbox"] {
    margin-left: 10px;
}

input[type="file"] {
    border: none;
}

input[type="submit"] {
    background-color: green;
    color: white;
    padding: 8px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

input[type="reset"] {
    background-color: red;
    color: white;
    padding: 8px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: darkgreen;
}

input[type="reset"]:hover {
    background-color: darkred;
}
a {
    display: inline-block;
    margin-top: 10px;
    text-decoration: none;
    background-color: #007bff;
    color: white;
    padding: 8px 15px;
    border-radius: 5px;
    font-weight: bold;
    transition: 0.3s;
}

a:hover {
    background-color: #0056b3;
}
</style>

</head>
<body>

<%
Product product = (Product)request.getAttribute("edit");
%>

<h1>Product Update</h1>
<form action="updateServlet" method="post"  enctype="multipart/form-data">

<table>

<tr>
<td></td>
<td>
<input type="text" name="pID" value="<%= product.getpID() %>" hidden>
</td>
</tr>


<tr>
<td>Product Name</td>
<td>
<input type="text" name="pName" placeholder="Enter Product name" value="<%= product.getpName() %>">
</td>
</tr>

<tr>
<td>Product Price</td>
<td>
<input type="text" name="pPrice" placeholder="Enter Product price" value="<%= product.getpPrice()%>">
</td>
</tr>

<tr>
<td>Product Stock</td>
<td>
<select name="pStock">
<option value="In Stock" <%= "In stock".equals(product.getpStock()) ? "selected" : "" %> >In Stock</option>
<option value="Out of Stock" <%= "Out of Stock".equals(product.getpStock()) ? "selected" : "" %> >Out of Stock</option>
</select>
</td>
</tr>

<tr>
<td>Product Category</td>
<td>
<select name="pCategory" id="pCategory">
<option value="Beverages" <%= "Beverages".equals(product.getpCategory()) ? "selected" : "" %> >Beverages</option>
<option value="Snacks" <%= "Snacks".equals(product.getpCategory()) ? "selected" : "" %> >Snacks</option>
<option value="Grains" <%= "Grains".equals(product.getpCategory()) ? "selected" : "" %> >Grains</option>
<option value="Pulses" <%= "Pulses".equals(product.getpCategory()) ? "selected" : "" %> >Pulses</option>
<option value="Dairy" <%= "Dairy".equals(product.getpCategory()) ? "selected" : "" %> >Dairy</option>
<option value="Fruits" <%= "Fruits".equals(product.getpCategory()) ? "selected" : "" %> >Fruits</option>
<option value="Vegetables" <%= "Vegetables".equals(product.getpCategory()) ? "selected" : "" %> >Vegetables</option>
<option value="Oils" <%= "Oils".equals(product.getpCategory()) ? "selected" : "" %> >Oils</option>
<option value="Spices" <%= "Spices".equals(product.getpCategory()) ? "selected" : "" %> >Spices</option>
<option value="DryFruits" <%= "DryFruits".equals(product.getpCategory()) ? "selected" : "" %> >DryFruits</option>
<option value="PackagedFood" <%= "PackagedFood".equals(product.getpCategory()) ? "selected" : "" %> >PackagedFood</option>
<option value="Bakery" <%= "Bakery".equals(product.getpCategory()) ? "selected" : "" %> >Bakery</option>
</select>
</td>
</tr>

<tr>
<td>Product Sub-Category</td>
<td>
<select name="pSubCategory" id="pSubCategory">
</select>
</td>
</tr>

<tr>
<td>Image</td>
<td><img src="data:image/jpeg;base64,<%= product.getBase64Image() %>" width="200" height="200"/>
<input type="file" name="pImg" multiple>
</td>
</tr>

<tr>
<td>Product Description!!</td>
<td>
<textarea name="pDesc" rows="6" cols="25"><%= product.getpDesc() != null ? product.getpDesc() : "" %></textarea>
</td>
</tr>

<tr>
<td></td>
<td>
<input type="submit" name="update" value="Update">
<input type="reset" name="reset" value="Reset">
</td>
</tr>

</table>

</form>

<script>
const data = {
    Beverages: ["Tea", "Coffee", "Juice", "Cold Drink", "Coconut Water", "Energy Drink", "Milkshake"],
    Snacks: ["Biscuits", "Namkeen", "Chips", "Instant Noodles", "Popcorn", "Chocolate", "Energy Bar"],
    Grains: ["Rice", "Atta", "Maida", "Sooji", "Poha", "Oats"],
    Pulses: ["Dal", "Chana", "Rajma", "Chole"],
    Dairy: ["Milk", "Paneer", "Curd", "Butter", "Ghee", "Cheese", "Cream"],
    Fruits: ["Mango", "Banana", "Apple", "Grapes", "Watermelon", "Papaya", "Pomegranate"],
    Vegetables: ["Tomato", "Onion", "Potato", "Spinach", "Broccoli", "Carrot", "Capsicum"],
    Oils: ["Sunflower Oil", "Mustard Oil", "Coconut Oil", "Olive Oil", "Groundnut Oil"],
    Spices: ["Turmeric", "Cumin Seeds", "Coriander Powder", "Red Chilli", "Garam Masala", "Black Pepper"],
    DryFruits: ["Almonds", "Cashews", "Walnuts", "Raisins", "Dates", "Pistachios", "Figs"],
    PackagedFood: ["Jam", "Pickle", "Sauce", "Mayonnaise", "Peanut Butter", "Honey", "Vinegar"],
    Bakery: ["Bread", "Buns", "Cake", "Cookies", "Muffins", "Rusk", "Croissant"]
};

const category = document.getElementById("pCategory");
const items    = document.getElementById("pSubCategory");
const savedSub = "<%= product.getpSubCategory() != null ? product.getpSubCategory() : "" %>";

function populateSubs(selectedCat, preselect) {
    items.innerHTML = '<option value="">--Select Item--</option>';
    if (selectedCat && data[selectedCat]) {
        data[selectedCat].forEach(function(item) {
            let option = document.createElement("option");
            option.value = item;
            option.text  = item;
            if (item === preselect) option.selected = true;
            items.appendChild(option);
        });
    }
}

// Populate on page load with the saved value pre-selected
window.addEventListener("load", function() {
    populateSubs(category.value, savedSub);
});

// Repopulate when user changes category
category.addEventListener("change", function() {
    populateSubs(category.value, "");
});
</script>

</body>
</html>