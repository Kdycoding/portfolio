<%@page import="user.userDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    
 <%
 
 	String[] check = request.getParameterValues("check_box");
 	
 		try {
 			
		 	for(int i=0; i<check.length; i++) {
		 		
		 		userDAO UserDAO = new userDAO();
		 		UserDAO.delete_a(check[i]);%>
		 	<script>
 				alert("���� �Ϸ�");
 				location.href = "adminPage_a.jsp";
 			</script>
	 		<%}
		 	
 		}catch(Exception e) {%> 
 			
 			<script>
 				alert("üũ�� ������ �����ϴ�");
 				history.back();
 			</script>
 			
 		<%}
	 	 	
%>	 
 	
 		

 		