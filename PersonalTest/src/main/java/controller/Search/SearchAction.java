package controller.Search;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // URL 매개변수로 전달된 product_name 값을 가져옵니다.
	    String product_name = request.getParameter("product_name");

	    // SearchDao를 사용하여 product_name을 검색하여 제품 정보를 가져옵니다.
	    SearchDao searchDao = SearchDao.getInstance();
	    List<Search> search = searchDao.getSearchbyId(product_name);

	    // 검색 결과를 JSON 형식으로 변환
	    JSONArray searchArray = new JSONArray();
	    for (Search result : search) {
	        JSONObject searchObj = new JSONObject();
	        searchObj.put("product_idx", result.getProduct_idx());
	        searchObj.put("product_name", result.getProduct_name());
	        searchObj.put("product_price", result.getProduct_price());
	        // 다른 필드도 필요에 따라 추가

	        searchArray.put(searchObj);
	    }

	    // JSON 응답을 설정하고 반환
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(searchArray.toString());
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
