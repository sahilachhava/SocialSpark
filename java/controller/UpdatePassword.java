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
import model.User;
import model.Utility;

/**
 * Servlet implementation class UpdatePassword
 */
@WebServlet("/UpdatePassword")
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePassword() {
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
		
		int updatedRows = 0;
		int userID = ((User)session.getAttribute("user")).getUserID();
		String oldPass = Utility.getMd5(request.getParameter("oldPass"));
		String newPass = Utility.getMd5(request.getParameter("newPass"));
		
		try {
			updatedRows = userDB.updatePassword(userID, oldPass, newPass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(updatedRows > 0) {
			response.sendRedirect("settings.jsp?success=3");
		}else {
			response.sendRedirect("settings.jsp?success=2");
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
