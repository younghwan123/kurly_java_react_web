<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "bbs.BbsDAO" %> 
<%@ page import = "bbs.BbsDTO" %> 

<%
	request.setCharacterEncoding("UTF-8");
%>  
  
<%
    // bbsId 를 변수 bbsId=0 으로  초기화하고 받는다.
    out.println( request.getParameter("bbsId") );

	int bbsId=0;
	if(request.getParameter("bbsId") !=null ){
		bbsId = Integer.parseInt(request.getParameter("bbsId"));	
		int result = new BbsDAO().hitCount(bbsId);		
		out.println( result );
	}	
	
%> 

			