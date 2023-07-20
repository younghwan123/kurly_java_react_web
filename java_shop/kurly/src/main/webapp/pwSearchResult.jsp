<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

</head>
<body>
	

	
<div id='pwSearchResult'>
	<div class='container'>
		<div class='title'>
			<h1>고객님의 컬리계정을 찾았습니다.</h1>
			<h5>비밀번호 확인 후 로그인해 주세요.</h5>
		</div>
		
		<div class="content">
	         <ul>
	            <li><h1><%=request.getParameter("user_pw") %></h1></li>
	            <li><h1><%=request.getParameter("user_gaib_date") %></h1></li>
	        </ul>
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
	
	
	
	
	
	
	#pwSearchResult {width:100%;padding:100px 0;}
	#pwSearchResult .container {width:100%;max-width:50%;min-width:320px;margin:0 auto;padding:80px;background:#f3f3f3;}
	#pwSearchResult .container .title {text-align:center;padding:0 0 60px 0;}
	#pwSearchResult .container .title h1 {font-size:28px;text-align:center;color:#5f0080;font-weight:500;}
	
	#pwSearchResult .container .content {width:100%;height:auto;}
	#pwSearchResult .container .content  {width:100%;}
	#pwSearchResult .container .content  ul {width:100%;}
	#pwSearchResult .container .content  ul li {width:100%;padding:5px 0;text-align:center;}

	#pwSearchResult .container .content ul li input:focus {outline:1px solid #888;}
	
	
	#pwSearchResult .container .content  .search-box {
		width:100%;
		padding: 10px 0 0 0; 
		text-align:right;		
		font-size:13px;		
	}
	#pwSearchResult .container .content  .search-box a {color:#444;font-weight:500;}
	#pwSearchResult .container .content  .search-box a:hover {color:#5f0080;}
	#pwSearchResult .container .content  .search-box i {color:#ccc;margin:0 10px;font-style:normal;font-size:13px;}
	
	#pwSearchResult .container .content  .button-box {width:100%;padding: 30px 0 50px 0; text-align:center;}
	#pwSearchResult .container .content  .button-box a {
		display:inline-flex;
		align-items:center;
		justify-content:center;
		width:100%;height:48px;font-size:17px;color:#fff;border-radius:3px;border:0;
		background:#666;cursor:pointer;		
		transition: all 0.3s;
		margin:3px 0;
	}
		#pwSearchResult .container .content  .button-box a.login-btn{background:#fff;color:#5f0080;border:1px solid #5f0080;}
	}
	#pwSearchResult .container .content  .button-box a:hover {background:#111;}
	
</style>

</html>