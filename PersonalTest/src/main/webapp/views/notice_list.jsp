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
                    <table id="noticeTable" style="border: 1px solid black;">
                        <thead>
                            <tr>
                                <th>제목</th>
                                <th>내용</th>
                                <th>작성자</th>
                                <th>작성일</th>
                            </tr>
                        </thead>
                        <tbody id="noticeBody">
                            <!-- 여기에 공지사항 목록이 들어갈 것입니다 -->
                        </tbody>
                    </table>
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
                        var noticeBody = document.getElementById("noticeBody");

                        notices.forEach(function (notice) {
                            var row = document.createElement("tr");

                            var titleCell = document.createElement("td");
                            titleCell.textContent = notice.title;
                            row.appendChild(titleCell);

                            var contentsCell = document.createElement("td");
                            contentsCell.textContent = notice.contents;
                            row.appendChild(contentsCell);

                            var authorCell = document.createElement("td");
                            authorCell.textContent = notice.author;
                            row.appendChild(authorCell);

                            var regDateCell = document.createElement("td");
                            regDateCell.textContent = notice.reg_date;
                            row.appendChild(regDateCell);

                            noticeBody.appendChild(row);
                        });
                    }
                </script>

            </section>

            <!-- footer 시작 -->
            <jsp:include page="footer"></jsp:include>
            <!-- footer 끝 -->

        </div>
    </body>

    </html>