package comm.SCRH;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/NGO_Reg")
public class NGO_Reg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {
			System.out.print("Hello");
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "");
			Statement st = conn.createStatement();
			String fullname = "\"" + req.getParameter("name") + "\"";
			String NGO_ID = "\"" + req.getParameter("ngo_id") + "\"";
			String address = "\"" + req.getParameter("address") + "\"";
			String city = "\"" + req.getParameter("city") + "\"";
			String pincode = "\"" + req.getParameter("pin_code") + "\"";
			String email = "\"" + req.getParameter("email_id") + "\"";
			String cno = "\"" + req.getParameter("mobile") + "\"";
			String pass = "\"" + req.getParameter("pass") + "\"";
			String time1 = "\"" + req.getParameter("start_time") + ":00" + "\"";
			String end_time = "\"" + req.getParameter("end_time") + ":00" + "\"";
			String ton = "\"" + req.getParameter("type") + "\"";
			/*
			 * INSERT INTO `ngo`(`Ngo_id`, `Name`, `Address`, `City`, `Pincode`, `Email`,
			 * `Mobile`, `Type`, `start_time`, `end_time`, `Password`) VALUES
			 * ([value-1],[value-2],[value-3],[value-4],[value-5],[value-6],[value-7],[value
			 * -8],[value-9],[value-10],[value-11])
			 */
			String query = "INSERT INTO `ngo`(`Ngo_id`, `Name`, `Address`, `City`, `Pincode`, "
					+ "`Email`, `Mobile`, `Type`, `start_time`, `end_time`, `Password`) " + "VALUES (" + NGO_ID + ","
					+ fullname + "," + address + "," + city + "," + pincode + "," + email + "," + cno + "," + ton + ","
					+ time1 + "," + end_time + "," + pass + ")";
			System.out.println(query);
			if (st.executeUpdate(query) != 0) {
				resp.getWriter().print("<div>You have successfully Registered... Please login to continue</div>");
				RequestDispatcher rd = req.getRequestDispatcher("login_ngo.html");
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
