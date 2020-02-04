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

/**
 * Servlet implementation class LoginVolunteer
 */
@WebServlet("/LoginVolunteer11")
public class LoginVolunteer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cName = request.getParameter("c_no");
		String passWord = request.getParameter("password");
		RequestDispatcher rd;
		comm.DAO.DataBase db = new comm.DAO.DataBase();
		try {
			int result = db.checkVolunteer(cName, passWord);
			if (result == 0) {
				HttpSession hs = request.getSession();
				hs.setAttribute("c_no", request.getAttribute("c_no"));
				rd = request.getRequestDispatcher("profile_volunteer.jsp");
				rd.forward(request, response);
			} else if (result == 1) {
				response.getWriter().print("<div>Wrong password</div>");
				rd = request.getRequestDispatcher("login_volunteer.html");
				rd.include(request, response);
			} else {
				response.getWriter().print("<div style='font-size:30px'>Account doesn't exist</div>");
				rd = request.getRequestDispatcher("signup_ngo.html");
				rd.include(request, response);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
