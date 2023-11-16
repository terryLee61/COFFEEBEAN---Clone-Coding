package controller.Notice;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Notice.NoticeDao;

/**
 * Servlet implementation class NoticeUpdateAction
 */
//@WebServlet("/NoticeUpdateAction")
public class NoticeUpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private NoticeDao noticeDao;

    public void init() {
        noticeDao = NoticeDao.getInstance();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // TODO Auto-generated method stub
	    request.setCharacterEncoding("UTF-8"); // 인코딩 설정

	    // 클라이언트로부터 전송된 데이터 받기
	    String title = request.getParameter("title");
	    String contents = request.getParameter("contents");
	    int noticeIdx = Integer.parseInt(request.getParameter("notice_idx"));

	    // 새로운 현재 시간 정보를 Timestamp 형식으로 생성
	    Timestamp regDate = new Timestamp(System.currentTimeMillis());

	    // NoticeDao 객체 생성
	    NoticeDao noticeDao = NoticeDao.getInstance();

	    // 공지사항 수정을 위한 메서드 호출 (제목, 내용, 번호, 날짜)
	    boolean success = noticeDao.updateNotice(title, contents, noticeIdx, regDate);

	    // 결과를 클라이언트에 전송
	    response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();

	    // 성공 시 클라이언트에게 스크립트를 보내어 팝업 및 리다이렉션 수행
	    if (success) {
	        out.println("<script>alert('공지사항 수정 성공'); window.location.href='notice_list';</script>");
	        System.out.println("title: " + title);
	        System.out.println("contents: " + contents);
	    } else {
	        out.println("<script>alert('공지사항 수정 실패');</script>");
	    }

	    out.close();
	}

}

//System.out.println("title: " + title);
//System.out.println("contents: " + contents);
