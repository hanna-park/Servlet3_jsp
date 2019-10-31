<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

		<%@include file ="../layout/nav.jsp" %>

		<div class="container">
  					<h2>Member Join Form</h2>
  		<form action="./memberJoinResult.jsp" method="post">
  		
    		<div class="id">
      			<label for="id">ID:</label>
      			<input type="text" required="required" class="form-control" id="id" placeholder="Enter ID" name="id">
    		</div><br>
    		
    		<div class="pw">
      			<label for="pw">PW:</label>
      			<input type="password" required="required" class="form-control" id="pw" placeholder="Enter PW" name="pw">
    		</div><br>
    		
    		<div class="name">
      			<label for="name">name:</label>
      			<input type="text" required="required" class="form-control" id="name" placeholder="Enter NAME" name="name">
    		</div><br>
    		
    		<div class="email">
      			<label for="email">E-mail:</label>
      			<input type="email" class="form-control" id="email" placeholder="Enter E-mail" name="email">
    		</div><br>
    		
    		<div class="phone">
      			<label for="phone">Phone:</label>
      			<input type="tel" class="form-control" id="phone" placeholder="Enter Phone" name="phone">
    		</div><br>
    		
    		
    			<button type="submit" class="btn btn-default">Submit</button>
    			
  			</form>
				</div>

		



</body>
</html>