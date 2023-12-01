package controller.Qna;

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

import model.Qna.Qna;
import model.Qna.QnaDao;

/**
 * Servlet implementation class QnaListAction
 */
// @WebServlet("/QnaListAction")
public class QnaListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QnaListAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// QnaDao를 사용하여 공지사항 목록을 가져옵니다.
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		List<Qna> qnas = QnaDao.getInstance().getAllQnas(); // 모든 공지사항을 가져옵니다.

		JSONArray jsonArray = new JSONArray();
		for (Qna qna : qnas) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("qna_idx", qna.getQna_idx());
			jsonObject.put("title", qna.getTitle());
			jsonObject.put("author", qna.getAuthor());
			jsonObject.put("contents", qna.getContents());
			jsonObject.put("reg_date", qna.getReg_date().toString());
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
