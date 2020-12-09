<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="css/css.css">
<%
	String section = request.getParameter("section") != null ? request.getParameter("section") : "";
%>
<body>
	<%@ include file="static/header.jsp"%>
	<%@ include file="static/nav.jsp"%>

	<%
		switch (section) {
	case "insert":
	%><%@ include file="page/insert.jsp"%>
	<%
		break;
	case "list":
	%><%@ include file="page/list.jsp"%>
	<%
		break;
	case "mento":
	%><%@ include file="page/mento.jsp"%>
	<%
		break;
	case "rank":
	%><%@ include file="page/rank.jsp"%>
	<%
		break;
	default:
	%><%@ include file="static/index.jsp"%>
	<%
		}
	%>

	<%@ include file="static/footer.jsp"%>
</body>
</html>