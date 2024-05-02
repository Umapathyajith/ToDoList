package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.User;

@WebServlet("/forgotpassword")
public class ForgotPassword extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		Dao dao = new Dao();
		
		String email = req.getParameter("email");
		
		try {
			
			User u = dao.findByEmail(email);
			if(u!=null) {
				
				Properties props = new Properties();
		        props.put("mail.smtp.host", "smtp.gmail.com");
		        props.put("mail.smtp.port", "465"); 
		        props.put("mail.smtp.auth", "true");
		        props.put("mail.smtp.starttls.enable", "true");
		        
		        // Set up the session with the mail server
		        Session session = Session.getInstance(props, new Authenticator() {
		            @Override
		            protected PasswordAuthentication getPasswordAuthentication() {
		                // Replace with your SMTP username and password
		                return new PasswordAuthentication("umapathyajith8@gmail.com", "hyguearbqcimtmdp");
		            }
		        });
		        
		        String newPass = PasswordGenerator.generatePassword();
		        u.setUserpassword(newPass);
		        Dao dao2 = new Dao();
		        dao2.updateUserPassword(u);
		      
		        MimeMessage message = new MimeMessage(session);
		        message.setFrom(new InternetAddress("umapathyajith8@gmail.com"));
		        message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
		        message.setSubject("Your New Password");
		        message.setText("Your new password is: " + newPass );
		        
		        Transport.send(message);
				
		        resp.sendRedirect("login.jsp");
				
			}
		
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			req.setAttribute("message","invalid email address added for password recovery");
			RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
			dispatcher.include(req, resp);
		}
				
	}
	
}
