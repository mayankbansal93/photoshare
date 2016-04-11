package start;

import java.io.*;
import java.sql.*;
import java.sql.Date;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 * Servlet implementation class insertimage
 */
@WebServlet("/insertimage")
public class insertimage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final String driver="com.mysql.jdbc.Driver";
	final String url="jdbc:mysql://localhost:3306/connection";
	final String user="user";
	final String pass="pass";

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid="";
		String password="";
		String firstname="";
		String lastname="";
		String fullname="";
		String useridpass="";
		String likepass="";
		String dislikepass="";
		String imagepass="";
		String usernamepass="";
		int counter=0;
		
		try{
			String imagefile="";
			String itemname="";
			boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
			if(!isMultiPart){
				
			}else{
				FileItemFactory factory = new org.apache.commons.fileupload.disk.DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				java.util.List items = null;
				List items2 = null;
				try{
					items = upload.parseRequest(request);
					items2=items;
				}catch(FileUploadException e){
					
				}
				 Iterator itr = items.iterator();
				 while(itr.hasNext()){
					 FileItem item = (FileItem) itr.next();
					 if(item.getFieldName().compareTo("password")==0){
						 password=item.getString();
					 }
					 else if(item.getFieldName().compareTo("userid")==0){
						 userid=item.getString();
					 }else if(item.getFieldName().compareTo("useridpass")==0){
						 useridpass=item.getString();
					 }else if(item.getFieldName().compareTo("likepass")==0){
						 likepass=item.getString();
					 }else if(item.getFieldName().compareTo("dislikepass")==0){
						 dislikepass=item.getString();
					 }else if(item.getFieldName().compareTo("usernamepass")==0){
						 usernamepass=item.getString();
					 }else if(item.getFieldName().compareTo("imagepass")==0){
						 imagepass=item.getString();
					 }
				 }
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
				 counter++;
				 Iterator it = items2.iterator();
				 while(it.hasNext()){
					 FileItem item = (FileItem) it.next();
					 if(item.getFieldName().compareTo("password")==0){
						
					 }
					 else if(item.getFieldName().compareTo("userid")==0){
						
					 }else if(item.getFieldName().compareTo("useridpass")==0){
						 
					 }else if(item.getFieldName().compareTo("likepass")==0){
						
					 }else if(item.getFieldName().compareTo("dislikepass")==0){
						 
					 }else if(item.getFieldName().compareTo("usernamepass")==0){
						
					 }else if(item.getFieldName().compareTo("imagepass")==0){
						 
					 }
					 else if(item.isFormField()){
						 String name = item.getFieldName();
						 String value = item.getString();
						 if(name.equals("imagefile")){
							 imagefile = value;
						 }
					 }else{
						 try{
							 String ext="";
							 itemname = item.getName();
							 for(int i=itemname.length()-1;i>=0;i--){
								 if(itemname.charAt(i)=='.'){
									 ext=itemname.substring(i,itemname.length());
									 break;
								 }
							 }
							 itemname=userid+Integer.toString(counter)+ext;
							 File savedFile2 = new File("/home/mayank/pimages/" + itemname);
							 item.write(savedFile2);
							 
						 }catch(Exception e){
							 
						 }
					 }
				 }
				 Calendar calendar= Calendar.getInstance();
				 java.util.Date now=calendar.getTime();
				 Timestamp currentTimestamp = new Timestamp(now.getTime());
				 try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection connection=(Connection) DriverManager.getConnection(url,user,pass);
					Statement stmt=connection.createStatement();
					String sql;
					sql="select firstname,lastname from userdetails where userid='"+userid+"'";
					ResultSet rs=stmt.executeQuery(sql);
					while(rs.next()){
						firstname=rs.getString("firstname");
						lastname=rs.getString("lastname");
					}
					rs.close();
					fullname=firstname+" "+ lastname;
					imagepass=itemname+","+imagepass;
					
					sql="insert into userentry values('"+userid+"','"+itemname+"',0,0,'"+currentTimestamp+"','"+fullname+"')";
					stmt.executeUpdate(sql);
					
					sql="update usercounter set counter='"+counter+"' where userid='"+userid+"'";
					stmt.executeUpdate(sql);
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
			}
		}catch(Exception e){
			
		}
		likepass="0,"+likepass;
		dislikepass="0,"+dislikepass;
		useridpass=userid+","+useridpass;	
		usernamepass=fullname+","+usernamepass;
		request.setAttribute("userid", userid);
		request.setAttribute("password", password);
		request.setAttribute("imagepass", imagepass);
		request.setAttribute("useridpass", useridpass);
		request.setAttribute("likepass", likepass);
		request.setAttribute("dislikepass", dislikepass);
		request.setAttribute("usernamepass", usernamepass);
		request.getRequestDispatcher("/home.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
