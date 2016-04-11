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
 * Servlet implementation class otherprofile
 */
@WebServlet("/otherprofile")
public class otherprofile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final String driver="com.mysql.jdbc.Driver";
	final String url="jdbc:mysql://localhost:3306/connection";
	final String user="user";
	final String pass="pass";
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String userid=request.getParameter("userid");
		String imagename[]=new String[100000];
		int counter=0;
		int j=0;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=(Connection) DriverManager.getConnection(url,user,pass);
			Statement stmt=connection.createStatement();
			String sql;
			sql="select counter from usercounter where userid='"+userid+"'";
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				counter=rs.getInt("counter");
			}
			rs.close();
			sql="select imagename from userentry where userid='"+userid+"' order by time desc";
			ResultSet rs2=stmt.executeQuery(sql);
			while(rs2.next()){
				imagename[j]=rs2.getString("imagename");
				j++;
			}
			rs2.close();
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
		String image_8array[]=new String[8];
		if(counter>=8){
			for(int i=0;i<8;i++){
				image_8array[i]=imagename[i];
			}
		}else{
			for(int i=0;i<counter;i++){
				image_8array[i]=imagename[i];
			}
			for(int i=counter;i<8;i++){
				image_8array[i]="empty.png";
			}
		}
		String image_name="";
		String image_8_array="";
		for(int i=0;i<counter;i++){
			image_name+=imagename[i]+",";
		}
		for(int i=0;i<8;i++){
			image_8_array+=image_8array[i]+",";
		}
		request.setAttribute("username", username);
		request.setAttribute("userid", userid);
		request.setAttribute("counter", counter);
		request.setAttribute("imagename", image_name);
		request.setAttribute("image8array", image_8_array);
		request.getRequestDispatcher("/otherprofile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
