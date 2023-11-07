package controller.Search;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Search.Search;
import model.Search.SearchDao;

/**
 * Servlet implementation class SearchAction
 */
//@WebServlet("/SearchAction")
public class SearchAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// URL 매개변수로 전달된 product_name 값을 가져옵니다.
		String product_name = request.getParameter("product_name");

		// SearchDao를 사용하여 product_name을 검색하여 제품 정보를 가져옵니다.
		SearchDao searchDao = SearchDao.getInstance();
		Search search = searchDao.getSearchbyId(product_name);

		if (search != null) {
			// 검색된 제품 정보를 request에 저장합니다.
			request.setAttribute("search", search);

			// 원하는 작업을 수행 (예: JSP 페이지로 이동)
			request.getRequestDispatcher("search").forward(request, response);
		} else {
			// 제품을 찾을 수 없는 경우 처리 (예: 에러 메시지 표시)
			response.getWriter().println("제품을 찾을 수 없습니다.");
		}
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
