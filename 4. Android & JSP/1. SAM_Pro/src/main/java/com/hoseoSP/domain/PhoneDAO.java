package com.hoseoSP.domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PhoneDAO {
	

	private Connection conn1 = null;
	private PreparedStatement ppst1 = null;
	private ResultSet rs1 = null;

	public PhoneDAO() {
    	try{

    		String url = "jdbc:log4jdbc:oracle:thin:@localhost:1521:XE";
    		String user = "kids_lock";
    		String password = "kids_lock";
    		
    		Class.forName("oracle.jdbc.driver.OracleDriver"); // jdbc 드라이버 로딩
			conn1 = DriverManager.getConnection(url, user, password); // Connection 객체 생성(db 연결)
			
    		ppst1 = conn1.prepareStatement("select appName,appTime from using_time where phoneNum = ?");
	    	
			rs1 = ppst1.executeQuery();

			
    		
    	}catch(Exception e){
    		e.printStackTrace();
    		
    	}
	}
	
	public ArrayList<Useage_timeVO> show(String phoneNum){
		
		String SQL = "select appName,appTime from using_time where phoneNum = ?";
		
		ArrayList<Useage_timeVO> UT = new ArrayList<Useage_timeVO>();
		
		try {
			
			ppst1 = conn1.prepareStatement(SQL);
			ppst1.setString(1,phoneNum);
			rs1 = ppst1.executeQuery();
			while(rs1.next()) {
				
				Useage_timeVO UTt = new Useage_timeVO();
				UTt.setAppName(rs1.getString(1));
				UTt.setAppTime(rs1.getString(2));
				UT.add(UTt);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return UT;
		
	}

}
