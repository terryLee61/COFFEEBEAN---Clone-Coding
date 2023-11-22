<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>

            <link rel="stylesheet" href="resources/style/form.css">

        </head>

        <body>
            <!-- header 시작 -->
            <jsp:include page="header_form"></jsp:include>
            <!-- header 끝 -->

            <section id="wrap">
                <!-- 회원가입 폼 -->
                <div class="form_wrap">
                    <form action="Join" method="post" id="form">
                        <fieldset>
                            <legend>회원가입</legend>

                            <!-- 아이디 -->
                            <span>아이디: </span>
                            <input type="text" name="id" id="id" placeholder="아이디"></br>
                            <button type="button" onclick="checkIdDuplicate()" id="idDupChk" name="idDupChk">중복체크</button></br>

                            <script>
                            function checkIdDuplicate() {
                                var memberId = document.getElementById("id").value;

                                var xhr = new XMLHttpRequest();
                                xhr.open("POST", "IdDup", true);
                                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                                xhr.onreadystatechange = function () {
                                    if (xhr.readyState === 4 && xhr.status === 200) {
                                        var response = JSON.parse(xhr.responseText);
                                        if (response.isDuplicate) {
                                            console.log("ID is duplicate");
                                        } else {
                                            console.log("ID is not duplicate");
                                        }
                                    }
                                };
                                xhr.send("id=" + encodeURIComponent(memberId));
                            }

            
                            </script>
                            <!-- 비밀번호 -->
                            <span>비밀번호: </span>
                            <input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요.">

                            <!-- 이름 -->
                            <span>이름: </span>
                            <input type="text" name="name" id="name">

                            <!-- 이메일 -->
                            <span>이메일: </span>
                            <input type="email" name="email" id="email" placeholder="abc@efgh.com">

                            <!-- 중복체크 -->
                            <button onclick="checkEmailDuplicate()" name="emailDupChk" id="emailDupChk">중복체크</button>

                            <!-- 이메일 인증 -->
                            <button onclick="sendEmailAuth()" name="emailAuthSend" id="emailAuthSend">인증메일 보내기</button>

                            <!-- 인증번호 입력 -->
                            <input type="text" name="email_num" id="email_num">
                            <button onclick="checkEmailAuth()" name="emailAuthChk" id="emailAuthChk">인증</button>


                            <!-- 가입버튼 -->
                            <input type="submit" value="가입">
                        </fieldset>
                    </form>
                </div>
            </section>

            <!-- footer 시작 -->
            <jsp:include page="footer"></jsp:include>
            <!-- footer 끝 -->

        </body>

        </html>