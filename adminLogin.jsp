<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.PreparedStatement,
				 java.sql.ResultSet,
				 java.sql.Connection,
				 util.cafe24" %>

<%
	String SQL = "SELECT * FROM project_admin";
	Connection conn = cafe24.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(SQL);
	ResultSet rs = pstmt.executeQuery(SQL);
	rs.next();

	String id = request.getParameter("admin_id");
	String pw = request.getParameter("admin_pw");
	String admin_id = rs.getString(1);
	String admin_pw = rs.getString(2);

	if(id.equals(admin_id) && pw.equals(admin_pw)) {
		out.println("<script>");
		out.println("alert('로그인 성공');");
		out.println("location.href='adminPage_a.jsp';");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('아이디 혹은 비밀번호가 잘못되었습니다.');");
		out.println("history.back();");
		out.println("</script>");
	}
%>