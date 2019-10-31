<%@page import="com.qq.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.pp.notice.NoticeDTO"%>
<%@page import="com.pp.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	NoticeDAO noticeDAO = new NoticeDAO();
	NoticeDTO noticeDTO = new NoticeDTO();
	
	Connection con = DBConnector.getConnection();
	noticeDTO = noticeDAO.noticeSelect(con, num);
	
	num = noticeDTO.getNum();
	String title = noticeDTO.getTitle();
	String writer = noticeDTO.getWriter();
	String contents = noticeDTO.getContents();
	
	
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
  <h2>글 수정</h2>
  <form action="./noticeUpdateResult.jsp?num=<%=noticeDTO.getNum() %>" method= "post">
    <div class="form-group">
      <label for="title">Title</label>
      <input type="text" class="form-control" id="title"  name="title" value="<%= noticeDTO.getTitle()%>">
    </div>
    <div class="form-group">
      <label for="writer">Writer</label>
      <input type="text" class="form-control" id="writer"  name="writer" value="<%= noticeDTO.getWriter()%>">
    </div>
    <div class="form-group">
      <label for="contents">Contents</label>
      <textarea class="form-control" id="contents"  name="contents"><%=noticeDTO.getContents() %> </textarea>
    </div>

    
    <button type="submit" class="btn btn-default">수정</button>
  </form>
</div>

</body>
</html>