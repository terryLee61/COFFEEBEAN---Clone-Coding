<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="javax.servlet.http.HttpSession"%>
<%  // 세션이 null이거나 세션에 로그인 정보가 없을 경우
    if (session == null || session.getAttribute("log") == null) { %>
        <script>
            alert('로그인이 필요합니다.');
            window.location.href = 'login'; // 로그인 페이지로 이동
        </script>
<%  } %>

    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>공지사항</title>
    </head>

    <link rel="stylesheet" href="resources/style/notice.css">

    <!-- <script type="text/javascript" src="resources/script/jquery.min.js"></script> -->
    <body>
        <div class="wrap">
            <!-- header 시작 -->
            <jsp:include page="header_form"></jsp:include>
            <!-- header 끝 -->

            <section id="wrap">
                <div class="contents_wrap">
                    <div class="main_contents">
                        글쓰기 입니다.
                        
                        <!-- 임시 글쓰기 창 -->
                        <div class="writing">
                            <form action="NoticeWrite" id="write" method="POST">
                                <fieldset>
                                    <legend>글쓰기</legend>
                                    <label for="title">제목: </label>
                                    <input type="text" id="title" class="title" name="title">

                                    <!-- 로그인 정보 불러오기 -->
                                    <label for="author">글쓴이: </label>
                                    <input type="text" id="author" class="author" name="author" value="${sessionScope.log}" readonly>

                                    <label for="con">내용: </label>
                                    <input type="text" id="con" class="con" style="height: 50px;" name="contents">
                                </fieldset>
                                <button type="submit">글쓰기</button>
                            </form>
                                <a href="notice_list"><button>목록</button></a>
                            <!-- <script>
                                document.getElementById('write').addEventListener('submit', function (event) {
                                    event.preventDefault(); // 폼 기본 동작 방지

                                    // 폼 데이터 가져오기
                                    var formData = new FormData(this);

                                    // AJAX 요청 보내기
                                    fetch('NoticeWrite', {
                                        method: 'POST',
                                        body: formData
                                    })
                                        .then(response => {
                                            // 응답 처리
                                            if (response.ok) {
                                                // 성공적으로 응답을 받았을 때의 동작
                                                console.log('글쓰기 성공');
                                                // 추가적인 동작 수행 가능
                                            } else {
                                                // 응답이 실패했을 때의 동작
                                                console.error('글쓰기 실패');
                                            }
                                        })
                                        .catch(error => {
                                            // 오류 처리
                                            console.error('요청 실패', error);
                                        });
                                });

                            </script> -->
                        </div>
                    </div>
                </div>
            </section>

            <!-- footer 시작 -->
            <jsp:include page="footer"></jsp:include>
            <!-- footer 끝 -->

        </div>
    </body>

    </html>