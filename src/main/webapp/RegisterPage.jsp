<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Student Registration</h1>

<form action="post">

<table>

<tr>
<td>Username
<input type="text" name="username" placeholder="Enter Username">
</td>
</tr>

<tr>
<td>Password
<input type="password" name="password" placeholder="Enter password">
</td>
</tr>

<tr>
<td>Email
<input type="email" name="email" placeholder="Enter email">
</td>
</tr>

<tr>
<td>Gender
<input type="radio" name="gender" value="Male">Male
<input type="radio" name="gender" value="Female">Female
</td>
</tr>

<tr>
<td>Language
<input type="checkbox" name="lang1" value="Hindi">Hindi
<input type="checkbox" name="lang2" value="English">English
<input type="checkbox" name="lang3" value="Gujarati">Gujarati
</td>
</tr>

<tr>
<td>
<input type="submit" name="submit" value="Submit">
<input type="reset" name="reset" value="Reset">
</td>
</tr>

</table>

</form>



</body>
</html>