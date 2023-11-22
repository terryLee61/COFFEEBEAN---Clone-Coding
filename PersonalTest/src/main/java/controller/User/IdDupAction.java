package controller.User;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import model.User.User;
import model.User.UserDao;

/**
 * Servlet implementation class IdDupAction
 */
//@WebServlet("/IdDupAction")
public class IdDupAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdDupAction() {
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

		    UserDao userDao = UserDao.getInstance();
		    boolean isIdDuplicate = userDao.isIdDuplicate(id);

		    response.setContentType("application/json"); // 응답 형식을 JSON으로 설정
		    response.setCharacterEncoding("UTF-8");
		    PrintWriter out = response.getWriter();

		    System.out.println("id: " + id);
		    
		    // JSON 형식으로 응답 데이터 전송
		    out.print("{\"isDuplicate\": " + isIdDuplicate + "}");
		    out.flush();
		}

}
