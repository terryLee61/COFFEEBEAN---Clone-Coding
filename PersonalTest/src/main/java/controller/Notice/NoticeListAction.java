package controller.Notice;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import model.Notice.Notice;
import model.Notice.NoticeDao;

/**
 * Servlet implementation class NoticeListAction
 */
// @WebServlet("/NoticeListAction")
public class NoticeListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeListAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// NoticeDao를 사용하여 공지사항 목록을 가져옵니다.
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		List<Notice> notices = NoticeDao.getInstance().getAllNotices(); // 모든 공지사항을 가져옵니다.

		JSONArray jsonArray = new JSONArray();
		for (Notice notice : notices) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("notice_idx", notice.getNotice_idx());
			jsonObject.put("title", notice.getTitle());
			jsonObject.put("author", notice.getAuthor());
			jsonObject.put("contents", notice.getContents());
			jsonObject.put("reg_date", notice.getReg_date().toString());
			jsonArray.put(jsonObject);
		}

		PrintWriter out = response.getWriter();
		out.print(jsonArray.toString());
		out.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
