<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>공지사항_목록</title>
        <link rel="stylesheet" href="resources/style/notice.css">
    </head>

    <body>
        <div class="wrap">
            <!-- header 시작 -->
            <jsp:include page="header"></jsp:include>
            <!-- header 끝 -->

            <section id="wrap">
               <div class="main_wrap">
                    <div class="main_contents">
                        공지사항 게시판 입니다.
                        <div id="noticeList">
                            <h2>Notice List</h2>
                            <table border="1">
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>글쓴이</th>
                                    <th>날짜</th>
                                </tr>
                                <%
                                // 데이터베이스 연결 정보
                                String url = "jdbc:mysql://localhost:3306/personal";
                                String username = "root";
                                String password = "my1234";
                        
                                // 데이터베이스 연결 및 쿼리 실행
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection(url, username, password);

                                    String sql = "SELECT * FROM notice";
                                    Statement stmt = conn.createStatement();

                                    ResultSet rs = stmt.executeQuery(sql);

                                    while (rs.next()) {
                                        out.println("<tr>");
                                        out.println("<td>" + rs.getInt("notice_idx") + "</td>");

                                        // 제목을 클릭하여 상세 페이지로 이동하는 링크 추가
                                        out.println("<td><a href='notice_detail?id=" + rs.getInt("notice_idx") + "'>" + rs.getString("title") + "</a></td>");

                                        out.println("<td>" + rs.getString("author") + "</td>");
                                        out.println("<td>" + rs.getString("reg_date") + "</td>");
                                        out.println("</tr>");
                                    }

                                    // 리소스 정리
                                    rs.close();
                                    stmt.close();
                                    conn.close();
                                } catch (Exception e) {
                                    out.println("Exception: " + e.getMessage());
                                    e.printStackTrace();
                                }
                                %>
                            </table>
                        <div class="writing">
                            <a href="notice_write">글쓰기</a>
                        </div>
                    </div>
                    <!-- 게시글 상세 이동 js 코드 -->
                    <script>
                       /*  // JavaScript 코드
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

                                var notice_idx = document.createElement("td");
                                notice_idx.textContent = notice.notice_idx;
                                row.appendChild(notice_idx);
                    
                                var titleCell = document.createElement("td");
                                var titleLink = document.createElement("a");
                                titleLink.textContent = notice.title;
                                titleLink.setAttribute("href", "notice_detail?id=" + notice.notice_idx); // URL에 공지사항 ID 추가
                                titleCell.appendChild(titleLink);
                                row.appendChild(titleCell);
                    
                                var authorCell = document.createElement("td");
                                authorCell.textContent = notice.author;
                                row.appendChild(authorCell);
                    
                                var regDateCell = document.createElement("td");
                                regDateCell.textContent = notice.reg_date;
                                row.appendChild(regDateCell);
                    
                                noticeBody.appendChild(row);
                            });
                        } */
                    </script>
                    <!-- <script>
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

                                var notice_idxCell = document.createElement("td");
                                notice_idxCell.textContent = notice.notice_idx;
                                row.appendChild(notice_idxCell);

                                var titleCell = document.createElement("td");
                                titleCell.textContent = notice.title;
                                row.appendChild(titleCell);

                                // var contentsCell = document.createElement("td");
                                // contentsCell.textContent = notice.contents;
                                // row.appendChild(contentsCell);

                                var authorCell = document.createElement("td");
                                authorCell.textContent = notice.author;
                                row.appendChild(authorCell);

                                var regDateCell = document.createElement("td");
                                regDateCell.textContent = notice.reg_date;
                                row.appendChild(regDateCell);

                                noticeBody.appendChild(row);
                            });
                        }
                    </script> -->
                </div>
            </section>

            <!-- footer 시작 -->
            <jsp:include page="footer"></jsp:include>
            <!-- footer 끝 -->

        </div>
    </body>

    </html>