package controller.Notice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Notice.NoticeDao;

/**
 * Servlet implementation class NoticeDeleteAction
 */
//@WebServlet("/NoticeDeleteAction")
public class NoticeDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // notice_idx 값 가져오기
        int noticeIdx = Integer.parseInt(request.getParameter("id"));

        // NoticeDao 객체 생성
        NoticeDao noticeDao = NoticeDao.getInstance();

        // 공지사항 삭제를 위한 메서드 호출
        boolean success = noticeDao.deleteNotice(noticeIdx);

        // 삭제가 성공하면 다시 공지사항 목록 페이지로 리다이렉션
        if (success) {
            // 삭제 성공 시, 응답으로 'deleted' 값을 전달
            response.getWriter().write("deleted");
        } else {
            // 삭제 실패 시, 응답으로 'failed' 값을 전달
            response.getWriter().write("failed");
        }
    }



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
