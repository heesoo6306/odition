<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3 style="text-align: center;">참가자목록조회</h3>
	<table border="1" style="text-align: center;">
		<tr>
			<td>채점번호</td>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>생년월일</td>
			<td>점수</td>
			<td>평점</td>
			<td>멘토</td>
		</tr>
		<%
			try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
			Statement stmt = conn.createStatement();
			String query = "SELECT POINT.SERIAL_NO, POINT.ARTIST_ID, " + "ARTIST.ARTIST_NAME, ARTIST.ARTIST_BIRTH, "
			+ "POINT.POINT, MENTO.MENTO_NAME " + "FROM tbl_point_201905 POINT, " + "tbl_artist_201905 ARTIST, "
			+ "tbl_mento_201905 MENTO " + "WHERE point.artist_id = artist.artist_id "
			+ "AND point.mento_id = mento.mento_id " + "ORDER BY point.serial_no ASC ";
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				char participantTier = '-';
				int participantGrade = rs.getInt(5);
				if (participantGrade >= 90) {
			participantTier = 'A';
				} else if (participantGrade >= 80) {
			participantTier = 'B';
				} else if (participantGrade >= 70) {
			participantTier = 'C';
				} else if (participantGrade >= 60) {
			participantTier = 'D';
				} else if (participantGrade < 60) {
			participantTier = 'F';
				}
				String birthDate = rs.getString(4);
				birthDate = birthDate.substring(0, 4) + "년" + birthDate.substring(4, 6) + "월" + birthDate.substring(6) + "일";
		%>
		<tr>
			<td><%=rs.getInt(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=birthDate%></td>
			<td><%=participantGrade%></td>
			<td><%=participantTier%></td>
			<td><%=rs.getString(6)%></td>
		</tr>
		<%
			}
		stmt.close();
		conn.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</table>
</body>
</html>
