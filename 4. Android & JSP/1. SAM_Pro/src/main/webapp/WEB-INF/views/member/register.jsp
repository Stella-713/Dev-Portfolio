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
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String e_mail = request.getParameter("e_mail");
		
		Connection conn = null;
		String url = "jdbc:log4jdbc:oracle:thin:@localhost:1521:xe";
			String user = "test";
			String password = "1234";
			PreparedStatement ppst = null;
			
		
		try{
		Class.forName("oracle.jdbc.driver.OracleDriver"); // jdbc 드라이버 로딩
		conn = DriverManager.getConnection(url, user, password); // Connection 객체 생성(db 연결)
		
		ppst = conn.prepareStatement("insert into users values(?,?,?,?)");
		ppst.setString(1,id);
		ppst.setString(2,pw);
		ppst.setString(3,"1");
		ppst.setString(4,e_mail);
		ppst.executeUpdate();
				
		}finally{	 
		if(ppst != null)
			ppst.close();
		if(conn != null)
			conn.close();
		}
		
		response.sendRedirect("/board/home");
	%>
</body>
</html>