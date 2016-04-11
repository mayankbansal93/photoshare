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
 * Servlet implementation class Check
 */
@WebServlet("/Login_Check")
public class Login_Check extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	final String driver="com.mysql.jdbc.Driver";
	final String url="jdbc:mysql://localhost:3306/connection";
	final String user="user";
	final String pass="pass";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login_Check() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userid=request.getParameter("userid");
		String password=request.getParameter("password");
		System.out.println(userid+" "+password);
		String name="";
		String passw="";
		String images[]=new String[10000];
		String user_id[]=new String[10000];
		String like[]=new String[10000];
		String dislike[]=new String[10000];
		String usernametopass[]=new String[10000];
		String useridpass="";
		String imagepass="";
		String likepass="";
		String dislikepass="";
		String usernamepass="";
		int count=0;
		if(userid==null || userid.compareTo("")==0){
			request.setAttribute("ErrorInSignup", "Username field is empty");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}else if(password==null || password.compareTo("")==0){
			request.setAttribute("ErrorInSignup", "Password field is empty");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}else{
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
				
				sql="select password from userdetails where userid='"+userid+"'";
				ResultSet rp=stmt.executeQuery(sql);
				while(rp.next()){
					passw=rp.getString("password");
				}
				rp.close();
				if(name==null || name.compareTo("")==0 || passw.compareTo(password)!=0 ){
					request.setAttribute("ErrorInSignup", "Username and Password doesn't match");
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				}
				
				sql="select * from userentry order by time desc";
				ResultSet rq= stmt.executeQuery(sql);
				rq=stmt.executeQuery(sql);
				while(rq.next()){
					images[count]=rq.getString("imagename");
					user_id[count]=rq.getString("userid");
					like[count]=rq.getString("like");
					dislike[count]=rq.getString("dislike");
					usernametopass[count]=rq.getString("username");
					count++;
				}
				rq.close();
				for(int i=0;i<count;i++){
					imagepass+=images[i]+",";
					useridpass+=user_id[i]+",";
					likepass+=like[i]+",";
					dislikepass+=dislike[i]+",";
					usernamepass+=usernametopass[i]+",";
				}
				
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
			request.setAttribute("password", password);
			request.setAttribute("imagepass", imagepass);
			request.setAttribute("useridpass", useridpass);
			request.setAttribute("likepass", likepass);
			request.setAttribute("dislikepass", dislikepass);
			request.setAttribute("usernamepass", usernamepass);
			request.getRequestDispatcher("/home.jsp").forward(request, response);
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
