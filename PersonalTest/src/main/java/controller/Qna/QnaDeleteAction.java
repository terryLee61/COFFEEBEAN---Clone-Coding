package controller.Qna;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Qna.QnaDao;

/**
 * Servlet implementation class QnaDeleteAction
 */
//@WebServlet("/QnaDeleteAction")
public class QnaDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaDeleteAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Qna_idx 값 가져오기
    	   int qnaIdx = Integer.parseInt(request.getParameter("id"));

    	    // QnaDao 객체 생성
    	    QnaDao qnaDao = QnaDao.getInstance();

    	    // 공지사항 삭제를 위한 메서드 호출
    	    boolean success = qnaDao.deleteQna(qnaIdx);

    	    // 삭제 성공 여부에 따라 적절한 처리
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
