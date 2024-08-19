<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		
		/* String pNumber = request.getParameter("pNumber");
		
		Connection conn = null;
		String url = "jdbc:log4jdbc:oracle:thin:@localhost:1521:xe";
		String user = "test";
		String password = "1234";
		PreparedStatement ppst = null;
		ResultSet rs = null;

		
		try{
		Class.forName("oracle.jdbc.driver.OracleDriver"); // jdbc 드라이버 로딩
		conn = DriverManager.getConnection(url, user, password); // Connection 객체 생성(db 연결)
		
		ppst = conn.prepareStatement("select * from using_time where phoneNum = ?");
		ppst.setString(1,pNumber);
		
		rs = ppst.executeQuery();
		
		while(rs.next())
		{
			String pN = rs.getString("phoneNum");
			String aN = rs.getString("appName");
			String aT = rs.getString("appTime");
			String sT = rs.getString("sumTime");
			
			System.out.println("rs : " + pN);
		
		}
		
		}finally{	 
		if(ppst != null)
			ppst.close();
		if(conn != null)
			conn.close();
		if(rs != null)
			rs.close();
		}
		
			 */
		
	%>
</body>
</html>