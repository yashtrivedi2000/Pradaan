package comm.DAO;
import java.sql.*;
public class DataBase {
	
	String url = "jdbc:mysql://localhost:3306/hackathon";
	String username = "root";
	String password = "";

	public int check(String uname, String pass) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, password);
		uname="\""+uname+"\"";
		pass="\""+pass+"\"";
		String sql = "SELECT * FROM ngo WHERE `Ngo_id`="+uname;
		String sql2 = "SELECT * FROM ngo WHERE`Password`="+pass;
		PreparedStatement st = con.prepareStatement(sql);
		System.out.println(sql);
		System.out.println(sql2);
		ResultSet rs = st.executeQuery(sql);
		boolean validateusrname=rs.next();
		rs.close();
		ResultSet rs2=st.executeQuery(sql2);
		boolean validatepassword=rs2.next();
		rs.close();
		if (validatepassword==true&&validateusrname==true) {
			System.out.println(rs);
			return 0;
		}
		else if(validateusrname==true)
		{
			return 1;
		}
		return 2;
	}
	
	
	public int checkVolunteer(String uname, String pass) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, password);
		uname="\""+uname+"\"";
		pass="\""+pass+"\"";
		String sql = "SELECT * FROM volunteer WHERE `CNumber`="+uname;
		String sql2 = "SELECT * FROM volunteer WHERE`Password`="+pass;
		PreparedStatement st = con.prepareStatement(sql);
		System.out.println(sql);
		System.out.println(sql2);
		ResultSet rs = st.executeQuery(sql);
		boolean validateusrname=rs.next();
		rs.close();
		ResultSet rs2=st.executeQuery(sql2);
		boolean validatepassword=rs2.next();
		rs.close();
		if (validatepassword==true&&validateusrname==true) {
			System.out.println(rs);
			return 0;
		}
		else if(validateusrname==true)
		{
			return 1;
		}
		return 2;
	}
	
	public boolean add(String uname, String pass) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, password);
		uname="\""+uname+"\"";
		pass="\""+pass+"\"";
		//INSERT INTO `credentials`(`Username`, `Password`, `Timings`) VALUES ([value-1],[value-2],[value-3])
		String sql = "INSERT INTO `credentials`(`Username`, `Password`) VALUES ("+uname+","+pass+")";
		Statement st = con.createStatement();
		System.out.println(sql);
		if(st.executeUpdate(sql)!=0) {
			return true;
		}
		return false;
	}
	
}
