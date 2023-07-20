<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "bbs.BbsDAO" %> 
<%@ page import = "bbs.BbsDTO" %> 
<%@ page import = "java.util.ArrayList" %> 
<%
	request.setCharacterEncoding("UTF-8");
%> 


		<%
			int pageNumber = 1;			
			if(request.getParameter("pageNumber") !=null ){
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			}
			
			BbsDAO bbsDAO = new BbsDAO(); 
		    ArrayList<BbsDTO> list = bbsDAO.getList(pageNumber);
 
		    StringBuffer result = new StringBuffer("");
		    result.append("{\"공지사항\" : [");
		    
		    for(int i=0; i<list.size(); i++){
		    	result.append("{\"번호\":" + list.get(i).getBbsId() + ","); 
		    	result.append("\"제목\":\"" + list.get(i).getSubject() + "\","); 
		    	result.append("\"작성자\":\"" + list.get(i).getUserId() + "\",");	
		    	
		    	if(i==list.size()-1){
		    		result.append("\"작성일\":\"" + list.get(i).getWriteDate() + "\"}");
		    	}
		    	else{
			    	result.append("\"작성일\":\"" + list.get(i).getWriteDate() + "\"},");
			    }
			}
		    result.append("]}");
		    out.println( result.toString() );
		%>
			
					
					
					
					