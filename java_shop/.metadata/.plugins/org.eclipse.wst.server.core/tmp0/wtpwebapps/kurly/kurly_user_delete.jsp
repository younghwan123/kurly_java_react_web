
<%@ 
    page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴</title>
    <link rel="stylesheet" href="./public/css/style.css">

</head>
<body>
<div id="wrap">

    <%
        String loginId = null;
        if(session.getAttribute("user_id") !=null ){
            loginId = (String) session.getAttribute("user_id");
        }
    %>

    <section id="signup" class='signin'>
        <div class="container">
            <div class="title">
                <h2>회원탈퇴</h2>
            </div>
            <div class="content">
                <form name="sign_up" autocomplete="off" id="signUp" method="post" action="./kurly_user_delete_action.jsp">
                    <ul>
                        <li><input maxlength="16" autofocus required  type="text" name="user_id" id="userId" placeholder="아이디를 입력하세요" value=<%= loginId %>></li>
                        <li><input maxlength="16" autofocus required  type="text" name="user_pw" id="userPw" placeholder="비밀번호를 입력하세요"></li>
                    </ul>
                    <div class="submit">
                        <button type="submit">회원삭제</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
</div>
</body>
</html>