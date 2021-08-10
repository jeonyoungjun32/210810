<%@page import="oracle.net.aso.r"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강생 등록</title>
</head>

<script type="text/javascript">
function check() {
	if(f.user_no.value == ""){
		alert("사용자번호가 잘못 입력되었습니다");
		return f.user_no.select();
	}
	if(f.user_name.value == ""){
		alert("사용자명 잘못 입력되었습니다");
		return f.user_name.select();
	}
	
	if(f.user_pw.value == ""){
		alert("암호가 잘못 입력되었습니다");
		return f.user_pw.select();
	}
	
	if(f.dept_no.value == ""){
		alert("소속부서번호 잘못 입력되었습니다");
		return f.dept_no.select();
	}
	
	if(f.user_gbn.value == ""){
		alert("사용자구분이 잘못 입력되었습니다");
		return f.user_gbn.select();
	}
	
	if(f.reg_date.value == ""){
		alert("등록날짜가 잘못 입력되었습니다");
		return f.reg_date.select();
	}
	f.submit();
}
</script>
<body>
<%@ include file="head.jsp"%>
	<%
	
		String user_no = request.getParameter("user_no");
		
		sql = "select user_name, user_pw,"; 
		sql += " dept_no, user_gbn,";		
		sql += " to_char(reg_date,'yyyy-mm-dd') as reg_date";		
		sql += " from user_tbl_08";		
		sql += " where user_no = ? ";
		
		ps=con.prepareStatement(sql);
		ps.setString(1, user_no);
		 
		rs = ps.executeQuery();
		rs.next();
		
		String user_name = rs.getString(1);
		String user_pw = rs.getString(2);
		String dept_no = rs.getString(3);
		String user_gbn = rs.getString(4);
		String reg_date = rs.getString(5);
		
	%>






	<div>
		<h2>수강생 수정</h2>
	</div>

	<form action="updatePro.jsp" method="post" name="f">
		<table border="1" style="margin: 0 auto" width="500">
			<tr>
				<th>사용자번호</th>
				<td><input type="text" name="user_no" value="<%=user_no%>" size="" maxlength="10" readonly></td>
			</tr>
	
			<tr>
				<th>사용자명</th>
				<td><input type="text" name="user_name" value="<%=user_name %>" size="" maxlength="50"></td>
			</tr>
	
			<tr>
				<th>암호</th>
				<td><input type="password" name="user_pw" value="<%=user_pw %>" size="" maxlength="50"></td>
			</tr>
	
			<tr>
				<th>암호확인</th>
				<td><input type="password" name="user_pw2" value="<%=user_pw %>" size="" maxlength="50"></td>
			</tr>
	
			<tr>
				<th>소속부서번호</th>
				<td><input type="text" name="dept_no" value="<%=rs.getString(3) %>" size="" maxlength="3"></td>
			</tr>
	
			<tr>
				<th>사용자구분</th>
				<td><input type="text" name="user_gbn" value="<%=user_gbn %>" size="" maxlength="2"></td>
			</tr>
	
			<tr>
				<th>등록일자</th>
				<td><input type="text" name="reg_date" value="<%=reg_date %>" size="" maxlength="10" readonly></td>
			</tr>
		</table>
		
			<center>
				<input type="submit" value="등록"  onclick="check(); return false;">
				<input type="submit" value="조회" onclick="location ='select.jsp'" >
			</center>		
		</form>
	
	
	<%@ include file="footer.jsp" %>
</body>
</html>