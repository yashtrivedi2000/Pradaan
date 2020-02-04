package com.Hackathon;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;


@WebServlet("/VolunteerReg")
public class VolunteerReg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hackathon", "root", "");
			Statement st = conn.createStatement();
			String fullname = "\"" + req.getParameter("name") + "\"";
			String gender = "\"" + req.getParameter("gender") + "\"";
			String dob = ("\"" + req.getParameter("DOB") + "\"");
			String address = "\"" + req.getParameter("address") + "\"";
			String city = "\"" + req.getParameter("city") + "\"";
			String pincode = "\"" + req.getParameter("pin_code") + "\"";
			String email = "\"" + req.getParameter("email_id") + "\"";
			String cno = "\"" + req.getParameter("cno") + "\"";
			String pass = "\"" + req.getParameter("pass") + "\"";
			String time1 = "\"" + req.getParameter("start_time") + ":00" + "\"";
			String end_time = "\"" + req.getParameter("end_time") + ":00" + "\"";
			String toh = "\"" + req.getParameter("type_of_help") + "\"";
			String query = "INSERT INTO `volunteer` (`Name`, `CNumber`, `Gender`, `DOB`, `Email`, `Address`, `City`, `Pincode`, `Avail_TIme1`, `Avail_TIme2`, `Type`, `Password`) VALUES"
					+ " (" + fullname + "," + cno + "," + gender + "," + dob + "," + email + "," + address + "," + city
					+ "," + pincode + "," + "" + time1 + "," + end_time + "," + toh +  "," + pass + ")";
			System.out.println(query);
			if (st.executeUpdate(query) != 0) {
				resp.getWriter().print("<div>You have successfully Registered... Please login to continue</div>");
				RequestDispatcher rd = req.getRequestDispatcher("login_volunteer.html");
				rd.forward(req, resp);
			}

			System.out.println(query);
			st.close();
			conn.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
