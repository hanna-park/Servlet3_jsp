<%@page import="com.pp.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qq.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.pp.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	NoticeDAO noticeDAO = new NoticeDAO();
	
	Connection con = DBConnector.getConnection();
	
	ArrayList<NoticeDTO> ar = noticeDAO.noticeList(con);


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

	<div class= "container">
		<table class="table">
			<thead>
				<tr><th>NUM</th><th>Title</th><th>Write</th><th>Date</th><th>Hit</th></tr>
			</thead>
			<tbody>
				<%
					for(int i =0; i<ar.size();i++){
						NoticeDTO noticeDTO =ar.get(i);
				%>
				<tr>
					<td><%=noticeDTO.getNum() %></td>
					<td><a href="./noticeSelectResult.jsp?num=<%= noticeDTO.getNum()%>"><%= noticeDTO.getTitle() %></a></td>
					<td><%=noticeDTO.getWriter() %></td>
					<td><%=noticeDTO.getReg_date() %></td>
					<td><%=noticeDTO.getHit() %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
		
		<a href="./noticeWrite.jsp" class= "btn btn-primary">글 작성</a>
	
	</div>
	
	
</body>
</html>