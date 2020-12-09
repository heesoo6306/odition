<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="static/header.jsp" %>
	<%@include file="static/nav.jsp" %>
	<section>
	
	<% String section = request.getParameter("section") != null ? request.getParameter("section") : ""; %>
			
	<%
	switch(section){
	case "list":
		%><%@ include file="page/list.jsp" %><%
		break;
	case "mento":
		%><%@ include file="page/mento.jsp" %><%
		break;
	case "rank":
		%><%@ include file="page/rank.jsp" %><%
		break;
	default :
		%><%@ include file="static/index.jsp" %><%
		break;
}
	%>

	</section>
	<%@include file="static/footer.jsp" %>
</body>
</html>