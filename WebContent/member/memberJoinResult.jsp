
<%@page import="com.qq.member.MemberDAO"%>
<%@page import="com.qq.member.MemberDTO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.qq.util.DBConnector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	MemberDTO memberDTO = new MemberDTO();
	
	
	memberDTO.setId(request.getParameter("id"));
	memberDTO.setPw(request.getParameter("pw"));
	memberDTO.setName(request.getParameter("name"));
	memberDTO.setEmail(request.getParameter("email"));
	memberDTO.setPhone(request.getParameter("phone"));
	
	
	MemberDAO memberDAO = new MemberDAO();
	Connection con = DBConnector.getConnection();	
			
	int result = memberDAO.memberInsert(con,memberDTO);
	
	con.close();
 
	
	String msg = "회원가입 성공";
	if(result>0){
		
		request.setAttribute("msg", msg);
		request.setAttribute("path", "../index.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/commonResult.jsp");
		view.forward(request, response);
		
	}else{
		response.sendRedirect("../index.jsp");
		
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