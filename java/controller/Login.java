package controller;

import java.io.FileWriter;

import java.io.IOException;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import model.*;

import db.UserDB;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		
		int userID = 0;
		String tmpEmail = request.getParameter("email");
		String tmpPass = Utility.getMd5(request.getParameter("pass"));
		
		try {
			userID = userDB.loginUser(tmpEmail, tmpPass);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("index.jsp?success=0");
		}
		
		try {
			Utility.fetchNeccesaryData(userID, userDB, session, request.getRealPath("assets/data/tipuedrop_content.js"));
		} catch (Exception e1) {
			e1.printStackTrace();
			System.out.print("fetching neccesary data has been failed");
		}
		
		if(userID != -1) {
			try {
				User user = userDB.getUser(userID);
				if(user != null) {
					session.setAttribute("user", user);
					response.sendRedirect("feed.jsp");
				}
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("index.jsp?success=0");
			}
		}else {
			response.sendRedirect("index.jsp?success=0");
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
