<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>

<html>
<head>
    <title>Item Drop-down List</title>
</head>

<body>

<%
    try{
	   Class.forName("com.mysql.jdbc.Driver");
	   Connection connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/Hackathon","root","");
	   

       Statement statement = connection.createStatement() ;

       resultset =statement.executeQuery("select * from item") ;
%>

		<div align="center">
		    <h1> Choose from following items: </h1>
		        <select>
		        <%  while(resultset.next()){ %>
		            <option><%= resultset.getString(2)%></option>
		        <% } %>
		        </select>
		</div>
<%
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>