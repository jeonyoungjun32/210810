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
		return f.user_no.focus();
	}
	if(f.user_name.value == ""){
		alert("사용자명 잘못 입력되었습니다");
		return f.user_name.focus();
	}
	
	if(f.user_pw.value == ""){
		alert("암호가 잘못 입력되었습니다");
		return f.user_pw.focus();
	}
	if(f.user_pw2.value == ""){
		alert("암호가 잘못 입력되었습니다");
		return f.user_pw2.focus();
	}
	
	if(f.dept_no.value == ""){
		alert("소속부서번호 잘못 입력되었습니다");
		return f.dept_no.focus();
	}
	
	if(f.user_gbn.value == ""){
		alert("사용자구분이 잘못 입력되었습니다");
		return f.user_gbn.focus();
	}
	
	if(f.reg_date.value == ""){
		alert("등록날짜가 잘못 입력되었습니다");
		return f.reg_date.focus();
	}
	f.submit();
}
</script>
<body>
<%@ include file="head.jsp"%>
	<%
		sql = "select NVL(max(user_no),0)+1 ";
		sql	+= " from user_tbl_08";
		rs=stmt.executeQuery(sql);
		rs.next();
		String user_no = rs.getString(1);
	
		
		sql ="select to_char(sysdate,'yyyy-mm-dd')";
		sql +=" from dual";
		rs=stmt.executeQuery(sql);
		rs.next();
		String reg_date = rs.getString(1);
		
		
	%>






	<div>
		<h2>수강생 등록</h2>
	</div>

	<form action="insertPro.jsp" method="post" name="f">
		<table border="1" style="margin: 0 auto" width="500">
			<tr>
				<th>사용자번호</th>
				<td><input type="text" name="user_no" value="<%=user_no%>" size="" maxlength="10" readonly></td>
			</tr>
	
			<tr>
				<th>사용자명</th>
				<td><input type="text" name="user_name" value="" size="" maxlength="50"></td>
			</tr>
	
			<tr>
				<th>암호</th>
				<td><input type="password" name="user_pw" value="" size="" maxlength="50"></td>
			</tr>
	
			<tr>
				<th>암호확인</th>
				<td><input type="password" name="user_pw2" value="" size="" maxlength="50"></td>
			</tr>
	
			<tr>
				<th>소속부서번호</th>
				<td><input type="text" name="dept_no" value="" size="" maxlength="3"></td>
			</tr>
	
			<tr>
				<th>사용자구분</th>
				<td><input type="text" name="user_gbn" value="" size="" maxlength="2"></td>
			</tr>
	
			<tr>
				<th>등록일자</th>
				<td><input type="text" name="reg_date" value="<%=reg_date %>" size="" maxlength="10" required></td>
			</tr>
		</table>
		
			<center>
				<input type="submit" value="등록"  onclick="check(); return false">
				<input type="submit" value="조회" onclick="location='select.jsp'" >
			</center>		
		</form>
	
	
	<%@ include file="footer.jsp" %>
</body>
</html>