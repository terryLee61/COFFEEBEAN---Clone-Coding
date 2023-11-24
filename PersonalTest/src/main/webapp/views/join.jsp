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
                                <button type="button" onclick="checkIdDuplicate()" id="idDupChk"
                                    name="idDupChk">중복체크</button></br>

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
                                <button type="button" onclick="checkEmailDuplicate()" name="emailDupChk"
                                    id="emailDupChk">중복체크</button>

                                <!-- 이메일 인증 -->
                                <button type="button" onclick="sendEmailAuth()" name="emailAuthSend"
                                    id="emailAuthSend">인증메일 보내기</button>

                                <!-- 인증번호 입력 -->
                                <input type="text" name="email_num" id="email_num">
                                <button type="button" onclick="checkEmailAuth()" name="emailAuthChk"
                                    id="emailAuthChk">인증</button>

                                <!-- 주소지 입력 -->
                                <input type="text" name="postcode" id="postcode" placeholder="우편번호">
                                <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>

                                <input type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소"
                                    size="60"><br>

                                <input type="hidden" id="jibunAddress" placeholder="지번주소" size="60">

                                <span id="guide" style="color:#999;display:none"></span>

                                <input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소"
                                    size="60"><br>

                                <input type="hidden" id="extraAddress" placeholder="참고항목" size="60">
                                <input type="hidden" id="engAddress" placeholder="영문주소" size="60"><br>

                                <!-- address 값을 저장할 input 요소 추가 -->
                                <input type="hidden" name="address" id="address">
                                
                                <!-- 다음 주소 api -->
                                <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
                            
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
            <script src="resources/script/join.js"></script>

            </html>