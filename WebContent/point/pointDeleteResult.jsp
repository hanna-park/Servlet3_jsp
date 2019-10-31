<%@page import="com.qq.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.qq.point.PointDTO"%>
<%@page import="com.qq.point.PointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PointDAO pointDAO = new PointDAO();
	PointDTO pointDTO = new PointDTO();
	Connection con = DBConnector.getConnection();
	int num = Integer.parseInt(request.getParameter("num"));
	int result = pointDAO.delete(con, num);
	
	String msg="삭제 실패";
	
	if(result>0){
		msg="삭제 성공";
	
		request.setAttribute("msg", msg);
		request.setAttribute("path", "/Servlet3_jsp/point/pointList.jsp");
		
		RequestDispatcher view =  request.getRequestDispatcher("../common/commonResult.jsp");
		view.forward(request, response);
	}else{
		response.sendRedirect("/Servlet3_jsp/point/pointList.jsp");
		
	}
	
	//성공하면 성공메시지 alert -> List
	//실패하면 list로
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	alert("<%= msg%>");
	location.href="./pointList.jsp"
</script>
</head>
<body>

</body>
</html>