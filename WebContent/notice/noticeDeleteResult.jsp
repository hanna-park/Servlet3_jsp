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
	int result = noticeDAO.noticeDelete(con, num);
	
	String msg = "삭제 성공";
	
	if(result > 0){
		request.setAttribute("msg", msg);
		request.setAttribute("path", "/Servlet3_jsp/notice/noticeList.jsp");
		
		RequestDispatcher view = request.getRequestDispatcher("../common/commonResult.jsp");
		view.forward(request, response);
	}else{
		response.sendRedirect("/Servlet3_jsp/notice/noticeList.jsp");
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