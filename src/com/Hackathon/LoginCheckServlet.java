package com.Hackathon;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.*;

/**
 * Servlet implementation class LoginCheckServlet
 */
@WebServlet("/LoginCheckServlet")
public class LoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		String cName=request.getParameter("c_no");
		String passWord=request.getParameter("password");
		RequestDispatcher rd;
		DataBase db=new DataBase();
		try {
			int result=db.check(cName, passWord);
			if(result==0)
			{
				HttpSession hs=request.getSession();
				hs.setAttribute("Cnumber", cName);
				rd=request.getRequestDispatcher("profile_Donator.jsp");
				rd.forward(request, response);
			}
			else if(result==1)
			{
				response.getWriter().print("<div>Wrong password</div>");
				rd=request.getRequestDispatcher("LoginJSP.jsp");
				rd.include(request, response);
			}
			else
			{
				response.getWriter().print("<div>Account doesn't exists</div>");
				rd=request.getRequestDispatcher("signup_donator.html");
				rd.include(request, response);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

}
