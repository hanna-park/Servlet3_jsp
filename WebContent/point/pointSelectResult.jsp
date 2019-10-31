<%@page import="com.qq.util.DBConnector"%>
<%@page import="com.qq.point.PointDAO"%>
<%@page import="com.qq.point.PointDTO"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	PointDTO pointDTO = (PointDTO)request.getAttribute("dto");
	
%>

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

<script type="text/javascript">
<%-- 	<% if(pointDTO==null){ %>
		alert(pointDTO);
		location.href="/.pointList.jsp"
	<% } %> --%>
</script>

</head>
<body>
	
	<div class="container">
  <div class="jumbotron">
    <h1>Point Select Page</h1>      
   	<ul>
   		<li>NUM: <%=pointDTO.getNum() %></li>
   		<li>NAME: <%=pointDTO.getName() %></li>
   		<li>KOR: <%=pointDTO.getKor() %></li>
   		<li>ENG: <%=pointDTO.getEng() %></li>
   		<li>MATH: <%=pointDTO.getMath() %></li>
   		<li>TOTAL: <%=pointDTO.getTotal() %></li>
   		<li>AVG: <%=pointDTO.getAvg() %></li>
   	</ul>

  </div>
  	<div>
  		<a href= "./pointUpdate.jsp?num=<%= pointDTO.getNum() %>"class= "btn btn-danger">Update</a>
  		<a href="./pointDeleteResult.jsp?num=<%= pointDTO.getNum() %>" class= "btn btn-primary">Delete</a>
  
  	</div>
</div>
	
	
	
</body>
</html>