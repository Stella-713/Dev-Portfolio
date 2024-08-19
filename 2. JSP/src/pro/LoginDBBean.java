package pro;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LoginDBBean {
	private static LoginDBBean instance = new LoginDBBean();
	public static LoginDBBean getInstance() {
		return instance;
	}
	
	private LoginDBBean() {};
	
	private Connection getConnection() throws Exception {
		Connection conn = null;
		String jdbcUrl = "jdbc:mysql://172.16.100.65:3306/tstour";
		String dbId = "tstour";
		String dbPass = "tstour";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		return conn;
	}
	
	public int OverLapCheck(String id)
	{
		 Connection conn = null;
	     PreparedStatement pstmt = null;
	     ResultSet rs = null;
	     
	     String check= "";
	     int re = -1;
	     
	     try 
	     {
	    	  UserDataBean article= new UserDataBean();
	          conn = getConnection();
	          pstmt = conn.prepareStatement("select id from user where id=?");
	          pstmt.setString(1, id);
	          rs = pstmt.executeQuery();
	          
	         if(rs.next())
	         {
	        	 re = 1;
	         }
	     }
	     catch(Exception ex) 
	     {
	    	  System.out.println("Exception : " + ex.getMessage());
	     } 
	     finally 
	     {
	          if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	          if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	          if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	     }
	     
	     return re;
	}
	
	public int AdminCheck(String id, String pwd)
	{
		Connection conn = null;
	     PreparedStatement pstmt = null;
	     ResultSet rs = null;
	     
	     String dbAdPw = "";
	     int ad = -1;
	     
	     try 
	     {
	    	  UserDataBean article= new UserDataBean();
	          conn = getConnection();
	          pstmt = conn.prepareStatement("select pwd from user where id=?");
	          pstmt.setString(1, id);
	          rs = pstmt.executeQuery();
	          
	          if(rs.next())
	          {
	        	  dbAdPw = rs.getString("pwd");
	        	  if(dbAdPw.equals(pwd) && id.equals("admin"))
	        	  {
	        		  ad = 1;
	        	  }
	        	  else
	        	  {
	        		  ad = 0;
	        	  }
	          }
	          else
	          {
	        	  ad = -1;
	          }
	          
	          return ad;
	     }
	     catch(Exception ex) 
	     {
	    	  System.out.println("Exception : " + ex.getMessage());
	     } 
	     finally 
	     {
	          if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	          if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	          if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	      }
	     
		return ad;
	}
	
	public int LoginCheck(String id, String pwd) {
		 Connection conn = null;
	     PreparedStatement pstmt = null;
	     ResultSet rs = null;
	     
	     String dbPW = "";
	     int x = -1;
	     
	     try 
	     {
	    	  UserDataBean article= new UserDataBean();
	          conn = getConnection();
	          pstmt = conn.prepareStatement("select pwd from user where id=?");
	          pstmt.setString(1, id);
	          rs = pstmt.executeQuery();
	          
	          if(rs.next())
	          {
	        	  dbPW = rs.getString("pwd");
	        	  if(dbPW.equals(pwd))
	        	  {
	        		  x = 1;
	        	  }
	        	  else
	        	  {
	        		  x = 0;
	        	  }
	          }
	          else
	          {
	        	  x = -1;
	          }
	          
	          return x;
	     }
	     catch(Exception ex) 
	     {
	    	  System.out.println("Exception : " + ex.getMessage());
	     } 
	     finally 
	     {
	          if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	          if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	          if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	      }
		return x;
	}
	
	public String IdFind(String name, String email) {
		 Connection conn = null;
	     PreparedStatement pstmt = null;
	     ResultSet rs = null;
	     
	     String dbId = "";
	     
	     try 
	     {
	    	  UserDataBean article= new UserDataBean();
	          conn = getConnection();
	          pstmt = conn.prepareStatement("select id from user where name=? && email=?");
	          pstmt.setString(1, name);
			  pstmt.setString(2, email);
	          rs = pstmt.executeQuery();
	          
	          while(rs.next())
	          {
	        	  dbId = rs.getString("id");
	          }
	          
	          return dbId;
	     }
	     catch(Exception ex) 
	     {
	    	  System.out.println("Exception : " + ex.getMessage());
	     } 
	     finally 
	     {
	          if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	          if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	          if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	      }
	     
		return dbId;
	}
	
	public void PwFind(String pwd, String id, String name, String email) {
		 Connection conn = null;
	     PreparedStatement pstmt = null;
	     ResultSet rs = null;
	     
	     try 
	     {
	    	  UserDataBean article= new UserDataBean();
	          conn = getConnection();
	          System.out.println(pwd);
	          pstmt = conn.prepareStatement("update user set pwd=? where id=? && name=? && email=?");
	          pstmt.setString(1, pwd);
	          pstmt.setString(2, id);
	          pstmt.setString(3, name);
			  pstmt.setString(4, email);
			  pstmt.executeUpdate();
	     }
	     catch(Exception ex) 
	     {
	    	  System.out.println("Exception : " + ex.getMessage());
	     } 
	     finally 
	     {
	          if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	          if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	          if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	      }
	}
}
