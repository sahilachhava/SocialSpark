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
import model.Notification;
import model.User;
import model.Utility;

/**
 * Servlet implementation class ManageFriends
 */
@WebServlet("/ManageFriends")
public class ManageFriends extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageFriends() {
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
		
		int friendID = 0;
		String requestUserID = request.getParameter("userID");
		int currentUserID = ((User)session.getAttribute("user")).getUserID();
		
		try {
			Utility.fetchNeccesaryData(currentUserID, userDB, session, request.getRealPath("assets/data/tipuedrop_content.js"));
		} catch (Exception e1) {
			e1.printStackTrace();
			System.out.print("fetching neccesary data has been failed");
		}
		
		if(requestUserID == null) {
			friendID = ((User)session.getAttribute("showUser")).getUserID();
		}else {
			friendID = Integer.parseInt(requestUserID);
		}
		
		int requestType = Integer.parseInt(request.getParameter("type"));
		
		try {
			userDB.manageUser(currentUserID, friendID, requestType);
			if(requestType == 1) {
				userDB.sendNotification(friendID, currentUserID, "FR");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		response.sendRedirect("./UserProfile?userID="+friendID);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
