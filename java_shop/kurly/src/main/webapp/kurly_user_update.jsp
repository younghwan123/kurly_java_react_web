
<%@ 
    page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>

<%@ page import = "kurly.UserDAO" %>
<%@ page import = "kurly.UserDTO" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보수정</title>
    <link rel="stylesheet" href="./public/css/style.css">

</head>
<body>
<div id="wrap">
    
    <%
        String loginId = null;
        if( session.getAttribute("user_id") != null){
            loginId = (String) session.getAttribute("user_id");
        }    
    %>

    <%
        UserDAO userDAO = new UserDAO();
        UserDTO userDTO = userDAO.getJoin( loginId );
    %>


    <section id="signup">
        <div class="container">
            <div class="title">
                <h2>회원정보수정</h2>                
            </div>
            <div class="content">
                <form name="update" autocomplete="off" id="update" method="post" action="./kurly_user_update_action.jsp">
                    <ul>
                        <li><%= userDTO.getUser_id() %></li>
                        <li class='hide'><input maxlength="16" autofocus required disa type="text" name="user_id" id="userId" placeholder="아이디를 입력하세요" value="<%=userDTO.getUser_id()%>"></li>
                        <li><input maxlength="16" autofocus required  type="password" name="user_pw" id="userPw" placeholder="수정 비밀번호를 입력하세요"  value="<%= userDTO.getUser_pw() %>"></li>
                        <li><input maxlength="30" autofocus required  type="text" name="user_name" id="userName" placeholder="수정 이름을 입력하세요"  value="<%= userDTO.getUser_name() %>"></li>
                        <li><input maxlength="250" autofocus required type="email" name="user_email" id="userEmail" placeholder="수정 이메일을 입력하세요" value="<%=userDTO.getUser_email()%>"></li>
                        <li><input maxlength="13" autofocus required  type="text" name="user_hp" id="userHp" placeholder="수정 휴대폰을 입력하세요" value="<%=userDTO.getUser_hp()%>"></li>
                        <li><input maxlength="250" autofocus required type="text" name="user_addr" id="userAddr" placeholder="수정 주소를 입력하세요" value="<%=userDTO.getUser_addr()%>"></li>
                        <li>
                            <input type="radio" name="user_gender" id="userMale"  value="남성" <% if(userDTO.getUser_gender().equals("남성")){ %>  checked="checked" <%}%>>
                            <label for="userMale">남성</label>
                            <input type="radio" name="user_gender" id="userFeMale"  value="여성" <% if(userDTO.getUser_gender().equals("여성")){ %>  checked="checked" <%}%>>
                            <label for="userFeMale">여성</label>
                            <input type="radio" name="user_gender" id="userNone" value="선택안함" <% if(userDTO.getUser_gender().equals("선택안함")){ %>  checked="checked" <%}%>>
                            <label for="userNone">선택안함</label>
                        </li>
                        <li><input maxlength="10" type="text" name="user_birth" id="userBirth" placeholder="수정 생년월일을 입력하세요" value="<%=userDTO.getUser_birth()%>"></li>
                    </ul>
                    <div class="submit">
                        <button type="submit">수정하기</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
</div>
</body>
</html>