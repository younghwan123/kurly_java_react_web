<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "bbs.BbsDTO" %>
<%
	request.setCharacterEncoding("UTF-8");
%> 

<%
	//1. 글 번호 유효성 검증
	int bbsId = 0; // 테스트
	if(request.getParameter("bbsId")!=null ){
		bbsId = Integer.parseInt(request.getParameter("bbsId")); // 글번호 가져오기
	}
					
	// 2. 삭제 메서드에 삭제할 글번호를 전달하고 삭제 한다. 
	BbsDAO bbsDAO = new BbsDAO();
	int result = bbsDAO.delete(bbsId);
	
	out.println( result );
	
%>	