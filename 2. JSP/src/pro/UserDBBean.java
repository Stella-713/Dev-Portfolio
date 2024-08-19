package pro;
import java.sql.*;
import java.util.*;

public class UserDBBean {
	private static UserDBBean instance = new UserDBBean();
	public static UserDBBean getInstance() {
		return instance;
	}
	private UserDBBean() {};
	private Connection getConnection() throws Exception {
		Connection conn = null;
		String jdbcUrl="jdbc:mysql://172.16.100.65:3306/tstour";
		String dbId = "tstour";
		String dbPass = "tstour";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		return conn;
	}
	
	public void insertArticle(UserDataBean article) throws Exception {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			conn = getConnection();
			String sql;
			sql = "insert into user values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.id);
			pstmt.setString(2, article.pwd);
			pstmt.setString(3, article.name);
			pstmt.setString(4, article.birth);
			pstmt.setInt(5, article.age);
			pstmt.setString(6, article.phoneNum);
			pstmt.setString(7, article.email);
			pstmt.setString(8, article.sex);
			pstmt.executeUpdate();
		} 
		catch(Exception ex) {
			System.out.println(ex.getMessage());
	 	}
        finally {
        	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
	
	public List<UserDataBean> getArticles() throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       List<UserDataBean> articleList=null;
       
       try {
           conn = getConnection();
           pstmt = conn.prepareStatement("select * from user ");
           rs = pstmt.executeQuery();

           if (rs.next()) {
               articleList = new ArrayList<UserDataBean>();
               
               do{
                 UserDataBean article= new UserDataBean();
				 article.setId(rs.getString("id"));
				 article.setName(rs.getString("name"));
				 article.setSex(rs.getString("sex"));
				 article.setBirth(rs.getString("birth"));
				 article.setAge(rs.getInt("age"));
				 article.setPhoneNum(rs.getString("phoneNum"));
				 article.setEmail(rs.getString("email"));				  
				 articleList.add(article);
			    }while(rs.next());
			}
       } catch(Exception ex) {
           //ex.printStackTrace();
    	   System.out.println("Exception : " + ex.getMessage());
       } finally {
           if (rs != null) try { rs.close(); } catch(SQLException ex) {}
           if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
           if (conn != null) try { conn.close(); } catch(SQLException ex) {}
       }
		return articleList;
	}
}
