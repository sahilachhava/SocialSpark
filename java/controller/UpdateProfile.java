package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import db.UserDB;
import model.*;

/**
 * Servlet implementation class UpdateProfile
 */
@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfile() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Resource(name="jdbc/socialSpark")
    private DataSource dbConfig;
    private UserDB userDB;

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		
		try {
			userDB = new UserDB(dbConfig);
		}catch(Exception e) {
			throw new ServletException(e);
		}
	}


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(((User)session.getAttribute("user")) == null) {
			response.sendRedirect("index.jsp");
			return;
		}
		
		boolean flag = false;
		int userID = ((User)session.getAttribute("user")).getUserID();
		
		try {
			Utility.fetchNeccesaryData(userID, userDB, session, request.getRealPath("assets/data/tipuedrop_content.js"));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.print("fetching neccesary data has been failed");
		}
		
		String photoPath = ((User)session.getAttribute("user")).getPhoto();
		String fName = "", lName = "", email = "", phone = "", bio = "", city ="", 
				country = "", fileExtension = "", fileName = "";
		String profilePicPath = "assets/images/profilePic/";
		
		boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
		 if (!isMultipartContent) {
			 return;
		 }
		 FileItemFactory factory = new DiskFileItemFactory();
		 ServletFileUpload upload = new ServletFileUpload(factory);
		 try {
			 List < FileItem > fields = upload.parseRequest(new ServletRequestContext(request));
			 Iterator < FileItem > it = fields.iterator();
			 if (!it.hasNext()) {
				 return;
			 }
			 while(it.hasNext()) {
				 FileItem fileItem = it.next();
				 boolean isFormField = fileItem.isFormField();
				 if(isFormField) {
					 switch(fileItem.getFieldName()) {
						 case "fName":
						 		fName = fileItem.getString();
						 		break;
						 case "lName":
						 		lName = fileItem.getString();
						 		break;
						 case "email":
						 		email = fileItem.getString();
						 		break;
						 case "phone":
						 		phone = fileItem.getString();
						 		break;
						 case "bio":
						 		bio = fileItem.getString();
						 		break;
						 case "city":
						 		city = fileItem.getString();
						 		break;
						 case "country":
						 		country = fileItem.getString();
						 		break;
						 default:
							 	System.out.println("Invalid File Item");
							 	break;
					 }
				 }else {
					 if (fileItem.getSize() > 0) {
						fileExtension = fileItem.getName().split("\\.(?=[^\\.]+$)")[1];
						 fileName = fName + phone + "." + fileExtension;
						 profilePicPath += fileName;
						 photoPath = profilePicPath;
						 
						//Storing in metadata
						fileItem.write(new File(request.getRealPath("assets/images/profilePic/") + fileName));
						
						//Storing in local directory
//						String[] realPath = request.getRealPath("src/main/webapp/assets/images/profilePic/").split(".metadata");
//						String tailPath = "SocialSpark/src/main/webapp/assets/images/profilePic/";
//						fileItem.write(new File(realPath[0] + tailPath + fileName));
					}
				 }
			 }
		 }catch(Exception e) {
			 System.out.print("Error -> " + e);
			 response.sendRedirect("settings.jsp?success=0");
		 }
		 
		try {
			flag = userDB.updateUser(userID, fName, lName, photoPath, email, phone, bio, city, country);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		if(flag) {
			try {
				User user = userDB.getUser(userID);
				if(user != null) {
					session.setAttribute("user", user);
					response.sendRedirect("settings.jsp");
				}
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("settings.jsp?success=0");
			}
			
		}else {
			response.sendRedirect("settings.jsp?success=0");
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
