<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "kurly.UserDAO"  %>
<%@ page import = "kurly.UserDTO"  %>

<%
	request.setCharacterEncoding("UTF-8");
%> 


<%
	// 이름 입력상자, 이메일 입력상자 유효성검사 
	if( request.getParameter("user_id")==null ){
		%> 
			<script>
				alert("아이디를 입력상자에 입력해주세요!");
				history.go(-1);
			</script>
		<%	
	}
	else{
		UserDAO userDAO = new UserDAO();
		boolean result = userDAO.idCheckMethod( request.getParameter("user_id") );
		
		if(result==true){ // 중복
			%>
				<script>
					alert("중복된 아이디 확인하고 다시 시도하세요!");					
				</script>
			<%
		}
		else{ 
				
			%>				
				<script>
					alert("사용가능한아이디입니다.!");					
				</script>
			<%	
		}
		
	}
%>









