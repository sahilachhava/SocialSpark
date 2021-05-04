package controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import db.UserDB;
import model.Post;
import model.User;
import model.Utility;

/**
 * Servlet implementation class ManagePosts
 */
@WebServlet("/ManagePosts")
public class ManagePosts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagePosts() {
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
		boolean flag = false;
		String previousURL = request.getHeader("referer");
		
		int userID = ((User)session.getAttribute("user")).getUserID();
		int postID = Integer.parseInt(request.getParameter("postID"));
		
		String actionType = request.getParameter("actionType");
		int actionStatus = Integer.parseInt((request.getParameter("actionStatus") != null) ? request.getParameter("actionStatus") : "0");
		String updatedText = (request.getParameter("updatedText") != null) ? request.getParameter("updatedText") : "";
		
		try {
			if(actionType.equals("likePost")) {
				flag = userDB.likePost(userID, postID, actionStatus);
				
				if(actionStatus == 1) {
					//Sending notification
					for(Post post : Utility.allPosts) {
						if(post.getPostID() == postID && post.getUserID() != userID) {
							userDB.sendNotification(post.getUserID(), userID, "LP");
						}
					}
				}
			} else if(actionType.equals("savePost")) {
				flag = userDB.savePost(userID, postID, actionStatus);
				
			} else if(actionType.equals("deletePost")) {
				flag = userDB.deletePost(postID);
				
			} else if(actionType.equals("updatePost")) {
				flag = userDB.updatePost(postID, updatedText);
				previousURL = previousURL.split(".jsp")[0] + ".jsp";
			} else {
				flag = userDB.changePostVisibility(postID, actionStatus);
			}
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
		
		response.sendRedirect(previousURL);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
