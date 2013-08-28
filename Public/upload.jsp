<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="setup.SetupBean" %>
<%@ page import="setup.SetupDAO" %>

<HTML>
   <HEAD>
      <LINK rel="stylesheet" type="text/css" href="./CSS/dorm.css">
   </HEAD>
   <BODY>
      <%!
      	private String getDescription(String id){
  	   	SetupBean temp = SetupDAO.grabSetup(id);
	   	String result = temp.getDescription();
	   	return result;
	   }
	
      %>
      <% String id = request.getParameter("id"); %>
      <% SetupBean bean = SetupDAO.grabSetup(id); %>
      <% ArrayList<String> imgList= SetupDAO.grabImages(id);%>
      <% ArrayList<String> linkList = SetupDAO.grabLinks(id);%>
	   <div id="wrapper">
	   	<div id="header" align="center">
	      	<a href="index.jsp">
	            <img src="./images/Title.png" height="100"/>
            </a>
	      	<div id='cssmenu'>
               <ul>
                  <li class='active'><a href='index.jsp'><span>Home</span></a></li>
                  <li class='active'><a href='#'><span>Top Dorms</span></a>
                  <li><a href='upload.jsp'><span>Upload</span></a></li>
                  <li class='last'><a href='#'><span>Most Liked</span></a></li>
               </ul>
            </div>
		   </div>
		   <div id="content" align="center">
		      <h3>File Upload:</h3>
            Select a file to upload: <br />
            <form action="UploadServlet" method="post"
                        enctype="multipart/form-data">
            <input type="file" name="file" size="50" />
            <br />
            <input type="submit" value="Upload File" />
            </form>
		
		</div>
		<div id="footer"></div>
	   </div>
   </BODY>
</HTML>

