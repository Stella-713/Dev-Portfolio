package pro;
import java.sql.*;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import org.apache.tomcat.jdbc.pool.DataSource;

public class InBoardDBBean {
	private static InBoardDBBean instance = new InBoardDBBean();
	public static InBoardDBBean getInstance() {
		return instance;
	}
	private InBoardDBBean() {};
	private Connection getConnection() throws Exception {
		Connection conn = null;
		String jdbcUrl = "jdbc:mysql://172.16.100.65:3306/tstour";
		String dbId = "tstour";
		String dbPass = "tstour";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		return conn;
	}
	
	public void insertArticle(InBoardDataBean article) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs = null;

		int num=article.getNum();
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		int number=0;
        String sql="";

        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("select max(num) from inboard");
			rs = pstmt.executeQuery();
			
			if (rs.next())
		      number=rs.getInt(1)+1;
		    else
		      number=1; 
		   
		    if (num!=0) {  
		    	System.out.println("num : "+num);
		      sql="update inboard set re_step=re_step+1 ";
		      sql += "where ref= ? and re_step> ?";
              pstmt = conn.prepareStatement(sql);
              pstmt.setInt(1, ref);
			  pstmt.setInt(2, re_step);
			  pstmt.executeUpdate();
			  re_step=re_step+1;
			  re_level=re_level+1;
		     }else{
		  	  ref=number;
			  re_step=0;
			  re_level=0;
		     }	 
		    
            sql = "insert into inboard(id, pwd, title, content, reg_date,";
		    sql+="ref, re_step, re_level) values(?,?,?,?,?,?,?,?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, article.getId());
            pstmt.setString(2, article.getPwd());
            pstmt.setString(3, article.getTitle());
            pstmt.setString(4, article.getContent());
			pstmt.setTimestamp(5, article.getReg_date());
            pstmt.setInt(6, ref);
            pstmt.setInt(7, re_step);
            pstmt.setInt(8, re_level);
            pstmt.executeUpdate();
        } catch(Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
	
	public List<InBoardDataBean> getArticles(int start, int end)
            throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       List<InBoardDataBean> articleList=null;
       try {
           conn = getConnection();
           
           pstmt = conn.prepareStatement(
           	"select * from inboard order by ref desc, re_step asc limit ?,? ");
           pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
           rs = pstmt.executeQuery();

           if (rs.next()) {
               articleList = new ArrayList<InBoardDataBean>(end);
               do{
                 InBoardDataBean article= new InBoardDataBean();
				 article.setNum(rs.getInt("num"));
				 article.setId(rs.getString("id"));
				 article.setPwd(rs.getString("pwd"));
				 article.setTitle(rs.getString("title"));
				 article.setReg_date(rs.getTimestamp("reg_date"));
				 article.setReadNum(rs.getInt("readNum"));
				 article.setRef(rs.getInt("ref"));
				 article.setRe_step(rs.getInt("re_step"));
				 article.setRe_level(rs.getInt("re_level"));
				 article.setContent(rs.getString("content"));
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
	
	public int getArticleCount() {
		int count=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from inboard");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("Exception : " + e.getMessage());
		}finally {
	           if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	           if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	           if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return count;
	}
	
	public InBoardDataBean getArticle(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		InBoardDataBean article = null;

		try{
			conn = getConnection();
			String sql = "select * from inboard where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article = new InBoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setId(rs.getString("id"));
				article.setTitle(rs.getString("title"));
				article.setPwd(rs.getString("pwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadNum(rs.getInt("readNum"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setReadNum(rs.getInt("readNum"));
				readNum(article.getNum());
			}
		}catch(Exception e) {
			System.out.println("Exception : " + e.getMessage());
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return article;
	}
	
	public void readNum(int num)
	{
		String sql="update inboard set readNum=readNum+1 where num =?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try
		{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}
		catch(Exception e) 
		{
			System.out.println("Exception : " + e.getMessage());
		}
		finally 
		{
	        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	public  void updateArticle(InBoardDataBean article) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = "update inboard set id=?, title=?,";
			sql += "pwd=?, content=? where num=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getId());
			pstmt.setString(2, article.getTitle());
			pstmt.setString(3, article.getPwd());
			pstmt.setString(4, article.getContent());
			pstmt.setInt(5, article.getNum());
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("Exception : " + e.getMessage());
		}finally {
	        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	public int deleteArticle(int num, String pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int state = 0;
		try {
			conn = getConnection();
			String sql = "delete from inboard where num=? and pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, pwd);
			state = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("Exception : "+e.getMessage());
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return state;
	}
	
}
