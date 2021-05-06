package controller;

import java.io.File;
import java.io.IOException;
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
import model.User;
import model.Utility;

/**
 * Servlet implementation class CreatePost
 */
@WebServlet("/CreatePost")
public class CreatePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreatePost() {
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
		
		int userID = ((User)session.getAttribute("user")).getUserID();
		
		int visibility = 0;
		String postText = "", fileExtension = "", fileName = "", postImagePath = null;
		boolean isMedia = false, isVideo = false, flag = false;
		
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
						 case "postText":
							 	postText = fileItem.getString();
						 		break;
						 case "visibility":
							 	visibility = Integer.parseInt(fileItem.getString());
						 		break;
						 default:
							 	System.out.println("Invalid File Item");
							 	break;
					 }
				 } else {
					 if (fileItem.getSize() > 0) {
						 fileExtension = fileItem.getName().split("\\.(?=[^\\.]+$)")[1];
						 fileName = (Utility.allPosts.size() + 1) + "." + fileExtension;
						 postImagePath = "assets/images/posts/" + userID + "/" + fileName;
						 isMedia = true;
						 
						 if(fileExtension.equals("mp4")) {
							 isVideo = true;
						 }
						 
						 File file = new File(request.getRealPath("assets/images/posts/" + userID));
						 if(!file.exists()) {
							 file.mkdir();
						 }
						 
						 //Storing in metadata
						 fileItem.write(new File(request.getRealPath("assets/images/posts/" + userID + "/") + fileName));
					 }
				 }
			 }
		}catch(Exception e) {
			System.out.print("Error -> " + e);
			response.sendRedirect("myProfile.jsp");
		}
		
		try {
			flag = userDB.createPost(userID, postText, postImagePath, isMedia, isVideo, visibility);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//Fetching Neccessary Data
		try {
			Utility.fetchNeccesaryData(userID, userDB, session, request.getRealPath("assets/data/tipuedrop_content.js"));
		} catch (Exception e1) {
			e1.printStackTrace();
			System.out.print("fetching neccesary data has been failed");
		}
		
		response.sendRedirect(request.getHeader("referer"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
