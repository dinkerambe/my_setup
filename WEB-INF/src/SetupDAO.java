package setup;
import java.text.*;
import java.util.*;
import java.sql.*;

public class SetupDAO
{
   static Connection currentCon = null;
   static ResultSet rs = null;
   
   final static String SETUP_TABLE = "my_setup";
   final static String SETUP_ID_DB = "setup_id";
   final static String TITLE_DB = "title";
   final static String DESCRIPTION_DB = "description";
   final static String LIKES_DB = "likes";
   final static String FLAGS_DB = "flags";
   
   
   public static SetupBean registerSetup(SetupBean bean)
   {
      long setupID = bean.getSetupID();
      String title = bean.getTitle();
      String description = bean.getDescription();
      int likes = bean.getLikes();
      int flags = bean.getFlags();
      
      List<String> fields = new ArrayList<String>();
      List<String> values = new ArrayList<String>();
      
      fields.add(SETUP_ID_DB);
      fields.add(TITLE_DB);
      fields.add(DESCRIPTION_DB);
      fields.add(LIKES_DB);
      fields.add(FLAGS_DB);
      
      values.add("" + setupID);
      values.add(title);
      values.add(description);
      values.add("" + likes);
      values.add("" + flags);
      
      try{
			SQLCMD.initConnection();	
			SQLCMD.insertField(SETUP_TABLE, fields, values);	
		}catch(Exception e){}
		finally{
			SQLCMD.closeConnection();
		}
		return bean;
		
	}
	
	public static SetupBean grabSetup(long setupID)
	{
	   SetupBean result = null;
	   try{
	      SQLCMD.initConnection();
	      rs = SQLCMD.select(SETUP_TABLE, SETUP_ID_DB,"" + setupID);
	      
	      String title = rs.getString(TITLE_DB);
	      String description = rs.getString(DESCRIPTION_DB);
	      int likes = rs.getInt(LIKES_DB);
	      int flags = rs.getInt(FLAGS_DB);
	      
	      result = new SetupBean(setupID, title, description, likes, flags);
	      
	      }catch(Exception e) {System.out.println("SETUPDAO: Grab Failed");}
	      finally{
	         SQLCMD.closeConnection();
	      }
	      
	      return result;
	      
	 }
	public static SetupBean grabSetup(String setupID)
	{
	   SetupBean result = null;
	   try{
	      SQLCMD.initConnection();
	      rs = SQLCMD.select(SETUP_TABLE, SETUP_ID_DB, setupID);
	      
	      String title = rs.getString(TITLE_DB);
	      String description = rs.getString(DESCRIPTION_DB);
	      int likes = rs.getInt(LIKES_DB);
	      int flags = rs.getInt(FLAGS_DB);
	      
	      result = new SetupBean(setupID, title, description, likes, flags);
	      
	      }catch(Exception e) {System.out.println("SETUPDAO: Grab Failed");}
	      finally{
	         SQLCMD.closeConnection();
	      }
	      
	      return result;
	      
	 }
	 
	 public static void initTable(){
	   try{
	      SQLCMD.initConnection();
	      
	      List<String> fields = new ArrayList<String>();
	      fields.add(SETUP_ID_DB + 
	                           " BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY");
	      fields.add(TITLE_DB + " varchar(255) NOT NULL");
	      fields.add(DESCRIPTION_DB + " varchar(255)");
	      fields.add(LIKES_DB + " INT NOT NULL DEFAULT 0");
	      fields.add(FLAGS_DB + " INT DEFAULT 0");
	      
	      SQLCMD.createTable(SETUP_TABLE, fields);
		 }catch(Exception e){
			System.out.println("SETUPDAO: init setup table failed");
	 	 }
		 finally{
			 SQLCMD.closeConnection();
		 }
	}
	      
	      
	      
     
} 
      
