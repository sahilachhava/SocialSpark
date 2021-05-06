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
 * Servlet implementation class Messages
 */
@WebServlet("/Messages")
public class Messages extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Messages() {
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
		
		ArrayList<Message> allMsgs = new ArrayList<Message>();
		
		int userID = ((User)session.getAttribute("user")).getUserID();
		if(userID == 0) {
			response.sendRedirect("index.jsp");
		}
		
		int friendID = Integer.parseInt(request.getParameter("friendID"));
		String actionType = request.getParameter("actionType");
		String msgText = (request.getParameter("messageText") == null) ? "" : request.getParameter("messageText");
		
		try {
			if(actionType.equals("get")) {
				allMsgs = userDB.getMessages(userID, friendID);
				session.setAttribute("mUser", userDB.getUser(friendID));
				session.setAttribute("messages", allMsgs);
				response.sendRedirect("message.jsp");
				
			} else if(actionType.equals("send")) {
				allMsgs = userDB.sendMessage(userID, friendID, msgText);
				session.setAttribute("mUser", userDB.getUser(friendID));
				session.setAttribute("messages", allMsgs);
				response.sendRedirect("message.jsp");
				
			} else if(actionType.equals("delete")) {
				allMsgs = userDB.deleteMessage(userID, friendID);
				session.setAttribute("mUser", userDB.getUser(friendID));
				session.setAttribute("messages", allMsgs);
				response.sendRedirect("message.jsp");
				
			}
		} catch(Exception e) {
			e.printStackTrace();
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
