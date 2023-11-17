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
String notice_id = request.getParameter("id");

try {
    String url = "jdbc:mysql://localhost:3306/personal";
    String username = "root";
    String password = "my1234";
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, username, password);

    String sql = "SELECT * FROM notice WHERE notice_idx = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, notice_id);

    ResultSet rs = pstmt.executeQuery();

    if (rs.next()) {
        String author = rs.getString("author");
        
        // 세션에서 사용자 ID 가져오기
        String sessionUserId = (String) session.getAttribute("log");

        // 세션 사용자 ID와 작성자가 같은 경우에만 수정 및 삭제 버튼 표시
%>
            <div class="detail_con">
                <!-- 번호: <%= rs.getInt("notice_idx") %><br> -->
                제목: <%= rs.getString("title") %><br>
                글쓴이: <%= author %><br>
                내용: <%= rs.getString("contents") %><br>
                최종 수정날짜: <%= rs.getString("reg_date") %><br>
     <%    if (sessionUserId != null && sessionUserId.equals(author)) { %>
                <a href="notice_update?id=<%= rs.getInt("notice_idx") %>"><button>수정</button></a>
                <a href="javascript:void(0);" onclick="confirmDelete('<%= rs.getInt("notice_idx") %>')"><button>삭제</button></a>
            </div>
            
<%
        } else {
%>
            <!-- 작성자가 아닌 경우 버튼이 보이지 않음 -->
<%
        }
    } else {
%>
        <div>
            해당하는 공지사항이 없습니다.
        </div>
<%
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
                    </div>
                </div>
            </div>
        </section>

        <!-- footer 시작 -->
        <jsp:include page="footer"></jsp:include>
        <!-- footer 끝 -->

    </div>

    <script>
        function confirmDelete(noticeId) {
            if (confirm('정말로 삭제하시겠습니까?')) {
                var xhr = new XMLHttpRequest();
                xhr.open('GET', 'NoticeDelete?id=' + noticeId);
                xhr.send();

                xhr.onreadystatechange = function() {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.responseText === 'deleted') {
                            alert('삭제 되었습니다.');
                            window.location.href = 'notice_list';
                        } else {
                            alert('삭제에 실패했습니다.');
                        }
                    }
                };
            }
        }
    </script>
</body>

</html>
