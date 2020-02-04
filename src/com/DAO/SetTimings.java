package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SetTimings
 */
@WebServlet(description = "TO set user schedules and Timings", urlPatterns = { "/SetTimings" })
public class SetTimings extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SetTimings() {
		super();

	}

	protected void service(HttpServletRequest request, HttpServletResponse response) {
		String url = "jdbc:mysql://localhost:3306/yash_project";
		String username = "root";
		String password = "";
		HttpSession hs=request.getSession();
		String usrname=(String) hs.getAttribute("usrname");
		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection(url, username, password);

			String[] name = request.getParameterValues("p_new1");
			String[] name1 = request.getParameterValues("p_new");
			String timing = "[" + name1[0] + ":" + name[0] + "]";;
			//String uname = request.getParameter("username");
			for (int i = 1; i < name.length - 1; i++) {
				timing += "[" + name1[i] + "-" + name[i] + "]" + ",";
			}
			timing += "[" + name1[name.length - 1] + ":" + name[name.length - 1] + "]";
			String sql = "UPDATE `credentials` SET `timings`=\"" + timing + "\" WHERE `Username`=" + "\""+usrname+ "\"";
			System.out.println(sql);
			Statement st = con.createStatement();
			st.executeUpdate(sql);
			response.sendRedirect("showAll");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
