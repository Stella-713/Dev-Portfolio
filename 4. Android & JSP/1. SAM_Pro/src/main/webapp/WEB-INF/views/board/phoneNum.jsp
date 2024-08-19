<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
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
			request.setCharacterEncoding("UTF-8");

	    	String phoneNum = request.getParameter("phoneNum");
	    	String str = "";
	    	String url = "jdbc:log4jdbc:oracle:thin:@localhost:1521:xe";
			String user = "test";
			String password = "1234";
	    
	    	Connection conn1 = null;
	    	PreparedStatement ppst1 = null;
	    	ResultSet rs1 = null;
	    	
	    	try{
	    		Class.forName("oracle.jdbc.driver.OracleDriver"); // jdbc 드라이버 로딩
				conn1 = DriverManager.getConnection(url, user, password); // Connection 객체 생성(db 연결)
			
	    		ppst1 = conn1.prepareStatement("select appName,appTime from using_time where phoneNum = ?");
		    	ppst1.setString(1,phoneNum);
		    	
				rs1 = ppst1.executeQuery();

				while(rs1.next()){
							
					String appName = rs1.getString("appName");
					String appTime = rs1.getString("apptime");

					str += "appName="+appName+"appTime="+appTime;
					
				}
	    		
	    	}finally{
	    		
	    		if(rs1 != null)
	    			rs1.close();
	    		if(ppst1 != null)
	    			ppst1.close();
	    		if(conn1 != null)
	    			conn1.close();
	    	}
	    	
			response.sendRedirect("/board/useage_time?"+str);

	    %>
	
</body>
</html>