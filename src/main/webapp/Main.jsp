<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>

<style>
body {
    display: flex;
    justify-content: center;   
    align-items: center;       
    height: 100vh;             
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #edbef397;
}

h3 {
    text-align: center;
    color: #414040;
}

#mainBox {
	height: 300px;
    width: 300px;
    margin: auto;
    padding: 20px;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0px 0px 10px gray;
}

.button{
    text-align: center;
    margin: auto;
    margin-bottom: 30px;
    width: 100%;
    padding: 6px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

a{
    color: #414040;
    text-decoration: none;
}

.button:hover {
    background-color: rgb(81, 41, 94);
    a{
        color: aliceblue;
}
}
</style>


</head>
<body>

    <div id="mainBox">

        <h3>Log in as</h3>

        <div class = "button"><a href="LoginPage.jsp">User</a></div>

        <div class = "button"><a href="AdminlogIn.jsp">Admin</a></div>

    </div>

</body>
</html>