package com.DAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Signin")
public class RegisterUser extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet LoginServlet</title>");
			out.println("</head>");
			out.println("<body>");
			DataBase db=new DataBase();
			String username=request.getParameter("uname");
			String password=request.getParameter("pword");
			if(db.add(username, password))
			{
				response.sendRedirect("LoginPage.jsp");
				lastportion(out);
			
			}
			else
			{
				out.print("Something went wrong...Try again later");
				lastportion(out);
			}
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
	void  lastportion(PrintWriter out) {
		out.println("</body>");
		out.println("</html>");
	}
}
