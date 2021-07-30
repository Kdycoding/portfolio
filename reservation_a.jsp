<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import="user.userDAO,
				 java.util.Date,
            	 java.text.SimpleDateFormat"%>

<%
	request.setCharacterEncoding("UTF-8");

	String u_name = null;
	String u_number= null;
	String date_check_in = null;
	String date_check_out = null;	
	String reserved_time = null;

	u_name = request.getParameter("u_name");
	u_number= request.getParameter("u_number");
	date_check_in = request.getParameter("date_check_in");
	date_check_out = request.getParameter("date_check_out");
	
	Date now = new Date();
	SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	reserved_time = fm.format(now);

	userDAO UserDAO = new userDAO();
	UserDAO.user_info_a(u_name, u_number, date_check_in, date_check_out, reserved_time);
	
	out.println("<script>");
	out.println("alert('예약 완료');");
	out.println("location.href='calendar_a.jsp';");
	out.println("</script>");
%>
