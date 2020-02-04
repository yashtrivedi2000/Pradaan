<%@ page import="java.sql.*"%>
<%
	String connectionURL = "";
	Connection connection = null;
	Statement statement = null;
	ResultSet rs = null;
	int f = 0;
%>

<html>
<head>
<title>csepoff</title>
</head>

<body>
	<form name="cse" action="fireRequestToNGO.java">
		<%
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hackathon", "root", "");
			statement = connection.createStatement();
			//String[] batchcse = request.getParameterValues("batchcse");
			//String batchhcse = "";
			//String data = "";
			//String data1 = "";
			//String data2 = "";


			rs = statement.executeQuery("select Name from ngo");
			//session.setAttribute("Quantity", request.getParameter("Quantity"));
			//session.setAttribute("catagory", request.getParameter("catagory"));
			System.out.println(session.getAttribute("category"));
			System.out.println(request.getParameter("Quantity"));
			out.println("<table border='1'><tr>");
			out.println("<th>NAME</th><th>DEPARTMENT</th><th>BATCH</th>");
			out.println("<th>FATHER NAME</th><th>MOTHER NAME</th><th>SELECT</th>");

			while (rs.next()) {
				out.println("<tr>");
				out.println("<td>" + rs.getString(1) + "</td>");
				out.println("<td><input type=\"checkbox\" name=\"checkbox\" value=\"${}\"></td>");
				out.println("</tr>");
			}
			out.println("</table>");
		%>
		<input type="submit" value="SUBMIT">
	</form>
</body>
</html>