<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

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
    margin-left:125px;
    padding: 10px 18px;
    background: #3498db;
    color: white;
    text-decoration: none;
    border-radius: 6px;
    transition: 0.3s ease;
}

a:hover {
    background: #21618c;
}
</style>


</head>
<body>

<h1>Product Registration</h1>
<form action="productServlet" method="post"  enctype="multipart/form-data">

<table>

<tr>
<td>Product Name</td>
<td>
<input type="text" name="pName" placeholder="Enter Product name">
</td>
</tr>

<tr>
<td>Product Price</td>
<td>
<input type="text" name="pPrice" placeholder="Enter Product price">
</td>
</tr>

<tr>
<td>Product Stock</td>
<td>
<select name="pStock">
<option value="In Stock">In Stock</option>
<option value="Out of Stock">Out of Stock</option>
</select>
</td>
</tr>

<tr>
<td>Product Category</td>
<td>
<select name="pCategory" id="pCategory">
<option value="Beverages">Beverages</option>
<option value="Snacks">Snacks</option>
<option value="Grains">Grains</option>
<option value="Pulses">Pulses</option>
<option value="Dairy">Dairy</option>
<option value="Fruits">Fruits</option>
<option value="Vegetables">Vegetables</option>
<option value="Oils">Oils</option>
<option value="Spices">Spices</option>
<option value="DryFruits">DryFruits</option>
<option value="PackagedFood">PackagedFood</option>
<option value="Bakery">Bakery</option>
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
<td>
<input type="file" name="pImg" multiple>
</td>
</tr>

<tr>
<td>Product Description!!</td>
<td>
<textarea name="pDesc" rows="6" cols="25"></textarea>
</td>
</tr>

<tr>
<td></td>
<td>
<input type="submit" name="submit" value="Submit">
<input type="reset" name="reset" value="Reset">
</td>
</tr>

</table>

<a href="showAllProduct">Show All Products</a>

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
const items = document.getElementById("pSubCategory");
console.log(category);
console.log(items);

category.addEventListener("change", function () {
	
	 let selected = category.value;
	 // Clear previous items
     items.innerHTML = '<option value="">--Select Item--</option>';
     if (selected) {
         let list = data[selected];

         list.forEach(function (item) {
             let option = document.createElement("option");
             option.value = item;
             option.text = item;
             items.appendChild(option);
         });
     }
 });
</script>



</body>
</html>