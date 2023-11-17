<%@page import="java.sql.PreparedStatement"%>
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
                        <div id="noticeList">
                            <h2>공지사항</h2>
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
                                
                                // 페이지당 보여줄 게시물 수
                                int recordsPerPage = 5;

                                // 현재 페이지 번호
                                int currentPage = 1;
                                if(request.getParameter("page") != null){
                                    currentPage = Integer.parseInt(request.getParameter("page"));
                                }

                                // 총 게시물 수를 구하는 쿼리 실행
                                int totalRecords = 0;
                                try {
                                    Connection conn = DriverManager.getConnection(url, username, password);
                                    Statement countStmt = conn.createStatement();
                                    ResultSet countRs = countStmt.executeQuery("SELECT COUNT(*) AS total FROM notice");
                                    if(countRs.next()) {
                                        totalRecords = countRs.getInt("total");
                                    }
                                    countRs.close();
                                    countStmt.close();
                                    conn.close();
                                } catch (Exception e) {
                                    out.println("Exception: " + e.getMessage());
                                    e.printStackTrace();
                                }

                                // 총 페이지 수 계산
                                int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

                                // 페이지 번호가 유효한지 확인하고 페이지 번호를 보정
                                if (currentPage < 1) {
                                    currentPage = 1;
                                } else if (currentPage > totalPages) {
                                    currentPage = totalPages;
                                }
                                // 데이터베이스 연결 및 쿼리 실행
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection(url, username, password);

                                    int startRecordIdx = (currentPage - 1) * recordsPerPage;

                                    // 페이징을 적용한 쿼리 실행
                                    String sql = "SELECT * FROM notice LIMIT ?, ?";
                                    PreparedStatement pstmt = conn.prepareStatement(sql);
                                    pstmt.setInt(1, startRecordIdx); // 페이지 시작 레코드 인덱스
                                    pstmt.setInt(2, recordsPerPage); // 가져올 레코드 수
                                    ResultSet rs = pstmt.executeQuery();


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
                                    pstmt.close();
                                    conn.close();
                                } catch (Exception e) {
                                    out.println("Exception: " + e.getMessage());
                                    e.printStackTrace();
                                }
                                %>
                                <!-- 페이지 링크 표시 -->
                            </table>
                            <div class="pagination">
                                <%-- 이전 페이지 링크 표시 --%>
                                <% if (currentPage > 1) { %>
                                    <a href="?page=<%= currentPage - 1 %>">이전</a>
                                <% } %>
                            
                                <%-- 페이지 번호 표시 --%>
                                <% for (int i = 1; i <= totalPages; i++) { %>
                                    <% if (i == currentPage) { %>
                                        <strong><%= i %></strong>
                                    <% } else { %>
                                        <a href="?page=<%= i %>"><%= i %></a>
                                    <% } %>
                                <% } %>
                            
                                <%-- 다음 페이지 링크 표시 --%>
                                <% if (currentPage < totalPages) { %>
                                    <a href="?page=<%= currentPage + 1 %>">다음</a>
                                <% } %>
                        <div class="writing">
                            <a href="notice_write"><button>글쓰기</button></a>
                        </div>
                    </div>
                </div>
            </section>
                <script>
                    function loginAlert(){
                        alert('로그인 후 이용해 주세요.');
                    }
                </script>
                    <!-- 게시글 상세 이동 js 코드 -->
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
                        } 
                    </script>  -->
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

            <!-- footer 시작 -->
            <jsp:include page="footer"></jsp:include>
            <!-- footer 끝 -->

        </div>
    </body>

    </html>