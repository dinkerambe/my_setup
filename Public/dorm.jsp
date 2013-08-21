<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="setup.SetupBean" %>
<%@ page import="setup.SetupDAO" %>

<html>
<head>
<link rel="stylesheet" type="text/css" href="./CSS/dorm.css">
</head>
<body>
<%!
	private String getLocation(String id){
	String loc = null;
	try{
	String connectionURL = "jdbc:mysql://localhost:3306/mysetup_db";	
	String connectionName = "root";
	String connectionPassword = "dsa555";
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection = DriverManager.getConnection(connectionURL, connectionName, connectionPassword);
	Statement stmt = connection.createStatement();
	String query = "SELECT * FROM setup WHERE setup_id = " + id;
	ResultSet rs = stmt.executeQuery(query);
	if(rs.next()){
		loc = "./" + rs.getString("img_loc");
	}
	}catch(Exception ex){System.out.println(ex.getMessage());}
	return loc;
	}

	private String getDescription(String id){
		SetupBean temp = SetupDAO.grabSetup(id);
		String result = temp.getDescription();
		return result;
	}
%>
	<div id="wrapper">
		<div id="header" align="center">
		<a href="index.jsp">
	      <img src="./images/Title.png" height="100"/>
	   </a>
		<ul id="list-nav">
			<li> <a href="#TopRated"> <h2> Top Rated </h2> </a> </li>
			<li> <a href="#MostPopular"> <h2> Most Popular </h2> </a> </li>
			<li> <a href="#Categories"> <h2> Categories </h2> </a> </li>
			<li> <a href="#Random"> <h2> Random </h2> </a> </li>
		</ul>
		
		
		</div>
		<div id="content" align="center">
		
		<div class="left">
		<p> <img class="TextWrap" width="500" src=<%=getLocation(request.getParameter("id"))%> /> <%out.print(getDescription(request.getParameter("id"))%></p>		
		<p> AMAZON AMAZON AMAZON AMAZON AMAZON AMAZON </p>
		</div>
		
		</div>
		<div id="footer"></div>
	</div>
</body>

</html>
