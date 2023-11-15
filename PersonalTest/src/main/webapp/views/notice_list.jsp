<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>공지사항_목록</title>
    </head>

    <body>
        <div class="wrap">
            <!-- header 시작 -->
            <jsp:include page="header"></jsp:include>
            <!-- header 끝 -->

            <section id="wrap">
                <div class="main_contents">
                    공지사항 게시판 입니다.
                    <div id="noticeContainer">

                    </div>
                    <div class="writing">
                        <a href="notice_write">글쓰기</a>
                    </div>
                </div>
                 <script>
                    // JavaScript 코드
                    window.onload = function () {
                        loadNotices();
                    };

                    function loadNotices() {
                        var xhttp = new XMLHttpRequest();
                        xhttp.onreadystatechange = function () {
                            if (this.readyState == 4 && this.status == 200) {
                                var notices = JSON.parse(this.responseText);
                                displayNotices(notices);
                            }
                        };
                        xhttp.open("GET", "NoticeList", true);
                        xhttp.send();
                    }

                    function displayNotices(notices) {
                        var noticeContainer = document.getElementById("noticeContainer");
                        var html = '';

                        notices.forEach(function (notice) {
                            html += '<div class="notice">';
                            html += '<h2>' + notice.title + '</h2>';
                            html += '<p>' + notice.contents + '</p>';
                            html += '<p>작성자: ' + notice.author + '</p>';
                            html += '<p>작성일: ' + notice.reg_date + '</p>';
                            html += '</div>';
                        });

                        noticeContainer.innerHTML = html;
                    }

                </script> 
            </section>

            <!-- footer 시작 -->
            <jsp:include page="footer"></jsp:include>
            <!-- footer 끝 -->

        </div>
    </body>

    </html>