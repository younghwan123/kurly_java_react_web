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

<%
    UserDAO userDAO = new UserDAO();
    int result = userDAO.signup(userDTO);
    out.println(result);
%>

