<%@page import="oracle.net.aso.l"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp" %>


<%

try{
	sql = "update user_tbl_08 set user_name=?,user_pw=?,dept_no=?,user_gbn=? where user_no = ?";
	ps = con.prepareStatement(sql);
	
	
	ps.setString(1, request.getParameter("user_name"));
	ps.setString(2, request.getParameter("user_pw"));
	ps.setString(3, request.getParameter("dept_no"));
	ps.setString(4, request.getParameter("user_gbn"));
	ps.setString(5, request.getParameter("user_no"));
	
	ps.executeUpdate();
	
	%>
		<script>
			alert("수정이 완료되었습니다");
			history.back();
		</script>
	<%
	
}catch(Exception e){
%>
	<script>
			alert("수정이 실패되었습니다");
			history.back();
		</script>

<%	
	
	
	
}finally{
	try{
		if(con != null) con.close();
		if(stmt != null) stmt.close();
		if(ps != null) ps.close();
		if(rs != null) rs.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}


%>