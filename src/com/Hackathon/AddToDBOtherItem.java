package com.Hackathon;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddToDBOtherItem
 */
@WebServlet("/AddToDBOtherItem")
public class AddToDBOtherItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int i;
			String maxsql = "select MAX(item_id) from item";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hackathon", "root", "");
			Statement st = conn.createStatement();
			PreparedStatement ps = conn.prepareStatement(maxsql);
			ResultSet rs = ps.executeQuery(maxsql);
			rs.next();
			i = Integer.parseInt(rs.getString(1));
			rs.close();
			// INSERT INTO `item`(`item_id`, `item_name`, `unit`) VALUES
			// ([value-1],[value-2],[value-3])
			String iname = "\"" + req.getParameter("iname") + "\"";
			String iunit = "\"" + req.getParameter("iunit") + "\"";
			i++;
			String sql = "INSERT INTO `item`(`item_id`, `item_name`, `unit`) VALUES (" + "\"" + i + "\"" + "," + iname
					+ "," + iunit + ")";
			System.out.println(sql);
			if (st.executeUpdate(sql) != 0) {
				resp.getWriter()
						.print("<div style='top:10%'>Your item added successfully,please find in the drop down.</div>");
				RequestDispatcher rd = req.getRequestDispatcher("donate_Donator.jsp");
				rd.include(req, resp);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}