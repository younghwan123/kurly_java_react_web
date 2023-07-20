<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "bbs.BbsDAO" %> 
<%@ page import = "bbs.BbsDTO" %> 
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
	
<div id='viewPage'>
	<div class='container'>
		<div class='title'>
			<h1>글보기</h1>
		</div>
		<div class='content'>
					
			<%
			    // bbsId 를 변수 bbsId=0 으로  초기화하고 받는다.
				int bbsId=0;
				if(request.getParameter("bbsId") !=null ){
					bbsId = Integer.parseInt(request.getParameter("bbsId"));			
				}
				
				// 만약 클릭한 글번호에 데이터가 없다면
				// 다시 게시판 목록으로 돌려보낸다.		
				if(bbsId==0){
			%>			
					<script>
						alert("데이터가 없습니다. 다시 확인하고 클릭하세요!");
						history.go(-1);
					</script>
			<%		
				}		
				
				
				// 해당 글번호 DAO에게 전달하기
				BbsDTO bbsDTO = new BbsDAO().getView(bbsId);
				
			%> 
	
			<ul>
				<li>
					<div class='table-header'>
						<div class='right'>
							<span class='subject-title'>글제목</span> <span class='subject-content'><%=bbsDTO.getSubject().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll(" ", "&nbsp;").replaceAll("\n", "<br>") %></span>
						</div>				
						<div class='right'>						
							<span>작성자</span> <span><%=bbsDTO.getUserId() %></span>	<i>|</i>			
							<span>작성일</span> <span><%=bbsDTO.getWriteDate() %></span>	<i>|</i>
							<span>글번호</span> <span><%=bbsDTO.getBbsId() %></span>
							<span>조회수</span> <span><%=bbsDTO.getHit() %></span>
						</div>
					</div>  
				</li>
				<li>
					<div class='body-text'>
						<%=bbsDTO.getContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll(" ", "&nbsp;").replaceAll("\n", "<br>") %>
					</div>
				</li>
			</ul>
		
		</div>
		
		<div class='button-box' style='text-align:center;'>
			<a class='list-btn'   href='./bbsListAction.jsp'>목록</a>
			<a class='update-btn' href='./updateForm.jsp?bbsId=<%=bbsId %>'>수정</a>
			<a class='delete-btn' onClick="return confirm('정말삭제하시겠습니까?');" href='./deleteAction.jsp?bbsId=<%=bbsId %>'>삭제</a>
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
	
	
	#viewPage {width:100%;padding:80px 0;}
	#viewPage .container {width:100%;max-width:80%;margin:0 auto;padding:50px;background:#f3f3f3;}
	#viewPage .container .title {text-align:center;padding:0 0 30px 0;}
	#viewPage .container .title h1 {font-size:23px;text-align:left;font-weight:500;}
	
	#viewPage .container .content {width:100%;background:#fff;}
	#viewPage .container .content ul {width:100%;border:1px solid #e6e6e6;border-top:2px solid #333;}
	
	#viewPage .container .content ul li {width:100%;display:flex;border-top:1px solid #999;padding:0 20px;}
	#viewPage .container .content ul li .table-header {display:flex;justify-content:space-between;align-items:center;height:70px;width:100%;padding:0 0 0 15px;}
	#viewPage .container .content ul li .table-header .left {display:flex;}
	#viewPage .container .content ul li .table-header .left .subject-title {font-weight:600;}
	#viewPage .container .content ul li .table-header .left .subject-content {max-width:656px;min-width:250px;white-space:nowrap;overflow: hidden;text-overflow:ellipsis;}
	#viewPage .container .content ul li .table-header .right {display:flex;padding: 0 15px 0 0;}
	#viewPage .container .content ul li .table-header .right span {padding: 0 5px;}
	#viewPage .container .content ul li .table-header .right i {margin:0 10px;font-style:normal;font-size:14px;color:#999;}
	
	#viewPage .container .content ul li span {padding: 0 0 0 20px;font-weight:500;}
	#viewPage .container .content ul li div.body-text {width:100%;padding:20px 20px 100px 20px;line-height:160%;}

	
	#viewPage .container .button-box {width:100%;padding: 50px 0 0 0; bakground:#f3f3f3;}
	#viewPage .container .button-box a {
		width:100px;height:48px;font-size:17px;color:#fff;border-radius:3px;border:0;display:inline-flex;
		background:#666;cursor:pointer;transition: all 0.3s;align-items:center;justify-content:center;margin:0 5px;
	}
	#viewPage .container .button-box a:hover {background:#111;}
	
	
</style>


</html>




