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
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPassword() {
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
		if(request.getParameter("actionType") == null) {
			response.sendRedirect("index.jsp");
			return;
		}
		
		String actionType = request.getParameter("actionType");
		
		String tmpEmail = (request.getParameter("email") == null) ? "" : request.getParameter("email");
		String tmpCode = (request.getParameter("code") == null) ? "" : request.getParameter("code");
		
		String tmpNewPass = (request.getParameter("pass") == null) ? "" : request.getParameter("pass");
		String newPass = Utility.getMd5(tmpNewPass);
		
		try {
			if(actionType.equals("forgot")) {
				String recoveryCode = userDB.getRecoveryCode(tmpEmail);
				if(recoveryCode.equals("notFound")) {
					response.sendRedirect("forgotPass.jsp?response=0");
				}else if(!recoveryCode.equals(tmpCode)){
					response.sendRedirect("forgotPass.jsp?response=-1");
				}else {
					session.setAttribute("tmpEmail", tmpEmail);
					response.sendRedirect("newPass.jsp");
				}
			} else if(actionType.equals("change")) {
				String usrEmail = (String) session.getAttribute("tmpEmail");
				boolean flag = userDB.changeNewPassword(usrEmail, newPass);
				if(flag) {
					response.sendRedirect("index.jsp");
				}
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
