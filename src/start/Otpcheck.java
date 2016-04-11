package start;

import java.io.IOException;
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

/**
 * Servlet implementation class Otpcheck
 */
@WebServlet("/Otpcheck")
public class Otpcheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Otpcheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String userid=request.getParameter("userid");
		String password=request.getParameter("password");
		String emailid=request.getParameter("emailid");
		String dob=request.getParameter("dob");
		String otp=request.getParameter("otp");
		String otpcheck=request.getParameter("otpcompare");
		String user="user";
		String pass="pass";
		final String driver="com.mysql.jdbc.Driver";
		final String url="jdbc:mysql://localhost:3306/connection";
		System.out.println(otp+" "+otpcheck);
		if(otp.compareTo(otpcheck)!=0){
			request.setAttribute("otp", otpcheck);
			request.setAttribute("firstname", firstname);
			request.setAttribute("lastname", lastname);
			request.setAttribute("userid", userid);
			request.setAttribute("emailid", emailid);
			request.setAttribute("password", password);
			request.setAttribute("dob", dob);
			request.setAttribute("ErrorInSignup", "OTP Doesn't Match");
			request.getRequestDispatcher("/otp.jsp").forward(request, response);
		}
		else{
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection connection=(Connection) DriverManager.getConnection(url,user,pass);
				Statement stmt=connection.createStatement();
				String sql;
				sql="insert into userdetails values('"+firstname+"','"+lastname+"','"+userid+"','"+emailid+"','"+password+"','"+dob+"')";
				stmt.executeUpdate(sql);
				sql="insert into usercounter values('"+userid+"',0)";
				stmt.executeUpdate(sql);
				stmt.close();
				connection.close();
			}catch(SQLIntegrityConstraintViolationException e){
				
			}
			catch(SQLException e){
				
				System.out.println("exception1");
				e.printStackTrace();
			}
			catch(Exception e){
				System.out.println("exception");
			}
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
