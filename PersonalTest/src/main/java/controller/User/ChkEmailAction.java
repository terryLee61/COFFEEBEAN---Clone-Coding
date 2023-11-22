package controller.User;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

/**
 * Servlet implementation class ChkEmailAction
 */
//@WebServlet("/ChkEmailAction")
public class ChkEmailAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChkEmailAction() {
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
		String enteredCode = request.getParameter("enteredCode"); // 클라이언트에서 전송된 사용자가 입력한 인증번호

	    // 세션에서 actualCode를 가져옴
	    Object sessionActualCode = request.getSession().getAttribute("actualCode");

	    boolean isValid = false;

	    if (sessionActualCode != null) {
	        String actualCode = sessionActualCode.toString(); // 세션에 저장된 값으로 설정

	        // 사용자가 입력한 인증번호와 세션에 저장된 인증번호를 비교하여 유효성을 검사
	        isValid = actualCode.equals(enteredCode);
	    }

	    // 결과를 JSON 형식으로 클라이언트에 응답
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");

	    JSONObject jsonObject = new JSONObject();
	    jsonObject.put("isValid", isValid);

	    PrintWriter out = response.getWriter();
	    out.print(jsonObject.toString());
	    out.flush();
	}
}
