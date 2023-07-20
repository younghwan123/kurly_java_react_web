<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "kurly.UserDAO"  %>
<%@ page import = "kurly.UserDTO"  %>

<%
	request.setCharacterEncoding("UTF-8");
%> 


<%
	// 이름 입력상자, 이메일 입력상자 유효성검사 
	if( request.getParameter("user_pw")==null || request.getParameter("user_pw2")==null ){
%>
		<script>
			alert("비밀번호가 빈값이 있습니다 다시 시도하세요!");
			history.go(-1);
		</script>		
<%		
	}
	else if( request.getParameter("user_pw") != request.getParameter("user_pw2") ){
%>
		<script>
			alert("비밀번호가 일치하지 않습니다. 다시 시도하세요!");
			history.go(-1);
		</script>		
<%		
	}
	else{
		

	     int result = new UserDAO().pwReset(request.getParameter("user_pw"), request.getParameter("user_id"));		

//		UserDAO  userDAO = new UserDAO();
//		int result = userDAO.pwReset(request.getParameter("user_pw"), request.getParameter("user_id"));		
		
		if(result==-1){
%>
		<script>
			alert("비밀번호 재설정 실패 했습니다. 입력값 확인하고 다시 시도하세요!");
			history.go(-1);
		</script>
<%			
		}
		else{
%>			
		<script>
			alert("비밀번호 재설정 되었습니다.");
		</script>		
<%			
		}
		
	}
%>









