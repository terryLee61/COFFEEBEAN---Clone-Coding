//package controller.Notice;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.json.JSONArray;
//import org.json.JSONObject;
//
//import model.Notice.Notice;
//import model.Notice.NoticeDao;
//
///**
// * Servlet implementation class NoticeDetailAction
// */
////@WebServlet("/NoticeDetailAction")
//public class NoticeDetailAction extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public NoticeDetailAction() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		 response.setContentType("application/json");
//	        response.setCharacterEncoding("UTF-8");
//
//	        String idParam = request.getParameter("id");
//
//	        if (idParam != null && !idParam.isEmpty()) {
//	            try {
//	                int noticeIdx = Integer.parseInt(idParam);
//
//	                Notice notice = NoticeDao.getInstance().getNoticeByIdx(noticeIdx);
//
//	                if (notice != null) {
//	                    JSONObject noticeJson = new JSONObject();
//	                    noticeJson.put("notice_idx", notice.getNotice_idx());
//	                    noticeJson.put("title", notice.getTitle());
//	                    noticeJson.put("author", notice.getAuthor());
//	                    noticeJson.put("contents", notice.getContents());
//	                    noticeJson.put("reg_date", notice.getReg_date().toString());
//
//	                    PrintWriter out = response.getWriter();
//	                    out.print(noticeJson.toString());
//	                    out.flush();
//	                } else {
//	                    // 해당 'noticeIdx'에 해당하는 공지사항이 없는 경우에 대한 처리
//	                    // 예를 들어, 에러 응답을 반환하거나 로그를 남기는 등의 작업을 수행할 수 있습니다.
//	                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
//	                }
//	            } catch (NumberFormatException e) {
//	                // 'id' 파라미터가 정수로 변환할 수 없는 경우 처리할 내용을 작성합니다.
//	                // 예를 들어, 에러 응답을 반환하거나 로그를 남기는 등의 작업을 수행할 수 있습니다.
//	                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//	            }
//	        } else {
//	            // 'id' 파라미터가 없는 경우 처리할 내용을 작성합니다.
//	            // 예를 들어, 에러 응답을 반환하거나 로그를 남기는 등의 작업을 수행할 수 있습니다.
//	            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//	        }
//	    
//
//	}
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//
//}
