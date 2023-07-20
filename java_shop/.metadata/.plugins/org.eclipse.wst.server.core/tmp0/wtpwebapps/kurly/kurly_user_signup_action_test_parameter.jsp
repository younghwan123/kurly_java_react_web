<%
    response.setHeader("Access-Control-Allow-Origin","*");
%>

<%@ 
    page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>

<%@ page import = "kurly.UserDAO" %>

<% 
    request.setCharacterEncoding("UTF-8");     
%>

<%
    // 1. Request  : 리액트에서 AJAX Rest API 로 전송된 파라미터를 변수에 저장하고 다시
    // 2. Response : 리액트에게 응답하는 절차 입니다
    String user_id =     request.getParameter("user_id");
    String user_pw =     request.getParameter("user_pw");
    String user_irum =   request.getParameter("user_irum");
    String user_email =  request.getParameter("user_email");
    String user_hp =     request.getParameter("user_hp");
    String user_addr =   request.getParameter("user_addr");
    String user_gender = request.getParameter("user_gender");
    String user_birth =  request.getParameter("user_birth");
    String user_chooga = request.getParameter("user_chooga");
    String user_service= request.getParameter("user_service");

%>

{"아이디":"<%=user_id%>", "비밀번호":"<%=user_pw%>", "이름":"<%=user_irum%>",  "이메일":"<%=user_email%>",  "휴대폰":"<%=user_hp%>",  "주소":"<%=user_addr%>", "성별":"<%=user_gender%>",  "생년월일": "<%=user_birth%>", "추가입력사항":"<%=user_chooga%>",  "이용약관동의":"<%=user_service%>" }