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

<%
    if(
           userDTO.getUser_id()==null
        || userDTO.getUser_pw()==null
    ){
%>
    <script>
        alert("빈값은 허용하지 않습니다. \n확인하고 다시시도해주세요");
        history.go(-1);
    </script>
<%
    }
    else{
        UserDAO userDAO = new UserDAO();
        int result = userDAO.delete( userDTO.getUser_id(), userDTO.getUser_pw() );
%>
        

        <% 
            if(result>=1){ 
            session.invalidate();
        %>
            <script>                
                alert("회원탈퇴(삭제) 되었습니다.");
                window.location.href = "./kurly_user_main.jsp";                
            </script>
        <% 
            }
            else { 
        %>
                <script>
                    alert(<%= result %> );
                    alert("회원탈퇴(삭제) 실패 되었습니다. \n 아이디 비밀번호 확인 후 다시 시도하세요");
                    history.go(-1);    
                </script>
        <%
            }
        %>


<%
    }
%>


