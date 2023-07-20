
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
    <title>Document</title>
    <link rel="stylesheet" href="./public/css/style.css">

</head>
<body>
<div id="wrap">
    <section id="signup">
        <div class="container">
            <div class="title">
                <h2>SIGN UP</h2>
            </div>
            <div class="content">
                <form name="sign_up" autocomplete="off" id="signUp" method="post" action="./kurly_user_signup_action.jsp">
                    <ul>
                        <li><input maxlength="16" autofocus required  type="text" name="user_id" id="userId" placeholder="아이디를 입력하세요"></li>
                        <li><input maxlength="16" autofocus required  type="password" name="user_pw" id="userPw" placeholder="비밀번호를 입력하세요"></li>
                        <li><input maxlength="30" autofocus required  type="text" name="user_name" id="userName" placeholder="이름을 입력하세요"></li>
                        <li><input maxlength="250" autofocus required type="email" name="user_email" id="userEmail" placeholder="이메일을 입력하세요"></li>
                        <li><input maxlength="13" autofocus required  type="text" name="user_hp" id="userHp" placeholder="휴대폰을 입력하세요"></li>
                        <li><input maxlength="250" autofocus required type="text" name="user_addr" id="userAddr" placeholder="주소를 입력하세요"></li>
                        <li>
                            <input type="radio" name="user_gender" id="userMale" placeholder="성별을 입력하세요" value="남성">
                            <label for="userMale">남성</label>
                            <input type="radio" name="user_gender" id="userFeMale" placeholder="성별을 입력하세요" value="여성">
                            <label for="userFeMale">여성</label>
                            <input type="radio" name="user_gender" id="userNone" placeholder="성별을 입력하세요" value="선택안함">
                            <label for="userNone">선택안함</label>
                        </li>
                        <li><input maxlength="10" type="text" name="user_birth" id="userBirth" placeholder="생년월일을 입력하세요"></li>
                    </ul>
                    <div class="submit">
                        <button type="submit">가입하기</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
</div>
</body>
</html>