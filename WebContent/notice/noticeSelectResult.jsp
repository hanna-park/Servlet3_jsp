<%@page import="com.qq.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.pp.notice.NoticeDAO"%>
<%@page import="com.pp.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	NoticeDAO noticeDAO = new NoticeDAO();
	NoticeDTO noticeDTO = new NoticeDTO();
	
	Connection con = DBConnector.getConnection();
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	noticeDTO = noticeDAO.noticeSelect(con, num);
	
	if(noticeDTO ==null){
		response.sendRedirect("./noticeList.jsp");
	}else{
		
		request.setAttribute("dto", noticeDTO);
		
		RequestDispatcher view = request.getRequestDispatcher("./noticeSelect.jsp");
		view.forward(request, response);
		
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>