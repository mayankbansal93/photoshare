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
 * Servlet implementation class UpdateUserProfile
 */
@WebServlet("/UpdateUserProfile")
public class UpdateUserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final String driver="com.mysql.jdbc.Driver";
	final String url="jdbc:mysql://localhost:3306/connection";
	final String user="user";
	final String pass="pass";

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstname=(String)request.getParameter("firstname");
		String lastname=(String)request.getParameter("lastname");
		String dob=(String)request.getParameter("dob");
		String password=(String)request.getParameter("password");
		String repassword=(String)request.getParameter("repassword");
		String userid=(String)request.getAttribute("userid");
		int check[]=new int[4];
		if(firstname.compareTo("")==0){
			check[0]=1;
		}
		if(lastname.compareTo("")==0){
			check[1]=1;
		}
		if(dob.compareTo("")==0){
			check[3]=1;
		}
		if(password.compareTo("")==0){
			check[2]=1;
		}
		if(check[2]!=1){
			if(password.compareTo(repassword)!=0){
				request.setAttribute("errorMessage", "Password not matched");
			}
		}
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=(Connection) DriverManager.getConnection(url,user,pass);
			Statement stmt=connection.createStatement();
			String sql;
			sql="update userdetails set";
			if(check[0]==0){
				sql+="firstname='"+firstname+"',";
			}else{
				sql+="'',";
			}
			if(check[1]==0){
				sql+="lastname='"+lastname+"',";
			}else{
				sql+="'',";
			}
			if(check[2]==0){
				sql+="password='"+password+"',";
			}else{
				sql+="'',";
			}
			if(check[3]==0){
				sql+="dob='"+dob+"',";
			}
			sql+="where userid='"+userid+"')";
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
		request.setAttribute("userid", userid);
		request.getRequestDispatcher("/userprofile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
