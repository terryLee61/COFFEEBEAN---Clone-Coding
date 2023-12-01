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
        <title>문의사항</title>
    </head>

    <link rel="stylesheet" href="resources/style/qna.css">

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
                            <form action="QnaWrite" id="write" method="POST">
                                <fieldset>
                                    <legend>글쓰기</legend>
                                    <label for="title">제목: </label>
                                    <input type="text" id="title" class="title" name="title">

                                    <!-- 로그인 정보 불러오기 -->
                                    <label for="author">글쓴이: </label>
                                    <span>${sessionScope.log}</span>
                                    <input type="hidden" id="author" class="author" name="author" value="${sessionScope.log}" readonly></br>

                                    <label for="con">내용: </label>
                                    <input type="text" id="con" class="con" style="height: 50px;" name="contents">
                                </fieldset>
                                <button type="submit">글쓰기</button>
                            </form>
                                <a href="qna_list"><button>목록</button></a>
                           
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