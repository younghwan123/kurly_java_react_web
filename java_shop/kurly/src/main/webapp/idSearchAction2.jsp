<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "kurly.UserDAO"  %>
<%@ page import = "kurly.UserDTO"  %>

<%
	request.setCharacterEncoding("UTF-8");
%> 


<%
	// 이름 입력상자, 이메일 입력상자 유효성검사 
	if( request.getParameter("user_irum")==null || request.getParameter("user_hp")==null ){		
		out.println("이름, 이메일 입력상자 입력해주세요!");
	}
	else{
		UserDTO userDTO = new UserDAO().idSearch(request.getParameter("user_irum"), request.getParameter("user_hp"));		
%>
		{"아이디":"<%= userDTO.getUser_id() %>","가입일":"<%= userDTO.getUser_gaib_date() %>"}
<%
	}
%>




 






