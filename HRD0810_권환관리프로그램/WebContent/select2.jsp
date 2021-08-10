<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한관리 프로그램</title>
</head>
<body>
	<%@ include file="head.jsp"%>
	<section>
		<div>
			<h3>권한 조회</h3>
		</div>
		<table border="1" width="700" style="margin: 0 auto;">
			<tr>
				<th>사용자번호</th>
				<th>사용자명</th>
				<th>메뉴번호</th>
				<th>메뉴명</th>				
			</tr>
			<%
			sql += " select USER_NO,USER_NAME,MENU_NO, decode(MENU_NO,'10','부서관리','11','사원관리','12','기초정보관리','13','급여계산')";
			sql += " from USER_TBL_08 natural join DEPT_AUTH_TBL_08";
			sql += " union";
			sql += " select USER_NO,USER_NAME,MENU_NO, decode(MENU_NO,'10','부서관리','11','사원관리','12','기초정보관리','13','급여계산')";
			sql += " from USER_TBL_08 natural join USER_AUTH_TBL_08";
			
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>				
			</tr>
			<%	
			}
			%>
		</table>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>





