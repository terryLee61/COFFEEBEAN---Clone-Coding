<%@ page import="javax.mail.*,javax.mail.internet.*,java.util.*" %>
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
                                            alert("이미 존재하는 아이디 입니다.")
                                        } else if(memberId == ""){
                                            alert("아이디를 입력하세요.")
                                        } else {
                                            alert("사용할 수 있는 아이디 입니다.")
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
                            <input type="text" name="email" id="email" placeholder="abc@efgh.com">

                            <!-- 중복체크 -->
                            <button type="button" onclick="checkEmailDuplicate()" name="emailDupChk" id="emailDupChk">중복체크</button>
                            <script>
                                function checkEmailDuplicate() {
                                    var memberEmail = document.getElementById("email").value;
                            
                                    // HTML5에서 제공하는 이메일 유효성 검사
                                    if (document.getElementById("email").validity.valid) {
                                        var xhr = new XMLHttpRequest();
                                        xhr.open("POST", "EmailDup", true);
                                        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                                        xhr.onreadystatechange = function () {
                                            if (xhr.readyState === 4 && xhr.status === 200) {
                                                var response = JSON.parse(xhr.responseText);
                                                if (response.isDuplicate) {
                                                    alert("이미 존재하는 이메일 입니다.")
                                                    console.log("email:" + memberEmail);
                                                } else if(memberEmail == ""){
                                                    alert("이메일을 입력하세요")
                                                }else {
                                                    console.log("email:" + memberEmail);
                                                    alert("사용할 수 있는 이메일 입니다.")
                                                }
                                            }
                                        };
                                        xhr.send("email=" + encodeURIComponent(memberEmail));
                                    } else {
                                        alert("유효하지 않은 이메일 형식입니다.");
                                    }
                                }
                            </script>
                            
                            <!-- 이메일 인증 -->
                            <button type="button" onclick="sendEmailAuth()" name="emailAuthSend" id="emailAuthSend">인증메일 보내기</button>
							<script>
							function sendEmailAuth() {
							    var recipientEmail = document.getElementById("email").value; // 이메일 주소 가져오기

							    var xhr = new XMLHttpRequest();
							    xhr.open("POST", "SendEmail", true); // SendEmail은 이메일을 보내는 서블릿 URL입니다. 해당 URL을 실제로 사용하는 서블릿으로 변경해야 합니다.
							    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
							    xhr.onreadystatechange = function () {
							        if (xhr.readyState === 4) {
							            if (xhr.status === 200) {
							                alert("이메일을 성공적으로 보냈습니다.");
							            } else {
							                alert("이메일 보내기에 실패했습니다.");
							            }
							        }
							    };
							    xhr.send("recipientEmail=" + encodeURIComponent(recipientEmail));
							}

							</script>
							
                            <!-- 인증번호 입력 -->
                            <input type="text" name="email_num" id="email_num">
                            <button type="button" onclick="checkEmailAuth()" name="emailAuthChk" id="emailAuthChk">인증</button>

<script>
    function checkEmailAuth() {
        var enteredCode = document.getElementById("email_num").value; // 사용자가 입력한 인증번호

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "ChkEmail", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);
                if (response.isValid) {
                    alert("인증되었습니다.");
                    // 인증 성공 시 수행할 작업을 여기에 추가하세요
                } else {
                    alert("인증번호가 일치하지 않습니다.");
                }
            }
        };
        xhr.send("enteredCode=" + encodeURIComponent(enteredCode));
    }
</script>
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