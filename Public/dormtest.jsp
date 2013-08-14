<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<html>
<head> 
<link rel="stylesheet" type="text/css" href="./CSS/dormtheme.css">
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
%>
	<div id="container">
		<div id="header">
			<img src="./images/Title.png" height="100" />
		</div>
	<div id="body">
		<div class="left">
			<p> <img src=<%= getLocation(request.getParameter("id"))%> width="380" /></p>
			</div>
			<div class="right">
				<p> Hello World </p>
			</div>
        </div>
        <div id="footer">
        </div>
	</div>
</body>
</html>
