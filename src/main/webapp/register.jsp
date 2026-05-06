<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registeration - FoodMart</title>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; }

body {
    font-family: 'Open Sans', sans-serif;
    background: #f5f5f0;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    padding: 2rem;
}

h1 {
    font-family: 'Nunito', sans-serif;
    font-size: 20px;
    font-weight: 700;
    color: #1a7038;
    margin-bottom: 1.5rem;
}

form {
    background: #fff;
    border-radius: 16px;
    padding: 40px;
    width: 100%;
    max-width: 500px;
    box-shadow: 0 4px 24px rgba(0,0,0,0.08);
}

input[type="email"],
input[type="password"],
input[type="text"],
input[type="number"] {
    width: 100%;
    display: block;
    margin: 10px 0px 20px 0px;
    padding: 10px 14px;
    border: 1.5px solid #e0e0e0;
    border-radius: 8px;
    font-size: 14px;
    color: #222;
    outline: none;
    box-sizing: border-box;
    transition: border-color 0.2s;
}

input[type="email"]:focus,
input[type="password"]:focus {
    border-color: #2d8c4e;
}

input[type="submit"] {
    width: 100%;
    padding: 11px;
    background: #2d8c4e;
    color: #fff;
    font-family: 'Nunito', sans-serif;
    font-size: 15px;
    font-weight: 700;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    margin-top: 6px;
}

input[type="submit"]:hover {
    background: #246b3d;
}
</style>

</head>
<body>

<form action="registerServlet" method="post">

<h1>Register to FoodMart</h1>

<label for="name">Name</label>
<input type="text" name="name" placeholder="Enter name"> 
<label for="email">Email</label>
<input type="email" name="email" placeholder="Enter email">  
<label for="Mobnumber">Mobile number</label>
<input type="number" name="Mobnumber" placeholder="Enter mobile number">  
<label for="password">Password</label>
<input type="password" name="password" placeholder="Set password">

<input type="submit" value="Sign In"> 

</form>

</body>
</html>