<%@ 
    page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>

<% 
    request.setCharacterEncoding("UTF-8"); 
%>

<%
    String fuits[] =  request.getParameterValues("chk");
    out.println("<ol>");
    for(String item : fuits){
        out.println("<li>" +  item   + "</li>");
    }
    out.println("</ol>");

%>
