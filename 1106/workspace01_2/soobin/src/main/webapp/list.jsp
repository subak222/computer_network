<%@page import="DBPKG.Util" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>list</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<section>
		<h1>교과목 목록</h1>
		<form name="frm">
			<table border="1">
				<tr>
					<td>과목코드</td>
					<td>과목명</td>
					<td>학점</td>
					<td>담당강사</td>
					<td>요일</td>
					<td>시작시간</td>
					<td>종료시간</td>
					<td>삭제</td>
				</tr>
<%
request.setCharacterEncoding("UTF-8");
try {
	Connection conn = Util.getConnection();
	String sql = 
			"Select id, co.name sname, credit, le.name lname, week, start_hour, end_hour " +
			"From course_tbl co, lecturer_tbl le " +;
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()) {
		grade = rs.getString("grade");
		switch(grade) {
		case "A":
			grade = "VIP";
			break;
		case "B":
			grade = "일반";
			break;
		case "C":
			grade = "직원";
			break;
		}
%>
		<tr>
			<td> <a href="modify.jsp?custno=<%=rs.getString("custno") %>">
 <%=rs.getString("custno") %> </a> </td>
			<td><%=rs.getString("custname") %> </td>
			<td><%=rs.getString("phone") %> </td>
			<td><%=rs.getString("address") %> </td>
			<td><%=rs.getDate("joindate") %> </td>
			<td><%=grade %> </td>
			<td><%=rs.getString("city") %> </td>
		</tr>
<%
	}
} catch(Exception e) {
	e.printStackTrace();
}
%>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>