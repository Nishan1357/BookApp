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
	<h3>Update Book</h3>
	<c:if test="${r!=null}">
		<p style='background-color:yellow;padding:10px;'> ${r} </p>
	</c:if>
	<form action="doUpdateBook" method="post" enctype="multipart/form-data">
		Book Name: <input type="text" name="name" value="${book.name}" required/><br/><br/>
		Book Price: <input type="number" name="price" value="${book.price}" required/><br/><br/>
		Book Author Name: <input type="text" name="aname" value="${book.aname}" required/><br/><br/>
		Book Publisher Name: <input type="text" name="pname" value="${book.pname}" required/><br/><br/>
		Book Photo: <input type="file" accept="image/*" name="image" /><br/><br/>
		<img alt="" src="/getBookImage?name=${book.name}" height="200px">
		<input type="hidden" name="oldName" value="${book.name}" required />
		<input type="submit" value="UPDATE Book"/>
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
    <title>Update Book</title>
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

        h1 {
            color: #333;
            text-align: center;
        }

        hr {
            border: 1px solid #ccc;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        a {
            text-decoration: none;
            color: #007BFF;
            margin-right: 15px;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        h3 {
            color: #555;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        input[type="file"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .error {
            background-color: yellow;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            text-align: center;
        }

        img {
            max-width: 100%;
            height: auto;
            display: block;
            margin: 10px auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>${appName}</h1>
        <hr>
        <div>
            <a href="/">Home</a>
            <a href="/viewBooks">View Books</a>
        </div>
        <hr>
        <h3>Update Book</h3>
        <c:if test="${r != null}">
            <div class="error">${r}</div>
        </c:if>
        <form action="doUpdateBook" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Book Name:</label>
                <input type="text" id="name" name="name" value="${book.name}" required />
            </div>
            <div class="form-group">
                <label for="price">Book Price:</label>
                <input type="number" id="price" name="price" value="${book.price}" required />
            </div>
            <div class="form-group">
                <label for="aname">Book Author Name:</label>
                <input type="text" id="aname" name="aname" value="${book.aname}" required />
            </div>
            <div class="form-group">
                <label for="pname">Book Publisher Name:</label>
                <input type="text" id="pname" name="pname" value="${book.pname}" required />
            </div>
            <div class="form-group">
                <label for="image">Book Photo:</label>
                <input type="file" accept="image/*" name="image" />
            </div>
            <img alt="" src="/getBookImage?name=${book.name}" height="200px">
            <input type="hidden" name="oldName" value="${book.name}" required />
            <input type="submit" value="UPDATE Book" />
        </form>
    </div>
</body>
</html>
