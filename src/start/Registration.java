package start;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Registration")
public class Registration extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/jsp");
		PrintWriter pr=resp.getWriter();
		
		final String driver="com.mysql.jdbc.Driver";
		final String url="jdbc:mysql://localhost:3306/connection";
		final String user="user";
		final String pass="pass";
		
		String firstname=req.getParameter("firstname");
		String lastname=req.getParameter("lastname");
		String userid=req.getParameter("userid");
		String password=req.getParameter("password");
		String retype=req.getParameter("repassword");
		String emailid=req.getParameter("emailid");
		String dob=req.getParameter("dob");
		String name="";
		if(firstname.length()==0){
			req.setAttribute("ErrorInSignup", "First Name Is Empty");
			req.getRequestDispatcher("/signup.jsp").forward(req, resp);
		}
		if(lastname.length()==0){
			req.setAttribute("ErrorInSignup", "Second Name Is Empty");
			req.getRequestDispatcher("/signup.jsp").forward(req, resp);
		}
		if(userid.length()==0){
			req.setAttribute("ErrorInSignup", "Userid Is Empty");
			req.getRequestDispatcher("/signup.jsp").forward(req, resp);
		}
		if(password.length()==0){
			req.setAttribute("ErrorInSignup", "Password Is Empty");
			req.getRequestDispatcher("/signup.jsp").forward(req, resp);
		}
		if(retype.length()==0){
			req.setAttribute("ErrorInSignup", "Retype Password Is Empty");
			req.getRequestDispatcher("/signup.jsp").forward(req, resp);
		}
		if(!(password.equals(retype))){
			req.setAttribute("ErrorInSignup", "Password and Retype Password doesn't match");
			req.getRequestDispatcher("/signup.jsp").forward(req, resp);
		}
		else{
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection connection=(Connection) DriverManager.getConnection(url,user,pass);
				Statement stmt=connection.createStatement();
				String sql;
				sql="select firstname from userdetails where userid='"+userid+"'";
				ResultSet rs=stmt.executeQuery(sql);
				while(rs.next()){
					name=rs.getString("firstname");
				}
				rs.close();
				stmt.close();
				connection.close();
			}catch(SQLIntegrityConstraintViolationException e){

			}
			catch(SQLException e){

			}
			catch(Exception e){
				System.out.println("exception");
			}

			if(name.compareTo("")!=0){
				req.setAttribute("ErrorInSignup", "Username Is Not Unique");
				req.getRequestDispatcher("/signup.jsp").forward(req, resp);
			}else{
				double random=(Math.random()*1000000);
				int otp=(int)random;
				String otpsend=""+otp;
				mailwithotp obj=new mailwithotp(otpsend,emailid);
				obj.doGet(req, resp);
				req.setAttribute("otp", otpsend);
				req.setAttribute("firstname", firstname);
				req.setAttribute("lastname", lastname);
				req.setAttribute("userid", userid);
				req.setAttribute("emailid", emailid);
				req.setAttribute("password", password);
				req.setAttribute("dob", dob);
				req.getRequestDispatcher("/otp.jsp").forward(req, resp);
			}
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
}