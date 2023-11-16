<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>공지사항_상세</title>
    </head>

    <link rel="stylesheet" href="resources/style/notice.css">

    <body>
        <div class="wrap">
            <!-- header 시작 -->
            <jsp:include page="header_form"></jsp:include>
            <!-- header 끝 -->

            <section id="wrap">
                <div class="contents_wrap">
                    <div class="main_contents">
                        <div id="noticeBody">
<%
// 데이터베이스 연결 정보
String url = "jdbc:mysql://localhost:3306/personal";
String username = "root";
String password = "my1234";

// notice_idx 값 가져오기
String notice_id = request.getParameter("id");

// 데이터베이스 연결 및 쿼리 실행
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, username, password);

    String sql = "SELECT * FROM notice WHERE notice_idx = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, notice_id);

    ResultSet rs = pstmt.executeQuery();

    if (rs.next()) {
        %>
                <div class="detail_con">
                    <!-- 번호: <%= rs.getInt("notice_idx") %><br> -->
                    제목: <%= rs.getString("title") %><br>
                    글쓴이: <%= rs.getString("author") %><br>
                    내용: <%= rs.getString("contents") %><br>
                    최종 수정날짜: <%= rs.getString("reg_date") %><br>
                    <a href="notice_update?id=<%= rs.getInt("notice_idx")    %>"><button>수정</button></a>
                    <a href="javascript:void(0);" onclick="confirmDelete(<%= rs.getInt("notice_idx") %>)"><button>삭제</button></a>
                </div>
        <%  } else { %>
                <div>
                    해당하는 공지사항이 없습니다.
                </div>
        <%  }


    // 리소스 정리
    rs.close();
    pstmt.close();
    conn.close();
} catch (Exception e) {
    out.println("Exception: " + e.getMessage());
    e.printStackTrace();
}
%>
</div>
                    </div>
                </div>
                <script >
                   function confirmDelete(noticeId) {
        if (confirm('정말로 삭제하시겠습니까?')) {
            // Ajax 요청을 통해 삭제를 수행하고 응답을 확인
            var xhr = new XMLHttpRequest();
            xhr.open('GET', 'NoticeDelete?id=' + noticeId);
            xhr.send();

            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.responseText === 'deleted') {
                        alert('삭제 되었습니다.');
                        // 삭제가 성공한 경우, 공지사항 목록 페이지로 리다이렉션
                        window.location.href = 'notice_list';
                    } else {
                        // 삭제 실패 시, 에러 메시지를 표시하거나 다른 처리 방법 선택
                        alert('삭제에 실패했습니다.');
                    }
                }
            };
        }
    }
                </script>
                <!-- <script>
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
                        xhttp.open("GET", "NoticeDetail", true);
                        xhttp.send();
                    }
            
                    function displayNotices(notices) {
                        var noticeBody = document.getElementById("noticeBody");
            
                        notices.forEach(function (notice) {
                            var div = document.createElement("div");
                            div.classList.add("notice");
            
                            var title = document.createElement("h2");
                            title.textContent = notice.title;
            
                            var contents = document.createElement("p");
                            contents.textContent = notice.contents;
            
                            var author = document.createElement("p");
                            author.textContent = "작성자: " + notice.author;
            
                            var regDate = document.createElement("p");
                            regDate.textContent = "작성일: " + notice.reg_date;
            
                            div.appendChild(title);
                            div.appendChild(contents);
                            div.appendChild(author);
                            div.appendChild(regDate);
            
                            noticeBody.appendChild(div);
                        });
                    }
                </script> -->
            </section>

            <!-- footer 시작 -->
            <jsp:include page="footer"></jsp:include>
            <!-- footer 끝 -->

        </div>
    </body>

    </html>