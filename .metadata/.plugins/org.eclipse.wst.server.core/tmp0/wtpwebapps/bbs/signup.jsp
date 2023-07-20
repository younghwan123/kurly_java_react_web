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
<title>회원가입폼</title>
	<style type="text/css">
		* {margin:0; padding:0; vertical-align:center;box-sizing:border-box;}
		ul {list-style:none;}
		a {color:#333;text-decoration:none;}
			
		#header {width:100%;height:80px;background:#f7f7f7;border-bottom:1px solid #ccc;}
		#header .container {
			width:100%;max-width:80%;margin:0 auto;
			height:100%;
			display:flex;
			align-items:center;		
			justify-content:space-between;
			font-weight:600;
		}	
		
		#header .container .left  {width:50%;}
		#header .container .left  h1 {font-size:24px;display:inline-block;color:#5f0080;margin:0 20px; 0 0;}
		#header .container .left  a  {foant-size:17px;color:#333;margin:0 10px;}
		#header .container .left  a:hover  {color:#5f0080;}
		#header .container .right {width:50%;text-align:right;}
		#header .container .right a  {foant-size:17px;color:#333;margin:0 10px;}
		#header .container .right a:hover  {color:#5f0080;}
		
		#signup {width:100%;padding:100px 0;}
		#signup .container {width:100%;max-width:600px;margin:0 auto;}
		#signup .container .title {text-align:center;padding:0 0 60px 0;}
		#signup .container .title h2 {font-size:28px;font-weight:500;}
		
		#signup .container .content {width:100%;border-top:2px solid #333;padding: 10px 0 0 0;}
		#signup .container .content form {width:100%;}
		#signup .container .content form ul {width:100%;}
		#signup .container .content form ul li {width:100%;padding:5px 0;}
		#signup .container .content form ul li input {
				width:100%;height:48px;padding:0 15px;font-size:16px;border:1px solid #ddd;
				outline-offset:-1px;outline:1px solid transparent;transition: all 0.3s;
		}
		
		#signup .container .content form ul li input:focus {outline:1px solid #888;}
		
		#signup .container .content form .button-box {width:100%;padding: 50px 0; text-align:center;}
		#signup .container .content form .button-box button {
			width:100%;height:48px;font-size:17px;color:#fff;border-radius:3px;border:0;
			background:#333;cursor:pointer;		
			transition: all 0.3s;
		}
		#signup .container .content form .button-box button:hover {background:#111;}
	
	</style>
</head>
<body>



<%
// 로그인 정보 => 세션 가져오기
String userId = null;
if(session.getAttribute("userId")!=null){ // 세션값이 비어있지 않으면 세션아이디 변수에 저장
	userId = (String)session.getAttribute("userId");
}
%>

	<header id='header'>
		<div class='container'>
			<div class='left'>
				<h1>BBS Board</h1>
				<a href='./admin.jsp'>HOME</a>
				<a href='./bbsListAction.jsp'>게시판</a>
			</div>
			<div class='right'>

				<a href='./signup.jsp'>Signup</a>
				<a href='./login.jsp'>Login</a>
			
			</div>
		</div>
	</header>




<div id="signup">
	<div class='container'>
		<div class='title'>
			<h2>회원가입</h2>
		</div>
		<div class='content'>
			<form name='signupForm' id='signupForm' method='post' action='./signupAction.jsp'>
				<ul>
					<li><input type='text' name='userId' id='userId' placeholder='아이디를 입력하세요'></li>
					<li><input type='text' name='userPw' id='userPw' placeholder='비밀번호를 입력하세요'></li>
					<li><input type='text' name='userName' id='userName' placeholder='이름을 입력하세요'></li>
					<li><input type='text' name='userEmail' id='userEmail' placeholder='이메일을 입력하세요'></li>
				</ul>
				<div class='button-box'>
					<button type='submit'>회원가입</button>
				</div>
			</form>
		</div>
		
	</div>
	
</div>

</body>
</html>