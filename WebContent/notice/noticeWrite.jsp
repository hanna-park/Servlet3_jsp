<%@page import="com.qq.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.pp.notice.NoticeDAO"%>
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
	<div class="container">
	<h2>Notice 글 작성</h2>
		  <form action="./noticeWriteResult.jsp" method= "post">
		    <div class="form-group">
		      <label for="writer">writer</label>
		      <input type="text" class="form-control" id="writer" name="writer" >
		    </div>
		    <div class="form-group">
		      <label for="title">title</label>
		      <input type="text" class="form-control" id="title" name="title" >
		    </div>
		    <div class="form-group">
		      <label for="contents">contents</label>
		      <textarea class="form-control" id="contents" name="contents"></textarea>
		    </div>
		    
		    <button type="submit" class= "btn btn-default">확인</button>   
		    </form>
		    </div>
</body>
</html>