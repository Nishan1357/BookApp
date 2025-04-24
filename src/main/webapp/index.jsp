<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1> ${appName} </h1>
	<hr>
	<a href="/">Home</a> 
	<a style="margin-left:20px;" href="/viewBooks">View Books</a>
	<hr>
	<h3>Add Book</h3>
	<c:if test="${r!=null}">
		<p style='background-color:yellow;padding:10px;'> ${r} </p>
	</c:if>
	<form action="addBook" method="post" enctype="multipart/form-data">
		Book Name: <input type="text" name="name" required/><br/><br/>
		Book Price: <input type="number" name="price" required/><br/><br/>
		Book Author Name: <input type="text" name="aname" required/><br/><br/>
		Book Publisher Name: <input type="text" name="pname" required/><br/><br/>
		Book Photo: <input type="file" accept="image/*" name="image" /><br/><br/>
		<input type="submit" value="Add Book"/>
	</form>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Book Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('https://images.unsplash.com/photo-1521587760476-6c12a4b040da?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'); /* Background image URL */
            background-size: cover;
            background-position: center;
            color: #333;
        }
        .overlay {
            background-color: rgba(255, 255, 255, 0.9); /* White background with transparency */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
            max-width: 600px; /* Set a max-width for the container */
            margin: auto; /* Center the container */
        }
        h1 {
            color: #007bff;
            text-align: center;
            font-size: 2.5em;
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3); /* Optional shadow for text */
        }
        nav {
            margin-bottom: 20px;
            text-align: center;
        }
        nav a {
            margin-right: 20px;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
        nav a:hover {
            text-decoration: underline;
        }
        .form-container {
            margin-top: 20px;
        }
        .form-container input[type="text"],
        .form-container input[type="number"],
        .form-container input[type="file"],
        .form-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-container input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        .form-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .alert {
            background-color: yellow;
            padding: 10px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="overlay">
        <h1>${appName}</h1>
        <nav>
            <a href="/">Home</a> 
            <a href="/viewBooks">View Books</a>
        </nav>
        <hr>
        <h3>Add Book</h3>
        <c:if test="${result!=null}">
            <p class="alert">${result}</p>
        </c:if>
        <form action="addBook" method="post" enctype="multipart/form-data" class="form-container">
            Book Name: <input type="text" name="name" required/><br/><br/>
            Book Price: <input type="number" name="price" required/><br/><br/>
            Book Author Name: <input type="text" name="aname" required/><br/><br/>
            Book Publisher Name: <input type="text" name="pname" required/><br/><br/>
            Book Photo: <input type="file" accept="image/*" name="image" /><br/><br/>
            <input type="submit" value="Add Book"/>
        </form>
    </div>
</body>
</html>