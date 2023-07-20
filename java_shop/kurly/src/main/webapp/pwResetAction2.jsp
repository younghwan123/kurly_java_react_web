<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "kurly.UserDAO"  %>
<%@ page import = "kurly.UserDTO"  %>

<%
	request.setCharacterEncoding("UTF-8");
%> 


<%
//		int result = new UserDAO().pwReset("1234567890", "moonjongmaga");		
//		int result = new UserDAO().pwReset(request.getParameter("user_pw"), request.getParameter("user_id"));		

		UserDAO  userDAO = new UserDAO();
		int result = userDAO.pwReset(request.getParameter("user_pw"), request.getParameter("user_id"));		
		
		out.println( result );	

%>









