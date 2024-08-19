<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.hoseoSP.androidDB.*"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   
   String appName = request.getParameter("appName");
   int appTime = Integer.parseInt(request.getParameter("appTime"));
   String PhoneNum = request.getParameter("PhoneNum");
   String dumpSys = request.getParameter("dumpSys");

   Date date = new Date();
   SimpleDateFormat simpleDate = new SimpleDateFormat("yy/MM/dd");
   String tDate = simpleDate.format(date);
   
   
   System.out.println("appName : " + appName);
   System.out.println("appTime : " + appTime);
   System.out.println("PhoneNum : " + PhoneNum);
   System.out.println("-----------------------");
   
   Connection conn = null;
   String url = "jdbc:log4jdbc:oracle:thin:@localhost:1521:xe";
	String user = "test";
	String password = "1234";
	PreparedStatement ppst = null;
	PreparedStatement ppst1 = null;
	PreparedStatement ppst2 = null;
	PreparedStatement ppst3 = null;
	PreparedStatement ppst4 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
   
   try{
	    Class.forName("oracle.jdbc.driver.OracleDriver"); // jdbc 드라이버 로딩
		conn = DriverManager.getConnection(url, user, password); // Connection 객체 생성(db 연결)
		
		ppst1 = conn.prepareStatement("select appName from using_time where appName = ? and phoneNum = ? and TO_CHAR(update_date,'yy/MM/dd') = TO_CHAR(sysdate,'yy/MM/dd')");//'NAVER' 반환
		ppst1.setString(1,appName);
		ppst1.setString(2,PhoneNum);
		rs = ppst1.executeQuery();
		
		
		ppst2 = conn.prepareStatement("select appName from using_time where appName = ? and TO_CHAR(update_date,'yy/MM/dd') = ? and phoneNum = ?");
		ppst2.setString(1,appName);
		ppst2.setString(2,tDate);
		ppst2.setString(3,PhoneNum);
		rs2 = ppst2.executeQuery();
		
		
		ppst3 = conn.prepareStatement("update using_time a set sumTime = (select ROUND(a.appTime/sum(appTime)*100,2) from using_time b where TO_CHAR(update_date,'yy/MM/dd') = TO_CHAR(sysdate,'yy/MM/dd')) where TO_CHAR(update_date,'yy/MM/dd') = TO_CHAR(sysdate,'yy/MM/dd')");
		ppst3.executeQuery();
		
		ppst4 = conn.prepareStatement("select sum(appTime)-(select sum(appTime) from using_time where TO_CHAR(update_date,'yy/MM/dd') = TO_CHAR(sysdate-1,'yy/MM/dd') and phoneNum=?) as dTime from using_time where phoneNum = ? and TO_CHAR(update_date,'yy/MM/dd') = TO_CHAR(sysdate,'yy/MM/dd') group by 0");
		ppst4.setString(1,PhoneNum);
		ppst4.setString(2,PhoneNum);
		rs3 = ppst4.executeQuery();
		
		if(!rs.next()) // select appName from using_time where phoneNum = 13.... 을 했을때 값이 없으면 insert into 로 추가 
		{																	//(select ROUND(a.appTime/sum(appTime)*100,2)
			ppst = conn.prepareStatement("insert into using_time values(?,?,?,?,sysdate)");
			ppst.setString(1,PhoneNum);
			ppst.setString(2,appName);
			ppst.setInt(3,appTime);
			ppst.setInt(4,0);
			ppst.executeUpdate();
			
		}else{ // 있을때
			if(rs2.next())// 날짜가 오늘 날짜가 있으면 실행 
			{
				ppst = conn.prepareStatement("update using_time a set appTime = (?) ,sumTime = (select ROUND(a.appTime/sum(appTime)*100,2) from using_time b  where TO_CHAR(update_date,'yy/MM/dd') = TO_CHAR(sysdate,'yy/MM/dd')) where appName = (?) and TO_CHAR(update_date,'yy/MM/dd') = TO_char(sysdate,'yy/MM/dd')");
				ppst.setInt(1,appTime);
				ppst.setString(2,appName);
				ppst.executeUpdate();
			}
			
			//ppst2 = conn.prepareStatement("update using_time set sumTime=(select sum(appTime) from using_time)");
			//ppst2.executeUpdate();
		}
		
		/* 
		while(rs.next()){
			
			String idFlag = rs.getString("appName");
			System.out.println("android DB ( appname ) : " + appName);
			System.out.println("idflag" + idFlag);
			System.out.println("-------------------");
			if(idFlag.equals(appName)){
				ppst = conn.prepareStatement("update using_time set appTime = (?) where appName = (?)");
				ppst.setInt(1,appTime);
				ppst.setString(2,appName);
				ppst.executeUpdate();
				
			}else{
				ppst = conn.prepareStatement("insert into using_time values(?,?,?)"); // PreparedStatement 객체 생성(쿼리 생성)
				ppst.setString(1,PhoneNum);
				ppst.setString(2, appName); // 1번 물음표에 폼에서 넘어온 id값 매핑
				ppst.setInt(3, appTime); // 2번 물음표에 폼에서 넘어온 passwd값 매핑
				ppst.executeUpdate(); // 쿼리(sql) 실행
				
			
			}
		} */
		
		
		
   }catch(Exception e){

   }finally{
	   try{ // 연결된 DB를 종료
			if(ppst != null)
				ppst.close();
			if(conn != null)
				conn.close();
			if(rs != null)
				rs.close();
			if(ppst1 != null)
				ppst1.close();
			if(ppst2 != null)
				ppst2.close();
			if(ppst3 != null)
				ppst3.close();
			if(rs2 != null)
				rs2.close();
			if(rs3 != null)
				rs3.close();
		}catch(Exception e1){
			e1.getStackTrace();
		}
   }
   
   // 안드로이드로 전송
   //out.println(returns);
%>
