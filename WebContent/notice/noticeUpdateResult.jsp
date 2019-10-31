<%@page import="com.qq.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.pp.notice.NoticeDTO"%>
<%@page import="com.pp.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	NoticeDAO noticeDAO = new NoticeDAO();
	NoticeDTO noticeDTO = new NoticeDTO();
	noticeDTO.setNum(Integer.parseInt(request.getParameter("num")));
	noticeDTO.setTitle(request.getParameter("title"));
	noticeDTO.setWriter(request.getParameter("writer"));
	noticeDTO.setContents(request.getParameter("contents"));
	
	Connection con = DBConnector.getConnection();
	
	int result = noticeDAO.noticeUpdate(con, noticeDTO);
	
	String msg = "수정 성공";
	
	if(result > 0){
		request.setAttribute("msg", msg);
		request.setAttribute("path", "/Servlet3_jsp/notice/noticeList.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/commonResult.jsp");
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