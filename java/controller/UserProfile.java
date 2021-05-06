package controller;

import java.io.IOException;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import db.UserDB;
import model.*;

/**
 * Servlet implementation class UserProfile
 */
@WebServlet("/UserProfile")
public class UserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfile() {
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
		
		int currentUserID = ((User)session.getAttribute("user")).getUserID();
		int userID = Integer.parseInt(request.getParameter("userID"));
		
		try {
			Utility.fetchNeccesaryData(currentUserID, userDB, session, request.getRealPath("assets/data/tipuedrop_content.js"));
		} catch (Exception e1) {
			e1.printStackTrace();
			System.out.print("fetching neccesary data has been failed");
		}
		
		try {
			int friendStatus = userDB.isFriend(currentUserID, userID);
			if(friendStatus == 0) {
				for(User usr : Utility.friendRequestUsers) {
					if(usr.getUserID() == userID) {
						friendStatus = 2;
					}
				}
			}
			User user = userDB.getUser(userID);
			
			if(user != null) {
				session.setAttribute("showUser", user);
				session.setAttribute("friendStatus", friendStatus);
				response.sendRedirect("profile.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("myProfile.jsp?failed=0");
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
