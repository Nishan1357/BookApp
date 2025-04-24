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
	<form action="searchBook" method="get">
		<label>Book Name: </label>
		<input type="search" name="name" required />
		<button>Search</button>
	</form>
	<hr>
	<h3>Books</h3>
	<c:if test="${result!=null}">
		<p style='background-color:yellow;padding:10px;'> ${result} </p>
	</c:if>
	<c:forEach items="${books}" var="b">
		<div style="border:1px solid blue;padding:5px;margin:5px;height:250px;">
			<div style="float:left;">
				<p>Name: <b> <c:out value="${b.name}"/> </b> </p>
				<p>price: <b> <c:out value="${b.price}" /> </b> </p>
				<p>Author Name: <b> <c:out value="${b.aname}" /> </b> </p>
				<p>Publisher Name: <b> <c:out value="${b.pname}" /> </b> </p>
				<form action="deleteBook" method="post">
					<input type="hidden" name="name" value="${b.name}" required />
					<button>Delete Book</button>
				</form>
				<br/>
				<a href="/updateBook?name=${b.name}">Update Book</a>
			</div>
			<img alt="" src="/getBookImage?name=${b.name}" height="200px" style="float:right;">
		</div> 
	</c:forEach>
	
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>${appName} - Book Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-image: url('https://images.unsplash.com/photo-1508107536691-b1449928187d?q=80&w=1882&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
            background-size: cover;
            background-position: center;
            color: #333;
        }
        h1 {
            text-align: center;
            color: #fff;
            background-color: rgba(0, 0, 0, 0.7);
            padding: 10px;
            border-radius: 5px;
        }
        nav {
            text-align: center;
            margin-bottom: 20px;
        }
        nav a {
            margin: 0 15px;
            text-decoration: none;
            color: #fff;
            font-weight: bold;
        }
        nav a:hover {
            text-decoration: underline;
        }
        hr {
            border: 1px solid #fff;
        }
        form {
            text-align: center;
            margin-bottom: 20px;
        }
        .search-input {
            padding: 10px;
            border: 1px solid #007bff;
            border-radius: 4px;
            width: 200px; /* Adjust width as needed */
            margin-right: 10px;
            font-size: 16px;
        }
        .search-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.2s;
        }
        .search-button:hover {
            background-color: #0056b3;
        }
        .alert {
            background-color: yellow;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            margin-bottom: 20px;
        }
        .book-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }
        .book-card {
            background-color: rgba(255, 255, 255, 0.9);
            border: 1px solid #007bff;
            border-radius: 5px;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            width: 250px;
            text-align: center;
            transition: transform 0.2s;
            float: centre;
        }
        .book-card:hover {
            transform: scale(1.05);
        }
        .book-card img {
            max-height: 150px;
            margin: 10px 0;
            float: centre;
        }
        .delete-button, .update-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.2s;
            margin-top: 5px;
            width: 100%;
            float: centre;
        }
        .delete-button:hover {
            background-color: #0056b3;
        }
        .update-button {
            background-color: #28a745;
        }
        .update-button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h1>${appName}</h1>
    <hr>
    <nav>
        <a href="/">Home</a>
        <a href="/viewBooks">View Books</a>
    </nav>
    <hr>
    
    <form action="searchBook" method="get">
        <label style="color: #fff;">Book Name: </label>
        <input type="search" name="name" required class="search-input" placeholder="Enter book name..." />
        <button type="submit" class="search-button">Search</button>
    </form>
    
    <hr>
    <c:if test="${result != null}">
        <div class="alert">${result}</div>
    </c:if>
    
    <h3 style="text-align: center; color: #fff;">Books</h3>
    <div class="book-container">
        <c:forEach items="${books}" var="b">
            <div class="book-card">
                <div style="float:left;">
                    <p><strong>Name:</strong> <c:out value="${b.name}"/></p>
                    <p><strong>Price:</strong> <c:out value="${b.price}" /></p>
                    <p><strong>Author Name:</strong> <c:out value="${b.aname}" /></p>
                    <p><strong>Publisher Name:</strong> <c:out value="${b.pname}" /></p>
                    <img alt="" src="/getBookImage?name=${b.name}" height="150px" style="float:centre;">
                    <form action="deleteBook" method="post">
                        <input type="hidden" name="name" value="${b.name}" required />
                        <button type="submit" class="delete-button">Delete Book</button>
                    </form>
                    <form action="/updateBook?name=${b.name}" method="get">
                        <button type="submit" class="update-button">Update Book</button>
                    </form>
                </div>
                
            </div> 
        </c:forEach>
    </div>
    
</body>
</html>
