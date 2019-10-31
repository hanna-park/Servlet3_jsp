<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String n = request.getParameter("n");
	//RequestDispatcher view = request.getRequestDispatcher("./testForward.jsp");
	//view.forward(request, response);
	
	response.sendRedirect("./testForward.jsp");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>TEST</h1>
	<h1><%=n %></h1>

</body>
</html>