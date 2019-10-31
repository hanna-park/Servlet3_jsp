<%@page import="com.qq.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.qq.point.PointDTO"%>
<%@page import="com.qq.point.PointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	PointDAO pointDAO = new PointDAO();
	PointDTO pointDTO = new PointDTO();
	pointDTO.setNum(Integer.parseInt(request.getParameter("num")));
	pointDTO.setName(request.getParameter("name"));
	pointDTO.setKor(Integer.parseInt(request.getParameter("kor")));
	pointDTO.setEng(Integer.parseInt(request.getParameter("eng")));
	pointDTO.setMath(Integer.parseInt(request.getParameter("math")));
	pointDTO.setTotal(pointDTO.getKor()+pointDTO.getEng()+pointDTO.getMath());
	pointDTO.setAvg(pointDTO.getTotal()/3.0);
	
	Connection con = DBConnector.getConnection();
	
	
	int result = pointDAO.update(con, pointDTO);
	
	String msg = "수정 실패";
	
	if(result>0){
		msg="수정 성공";
	}

	
	request.setAttribute("msg", msg);
	request.setAttribute("path", "/Servlet3_jsp/point/pointList.jsp");
	RequestDispatcher view = request.getRequestDispatcher("../common/commonResult.jsp");
	view.forward(request, response);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	

	<%-- 
	alert("<%= msg%>");
	location.href = "./pointList.jsp" --%>
</script>
</head>
<body>

</body>
</html>