<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
input[type="email"],
input[type="date"],
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
</style>


</head>
<body>

${msg}

<h1>Student Registration</h1>
<form action="registerServlet" method="post"  enctype="multipart/form-data">

<table>

<tr>
<td>Username</td>
<td>
<input type="text" name="username" placeholder="Enter Username">
</td>
</tr>

<tr>
<td>Password</td>
<td>
<input type="password" name="password" placeholder="Enter password">
</td>
</tr>

<tr>
<td>Email</td>
<td>
<input type="email" name="email" placeholder="Enter email">
</td>
</tr>

<tr>
<td>Gender</td>
<td>
<input type="radio" name="gender" value="Male">Male
<input type="radio" name="gender" value="Female">Female
</td>
</tr>

<tr>
<td>Date</td>
<td>
<input type="date" name="date">
</td>
</tr>

<tr>
<td>Language</td>
<td>
<input type="checkbox" name="lang" value="Hindi">Hindi
<input type="checkbox" name="lang" value="English">English
<input type="checkbox" name="lang" value="Gujarati">Gujarati
</td>
</tr>

<tr>
<td>City</td>
<td>
<select name="city">
<option value="Baroda">Baroda</option>
<option value="Surat">Surat</option>
<option value="Anand">Anand</option>
<option value="Vapi">Vapi</option>
</select>
</td>
</tr>

<tr>
<td>Image</td>
<td>
<input type="file" name="file" multiple>
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