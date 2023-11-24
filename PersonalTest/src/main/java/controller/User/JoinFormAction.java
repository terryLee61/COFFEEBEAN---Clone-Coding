package controller.User;

import java.io.IOException;
import java.security.SecureRandom;
import java.sql.Timestamp;
import java.util.Base64;

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
		String address = request.getParameter("address");
		String postcodeStr = request.getParameter("postcode");

		// postcode를 정수로 변환
		int postcode = 0;
		if (postcodeStr != null && !postcodeStr.isEmpty()) {
			try {
				postcode = Integer.parseInt(postcodeStr);
			} catch (NumberFormatException e) {
				// postcode가 숫자 형식이 아닌 경우에 대한 예외 처리
				e.printStackTrace(); // 에러 로그 출력 또는 적절한 예외 처리
			}
		}

		SecureRandom random = new SecureRandom();
		byte[] saltBytes = new byte[16]; // 16바이트 길이의 솔트를 생성합니다. 이 길이는 조정 가능합니다.
		random.nextBytes(saltBytes);
		String salt = Base64.getEncoder().encodeToString(saltBytes); // 생성된 바이트 배열을 Base64 문자열로 인코딩하여 사용할 수 있습니다.

		// 비밀번호에 솔트 값을 추가하여 해시화합니다.
		String hashedPassword = SHA256.getSHA256(password + salt);

		UserRequestDto user = new UserRequestDto(id, hashedPassword, name, email, address, postcode, salt);
//		UserRequestDto user = new UserRequestDto(id, password, name, email, address, postcode);

		UserDao userDao = UserDao.getInstance();
		boolean result = userDao.createUser(user);

		System.out.println("id : " + id);
		System.out.println("password : " + password);
		System.out.println("name : " + name);
		System.out.println("email : " + email);
		System.out.println("address : " + address);
		System.out.println("postcode : " + postcode);
		System.out.println("salt : " + salt);

		String url = "";

		if (result) {
			url = "login";
		} else {
			url = "join";
		}

		response.sendRedirect(url);
	}

}
