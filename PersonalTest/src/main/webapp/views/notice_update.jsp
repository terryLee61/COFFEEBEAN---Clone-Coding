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
            <form method="post" action="NoticeUpdate">
                번호: <%= rs.getInt("notice_idx") %><br>
                제목: <input type="text" name="title" value="<%= rs.getString("title") %>"><br>
                글쓴이: <%= rs.getString("author") %><br>
                내용: <input type="text" name="contents" value="<%= rs.getString("contents") %>"></input><br>
                날짜: <%= rs.getString("reg_date") %><br>
                <input type="submit" value="수정하기">
            </form>
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
              
            </section>

            <!-- footer 시작 -->
            <jsp:include page="footer"></jsp:include>
            <!-- footer 끝 -->

        </div>
    </body>

    </html>