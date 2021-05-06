package controller;

import java.io.*;
import java.util.*;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


import db.UserDB;
import model.Utility;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		// TODO Auto-generated method stub
		
		boolean flag = false;
		String fName = "", lName = "", email = "", pass = "", phone = "", fileExtension = "", fileName = "";
		String profilePicPath = "assets/images/profilePic/default.jpg";
		
		boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
		 if (!isMultipartContent) {
			response.sendRedirect("index.jsp");
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
						 case "pass":
						 		pass = Utility.getMd5(fileItem.getString());
						 		break;
						 default:
							 	System.out.println("Invalid File Item");
							 	break;
					 }
				 }else {
					 if (fileItem.getSize() > 0) {
						fileExtension = fileItem.getName().split("\\.(?=[^\\.]+$)")[1];
						 fileName = fName + phone + "." + fileExtension;
						 profilePicPath = "assets/images/profilePic/" + fileName;	
						 
						//Storing in metadata
						fileItem.write(new File(request.getRealPath("assets/images/profilePic/") + fileName));
						
						//Storing in local directory
//						String[] realPath = request.getRealPath("src/main/webapp/assets/images/profilePic/").split(".metadata");
//						String rootPath = realPath[0];
//						String tailPath = realPath[1].split("wtpwebapps/")[1];
//						fileItem.write(new File(rootPath + tailPath + "/" + fileName));
					}
				 }
			 }
		 }catch(Exception e) {
			 System.out.print("Error -> " + e);
			 response.sendRedirect("register.jsp?success=0");
			 System.exit(0);
		 }
		 
		//New user's 6 Digit Recovery Code
	    int number = new Random().nextInt(999999);
	    String recoveryCode = String.format("%06d", number);
		 
		 
		try {
			flag = userDB.registerUser(fName, lName, profilePicPath, email, phone, pass, recoveryCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		if(flag) {
			response.sendRedirect("register.jsp?success=1");
		}else {
			response.sendRedirect("register.jsp?success=0");
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
