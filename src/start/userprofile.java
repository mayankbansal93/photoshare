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
 * Servlet implementation class userprofile
 */
@WebServlet("/userprofile")
public class userprofile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final String driver="com.mysql.jdbc.Driver";
	final String url="jdbc:mysql://localhost:3306/connection";
	final String user="user";
	final String pass="pass";

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid=request.getParameter("userid");
		String firstname="";
		String lastname="";
		String fullname="";
		String dob="";
		String email="";
		String imagename[]=new String[100000];
		int counter=0;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=(Connection) DriverManager.getConnection(url,user,pass);
			Statement stmt=connection.createStatement();
			String sql;
			sql="select firstname,lastname,dob,emailid from userdetails where userid='"+userid+"'";
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				firstname=rs.getString("firstname");
				lastname=rs.getString("lastname");
				dob=rs.getString("dob");
				email=rs.getString("emailid");
			}
			rs.close();
			fullname=firstname+" "+ lastname;
			
			sql="select imagename from userentry where userid='"+userid+"' order by time desc";
			ResultSet rs2=stmt.executeQuery(sql);
			while(rs2.next()){
				imagename[counter]=rs2.getString("imagename");
				counter++;
			}
			rs2.close();
			stmt.close();
			connection.close();
		}catch(SQLIntegrityConstraintViolationException e){

		}
		catch(SQLException e){
			e.printStackTrace();
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("exception");
		}
		
		String image_16array[]=new String[16];
		if(counter>=16){
			for(int i=0;i<16;i++){
				image_16array[i]=imagename[i];
			}
		}else{
			for(int i=0;i<counter;i++){
				image_16array[i]=imagename[i];
			}
			for(int i=counter;i<16;i++){
				image_16array[i]="empty.png";
			}
		}
		String image_name="";
		String image_16_array="";
		for(int i=0;i<counter;i++){
			image_name+=imagename[i]+",";
		}
		for(int i=0;i<16;i++){
			image_16_array+=image_16array[i]+",";
		}
		request.setAttribute("userid", userid);
		request.setAttribute("emailid", email);
		request.setAttribute("fullname", fullname);
		request.setAttribute("firstname", firstname);
		request.setAttribute("lastname", lastname);
		request.setAttribute("dob", dob);
		request.setAttribute("imagename", image_name);
		request.setAttribute("image16array", image_16_array);
		request.getRequestDispatcher("/userprofile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
