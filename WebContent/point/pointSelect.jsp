<%@page import="com.qq.util.DBConnector"%>
<%@page import="com.qq.point.PointDAO"%>
<%@page import="com.qq.point.PointDTO"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	PointDAO pointDAO = new PointDAO();
	PointDTO pointDTO = new PointDTO();
	Connection con = DBConnector.getConnection();                                                                                                                 
	int num = Integer.parseInt(request.getParameter("num"));
	pointDTO = pointDAO.selectOne(con, num);
	
	if(pointDTO == null){
		response.sendRedirect("./pointList.jsp");
	}else{
		
		request.setAttribute("dto", pointDTO);
		
		RequestDispatcher view= request.getRequestDispatcher("./pointSelectResult.jsp");
		view.forward(request, response);
		
	}
%>
