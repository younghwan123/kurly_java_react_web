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

<jsp:useBean id="userDTO" class="kurly.UserDTO" scope="page"/>
<jsp:setProperty name="userDTO" property="user_id" />
<jsp:setProperty name="userDTO" property="user_pw" />
<jsp:setProperty name="userDTO" property="user_irum" />
<jsp:setProperty name="userDTO" property="user_email" />
<jsp:setProperty name="userDTO" property="user_hp" />
<jsp:setProperty name="userDTO" property="user_addr" />
<jsp:setProperty name="userDTO" property="user_gender" />
<jsp:setProperty name="userDTO" property="user_birth" />
<jsp:setProperty name="userDTO" property="user_chooga" />
<jsp:setProperty name="userDTO" property="user_service" />


{"아이디":"<%=userDTO.getUser_id()%>", "비밀번호":"<%=userDTO.getUser_pw()%>", "이름":"<%=userDTO.getUser_irum()%>",  "이메일":"<%=userDTO.getUser_email()%>",  "휴대폰":"<%=userDTO.getUser_hp()%>",  "주소":"<%=userDTO.getUser_addr()%>", "성별":"<%=userDTO.getUser_gender()%>",  "생년월일": "<%=userDTO.getUser_birth()%>", "추가입력사항":"<%=userDTO.getUser_chooga()%>",  "이용약관동의":"<%=userDTO.getUser_service()%>" }