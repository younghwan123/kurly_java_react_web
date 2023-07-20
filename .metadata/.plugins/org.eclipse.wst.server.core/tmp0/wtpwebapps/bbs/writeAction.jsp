<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "bbs.BbsDAO" %>

<%
	request.setCharacterEncoding("UTF-8");
%> 

<jsp:useBean id="BbsDTO" class="bbs.BbsDTO" scope="page"/> 
<jsp:setProperty name='BbsDTO'  property="userId"/>
<jsp:setProperty name='BbsDTO'  property="subject"/>
<jsp:setProperty name='BbsDTO'  property="content"/>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1> 글쓰기 액션 파일 </h1>


<%
// 로그인 정보 => 세션 가져오기
String userId = null;
if(session.getAttribute("userId")!=null){ // 세션값이 비어있지 않으면 세션아이디 변수에 저장
	userId = (String)session.getAttribute("userId");
}
%>

<%
// 로그인 성공한 회원만 글을 쓸수있도록 제한 조건을 구현한다.
if(userId == null) {
%>	
	<script>
		alert("로그인하세요 \n 회원만이 글을 쓸수 있습니다.");
		location.href="./login.jsp";
	</script>
	
<%		
}
else{
     
	if( BbsDTO.getSubject()==null || BbsDTO.getContent()==null ){ //입력 제목, 내용 빈값이면
%>
		<script>
			alert("빈값은 허용하지 않습니다. \n 확인하고 다시 시도하세요");
			history.go(-1);
		</script>
<%
	}
	else{		
		BbsDAO bbsDAO = new BbsDAO();
		                        //  로그인 아이디 userId 로 글쓰기
		int result = bbsDAO.write( userId , BbsDTO.getSubject(), BbsDTO.getContent());
		
		
		if(result==-1){ // 데이터베이스 오류
%>	
		
			<script>				
				alert("글쓰기 오류입니다. \n 데이터베이를 확인하고 다시 시도하세요");
				history.go(-1);
			</script>
			
<%			
		}
		else{ // 글쓰기 성공
%>			
			
			<script>				
				alert("글쓰기 성공 \n bye bye!!!");
				location.href='./bbsListAction.jsp' ; // 글목록 이동
			</script>
			
<%				
		} // 글쓰기 성공여부 조건문 끝
		
   } // 글쓰기 입력화면의 입력 빈값 이냐 아니냐 조건문 끝
	
} // 세션 조건문 로그인 여부 판단조건 끝
%>

</body>
</html>