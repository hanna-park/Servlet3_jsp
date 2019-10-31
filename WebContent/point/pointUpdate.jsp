<%@page import="com.qq.point.PointDTO"%>
<%@page import="com.qq.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.qq.point.PointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	
	PointDAO pointDAO = new PointDAO();
	PointDTO pointDTO = new PointDTO();
	Connection con = DBConnector.getConnection();
	pointDTO = pointDAO.selectOne(con, num);
	
	num = pointDTO.getNum();
	String name = pointDTO.getName();
	int kor = pointDTO.getKor();
	int eng = pointDTO.getEng();
	int math = pointDTO.getMath();
	
	
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
</head>
<body>

	<div class="container">
  <h2>Point Update Page</h2>
  <form action="./pointUpdateResult.jsp" method= "post">
  	<input type = "hidden" name= "num" value = "<%=pointDTO.getNum() %>">
    <div class="form-group">
      <label for="name">NAME:</label>
      <input type="text" value = "<%= name%>"class="form-control" id="name" placeholder="Enter name" name="name">
    </div>
    <div class="form-group">
      <label for="kor">KOR:</label>
      <input type="text" value = "<%= kor%>" class="form-control" id="kor" placeholder="Enter kor" name="kor">
    </div>
    <div class="form-group">
      <label for="eng">ENG:</label>
      <input type="text" value = "<%= eng%>" class="form-control" id="eng" placeholder="Enter eng" name="eng">
    </div>
        <div class="form-group">
      <label for="math">MATH:</label>
      <input type="text" value = "<%= math%>" class="form-control" id="math" placeholder="Enter math" name="math">
    </div>
    
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>
	
</body>
</html>