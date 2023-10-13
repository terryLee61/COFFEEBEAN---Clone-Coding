package controller.User;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SHA256;
import model.User.UserDao;
import model.User.UserRequestDto;

/**
 * Servlet implementation class JoinFormAction
 */
//@WebServlet("/Join")
public class JoinFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JoinFormAction() {
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
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");		
			
		System.out.println("id : " + id);
		System.out.println("password : " + password);
		System.out.println("name : " + name);
		System.out.println("email : " + email);

		UserRequestDto user = new UserRequestDto(id, password, name, email);

		UserDao userDao = UserDao.getInstance();
		boolean result = userDao.createUser(user);

		String url = "";

		if (result) {
			url = "login";
		} else {
			url = "join";			
		}

		response.sendRedirect(url);
	}

}
