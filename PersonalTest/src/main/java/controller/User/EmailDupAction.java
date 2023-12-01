package controller.User;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User.UserDao;

/**
 * Servlet implementation class EmailDupAction
 */
// @WebServlet("/EmailDupAction")
public class EmailDupAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmailDupAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");

		UserDao userDao = UserDao.getInstance();
		boolean isEmailDuplicate = userDao.isEmailDuplicate(email);

		response.setContentType("application/json"); // 응답 형식을 JSON으로 설정
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		System.out.println("email: " + email);

		// JSON 형식으로 응답 데이터 전송
		out.print("{\"isDuplicate\": " + isEmailDuplicate + "}");
		out.flush();
	}

}
