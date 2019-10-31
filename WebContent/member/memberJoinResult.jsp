
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
	<nav class="navbar navbar-inverse">
   <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 1-1</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
      <li><a href="/Servlet3_jsp/notice/noticeList.jsp">NOTICE</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="/Servlet3_jsp/member/memberJoinForm.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="/Servlet3_jsp/member/memberLogin.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
</body>
</html>