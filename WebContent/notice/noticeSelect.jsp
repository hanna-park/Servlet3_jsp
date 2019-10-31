<%@page import="com.pp.notice.NoticeDTO"%>
<%@page import="com.qq.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.pp.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
/* 	NoticeDAO noticeDAO = new NoticeDAO();
	NoticeDTO noticeDTO = new NoticeDTO();
	
	Connection con = DBConnector.getConnection();
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	noticeDTO = noticeDAO.noticeSelect(con, num); */
	
	NoticeDTO noticeDTO = (NoticeDTO)request.getAttribute("dto");

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
  <h2>Notice</h2>
  <form action="" method= "post">
    <div class="form-group">
      <label for="writer">writer</label>
      <input type="text" class="form-control" id="writer" name="writer" readonly value="<%=noticeDTO.getWriter()%>">
    </div>
    <div class="form-group">
      <label for="title">title</label>
      <input type="text" class="form-control" id="title" name="title" readonly value="<%=noticeDTO.getTitle() %>">
    </div>
    <div class="form-group">
      <label for="contents">contents</label>
      <textarea class="form-control" id="contents"readonly><%= noticeDTO.getContents() %></textarea>
    </div>

    <a href="./noticeUpdate.jsp?num=<%= noticeDTO.getNum() %>" class= "btn btn-default">글 수정</a>
    <a href="./noticeDeleteResult.jsp?num=<%= noticeDTO.getNum() %>" class= "btn btn-default">글 삭제</a>
    <a href="./noticeList.jsp" class= "btn btn-default">글 목록</a>     
    
 
  </form>
</div>


</body>
</html>