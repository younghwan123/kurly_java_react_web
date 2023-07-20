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
<title>글쓰기</title>



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
			<%
				if(userId==null){
			%>
				<a href='./signup.jsp'>Signup</a>
				<a href='./login.jsp'>Login</a>
			<%
				}
				else{
			%>
				<a href='./logoutAction.jsp'>Logout</a>
			<%
				}
			%>	
			</div>
		</div>
	</header>

	<div id='write'>
		<div class='container'>
			<div class='title'>
				<h1>글쓰기폼</h1>
			</div>
			<div class='content'>
			    <form name="writeForm" autocomplete="off" id="writeForm" method="post" action="./writeAction.jsp">
			        <ul>	           	           
			            <li>
			            	<input type="text" maxlength="1000" name="subject" id="subject" placeholder="제목을 입력하세요">
			            </li>
			            <li>
			            	<textarea name="content" id="content" placeholder="내용을 입력하세요"></textarea>	
			            </li>
			        </ul>
			        <div class="button-box" style="text-align:center">
			            <button type="submit"> 등록 </button>
			        </div>
			    </form>
			</div>
		</div>
	</div>

		
</body>

<style type="text/css">
	* {margin:0; padding:0; vertical-align:center;box-sizing:border-box;}
	ul {list-style:none;}
	a {color:#333;text-decoration:none;}
	
	#header {width:100%;height:80px;background:#fff;border-bottom:1px solid #e6e6e6;}
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
	
	
	#write {width:100%;padding:60px 0 100px 0;}
	#write .container {width:100%;max-width:80%;margin:0 auto;padding:50px;background:#f3f3f3;}
	#write .container .title {text-align:left;padding:0 0 30px 0;}
	#write .container .title h1 {font-size:28px;font-weight:500;}
	
	#write .container .content {width:100%;height:auto;}
	#write .container .content form {width:100%;}
	#write .container .content form ul {width:100%;}
	#write .container .content form ul li {width:100%;padding:5px 0;}
	#write .container .content form ul li input {
		width:100%;height:60px;padding:0 15px;font-size:16px;border:1px solid #e6e6e6;
		outline-offset:-1px;outline:1px solid transparent;transition: all 0.3s;
	}
	#write .container .content form ul li textarea  {
		width:100%;height:400px;font-size:16px;border:1px solid #e6e6e6;
		outline-offset:-1px;outline:1px solid transparent;transition: all 0.3s;
		resize:none;padding:10px 15px;		
	}
	#write .container .content form .button-box {width:100%;padding: 50px 0 0 0; text-align:center;}
	#write .container .content form .button-box button {
		width:200px;height:50px;font-size:17px;color:#fff;border-radius:3px;border:0;
		background:#666;cursor:pointer;		
		transition: all 0.3s;
	}
	#write .container .content form .button-box button:hover {background:#111;}
	
</style>



</html>