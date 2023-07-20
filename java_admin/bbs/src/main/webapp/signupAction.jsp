<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "bbs.UserDAO" %>    

<%
	request.setCharacterEncoding("UTF-8");
%>  
  
<jsp:useBean id="UserDTO" class="bbs.UserDTO" scope="page"/>    
<jsp:setProperty name="UserDTO" property="userId"/>
<jsp:setProperty name="UserDTO" property="userPw"/>
<jsp:setProperty name="UserDTO" property="userName"/>
<jsp:setProperty name="UserDTO" property="userEmail"/>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		// 유효성 체크
		if(UserDTO.getUserId()==null || UserDTO.getUserPw()==null || UserDTO.getUserName()==null){
	%>			
			<script>
				alert("아이디, 비밀번호, 이름은 필수 입력사항 입니다.");
				history.go(-1);
			</script>
	<%			
		}
		else{
			// DAO 클래스의 정보를 저장하고 그리고 리턴값 받는다
			UserDAO userDAO = new UserDAO();
			int result = userDAO.signup(UserDTO); // 모든 입력값 하나의 아규먼트1개 매개변수로 전달
			if(result==-1){				
	%>			
				<script>
					alert("가입오류 이미 입력된 아이디 입니다.");
					history.go(-1);
				</script>
	<%	
			}
			else {
	%>			
				<script>
					alert("회원가입 성공입니다.");
					location.href = "./write.jsp";
				</script>
	<%	
			} // 회원가입 여부 조건문
			
		}  // 유효성 체크 조건문
	%>

</body>
</html>