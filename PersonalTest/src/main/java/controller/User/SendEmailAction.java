package controller.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
import java.util.Random;


/**
 * Servlet implementation class SendEmailAction
 */
//@WebServlet("/SendEmailAction")
public class SendEmailAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendEmailAction() {
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
		// TODO Auto-generated method stub
		
		// Gmail 계정 정보
		String username = "akflsqoxmf3@gmail.com"; // Gmail 계정 이메일
		String password = "nwrdfvhogcrgaata"; // Gmail 앱 비밀번호

		// 이메일 수신자
	    String recipientEmail = request.getParameter("recipientEmail"); // 이메일 주소 가져오기
		
		// 이메일 속성 설정
		Properties props = new Properties();
//		이 코드를 넣어야만 가능
		props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
//		
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		// 세션 생성
		Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
		    protected PasswordAuthentication getPasswordAuthentication() {
		        return new PasswordAuthentication(username, password);
		    }
		});

		try {
		 // 난수 생성
		    Random random = new Random();
		    int actualCode  = 100000 + random.nextInt(900000); // 100000부터 999999까지의 난수 생성

		    // 이메일 내용에 인증번호 삽입
		    String emailContent = "인증 번호: " + actualCode; // 여기에 인증 번호를 넣어주세요
		    // 메시지 생성
		    Message message = new MimeMessage(mailSession);
		    message.setFrom(new InternetAddress(username));
		    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
		    message.setSubject("이메일 인증");
		    message.setText(emailContent);
		    // 이메일 전송
		    Transport.send(message);

		    request.getSession().setAttribute("actualCode", String.valueOf(actualCode));
		    
		    System.out.println("actualCode:" + actualCode);
		    System.out.println("이메일 전송 완료");
		    

		} catch (MessagingException e) {
		    System.out.println("이메일 전송 실패: " + e.getMessage());
		}
			
	}
}
