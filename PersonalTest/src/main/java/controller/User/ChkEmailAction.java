package controller.User;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

		    boolean isValid = EmailValidator.validateCode(request, enteredCode);

		    // 결과를 JSON 형식으로 클라이언트에 응답
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");

		    JSONObject jsonObject = new JSONObject();
		    jsonObject.put("isValid", isValid);

		    PrintWriter out = response.getWriter();
		    out.print(jsonObject.toString());
		    out.flush();
	}

public static class EmailValidator {

    public static boolean validateCode(HttpServletRequest request, String enteredCode) {
        HttpSession session = request.getSession();
        Object sessionActualCode = session.getAttribute("actualCode");

        if (sessionActualCode != null) {
            String actualCode = sessionActualCode.toString();

            // 사용자가 입력한 인증번호와 세션에 저장된 인증번호를 비교하여 유효성을 검사
            return actualCode.equals(enteredCode);
        }

        return false;
    }
}
}
