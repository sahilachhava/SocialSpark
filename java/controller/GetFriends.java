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
import model.User;

/**
 * Servlet implementation class GetFriends
 */
@WebServlet("/GetFriends")
public class GetFriends extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetFriends() {
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
		ArrayList<User> allFriends = new ArrayList<User>();
		int userID = Integer.parseInt(request.getParameter("userID"));
		String isFriend = request.getParameter("friend");
		
		try {
			allFriends = userDB.fetchFriends(userID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(isFriend.equals("false")) {
			session.setAttribute("allFriends", allFriends);
			response.sendRedirect("friends.jsp");
		}else {
			session.setAttribute("friendsFriends", allFriends);
			response.sendRedirect("friends.jsp?friends=true");
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
