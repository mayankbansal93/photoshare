package start;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.servlet.*;
import javax.mail.*;
import javax.mail.internet.*;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.activation.*;
import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.MimeBodyPart;
import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.MimeMultipart;
@WebServlet("/mailwithlink")
public class mailwithotp extends HttpServlet{
	String otp="";
	String email="";
	public mailwithotp(String otp,String email){
		this.otp=otp;
		this.email=email;
		
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		Properties props=new Properties();
		props.put("mail.smtp.user","username"); 
		props.put("mail.smtp.host", "smtp.gmail.com"); 
		props.put("mail.smtp.port", "25"); 
		props.put("mail.debug", "true"); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.starttls.enable","true"); 
		props.put("mail.smtp.EnableSSL.enable","true");

		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
		props.setProperty("mail.smtp.socketFactory.fallback", "false");   
		props.setProperty("mail.smtp.port", "465");   
		props.setProperty("mail.smtp.socketFactory.port", "465"); 
		Session session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("teamjava3131@gmail.com","avajmaet");
					}
				});
				response.setContentType("text/html");
				PrintWriter pw=response.getWriter();
			try {
	 
				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress("teamjava3131@gmail.com"));
				message.setRecipients(Message.RecipientType.TO,
						InternetAddress.parse(email));//email to otp change done
				message.setSubject("Email Verification");
				message.setText("The one time password is: "+otp);
				Transport.send(message);
			}catch(MessagingException e){
				System.out.println("Exception occured");
				System.out.println(e.getMessage());
		}
	}
}
