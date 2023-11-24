package controller.User;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.SHA256;

//import org.json.JSONArray;
//import org.json.JSONObject;

//import model.SHA256;
import model.User.User;
import model.User.UserDao;

/**
 * Servlet implementation class LoginFormAction
 */
public class LoginFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginFormAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String id = request.getParameter("id");
		    String password = request.getParameter("password");

		    HttpSession session = request.getSession();
		    UserDao userDao = UserDao.getInstance();
		    User user = userDao.getUserbyId(id);

		    String url = "login";
		    if (user != null) {
		        String salt = user.getSalt();

		        String hashedPassword = SHA256.getSHA256(password + salt); // salt 값을 추가하여 해싱

		        System.out.println("해시된 비밀번호: " + hashedPassword);
		        System.out.println("DB에 저장된 해시된 비밀번호: " + user.getPassword());
		        System.out.println("password: " + password);
		        System.out.println("salt: " + salt);

		        if (hashedPassword.equals(user.getPassword())) {
		            url = "main";

		            session.setAttribute("log", id);
		            session.setAttribute("member_no", user.getMember_no());
		            session.setAttribute("name", user.getName());
		            session.setAttribute("email", user.getEmail());

		            System.out.println("로그인에 성공했습니다.");
		        } else {
		            System.out.println("로그인에 실패했습니다. 아이디 또는 비밀번호를 확인하세요.");
		        }
		    } else {
		        System.out.println("로그인에 실패했습니다. 아이디 또는 비밀번호를 확인하세요.");
		    }

		    response.sendRedirect(url);
		}
}