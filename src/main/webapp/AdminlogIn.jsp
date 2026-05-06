<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

<style>
body {
    display: flex;
    justify-content: center;   
    align-items: center;       
    height: 100vh;             
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
}

h1 {
    text-align: center;
    color: #333;
}

form {
	height: 350px;
    width: 400px;
    margin: auto;
    padding: 20px;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0px 0px 10px gray;
}

table {
    width: 100%;
}

td {
    display: block;
    padding: 8px;
}

input[type="password"],
input[type="email"]{
    width: 100%;
    padding: 6px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="submit"] {

    background-color: green;
    margin-bottom: 5px;
    color: white;
    padding: 8px 50px;
    margin-left: 30px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

input[type="reset"] {
    background-color: red;
    margin-bottom: 5px;
    color: white;
    padding: 8px 50px;
    margin-left: 30px;
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
</style>



</head>
<body>

<form action="AdminServlet" method="post">
<h1>Admin Login</h1>
<table>

<tr>
<td>Email</td>
<td>
<input type="email" name="email" placeholder="Enter email">
</td>
</tr>

<tr>
<td>Password</td>
<td>
<input type="password" name="password" placeholder="Enter password">
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
</form>



</body>
</html>