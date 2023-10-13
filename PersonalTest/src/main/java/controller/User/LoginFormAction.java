package controller.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
//		파라미터 값을 받지 못해와서 모든 값이 null로 넘겨짐
		HttpSession session = request.getSession();
		UserDao userDao = UserDao.getInstance();
		User user = userDao.getUserbyId(id);
		
//		String pwd = "";
//		if(user != null) {
//			pwd = user.getPassword();	
//		}		
		   
		String url = "login";
				
//		if(user != null && password.equals(password)) {
		if (user != null && user.getPassword().equals(password)) {
			url = "main";		
			
			session.setAttribute("log", id);
			session.setAttribute("password",user.getPassword());
			session.setAttribute("member_no",user.getMember_no());
			session.setAttribute("name", user.getName());
			session.setAttribute("email", user.getEmail());
			
			System.out.println(session.getAttribute("log"));
			System.out.println(session.getAttribute("password"));
			System.out.println(session.getAttribute("member_no"));
			System.out.println(session.getAttribute("name"));
			System.out.println(session.getAttribute("email"));
			
			System.out.println("로그인에 성공했습니다.");

		}else {
	        // 로그인 실패 시에 대한 처리 (예: 에러 메시지 설정)
			System.out.println(session.getAttribute("log"));
			System.out.println(session.getAttribute("password"));
			System.out.println(session.getAttribute("member_no"));
			System.out.println(session.getAttribute("name"));
			System.out.println(session.getAttribute("email"));
			
			System.out.println("로그인에 실패했습니다. 아이디 또는 비밀번호를 확인하세요.");
	    }
		response.sendRedirect(url);
	}
}