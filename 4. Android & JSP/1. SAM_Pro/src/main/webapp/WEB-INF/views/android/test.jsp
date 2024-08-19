<%@page import="java.io.File"%>
<%@page import="java.nio.file.Files"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="com.hoseoSP.controller.*"%>


<body>
 
    <%
    	request.setCharacterEncoding("utf-8");
        //이미지를 저장할 경로 입력.
        String folderTypePath = "D:/1_K_Shield/Project/SAM_Pro/src/main/webapp/resources/images";
        //String folderTypePath = "C:/Users/algor/Desktop/images";
    	
        String name = "";
        String fileName = "";
        String appName = "";
        String appTime = "";
        
        int sizeLimit = 5 * 1024 * 1024; // 5메가까지 제한 넘어서면 예외발생
        try {
            MultipartRequest multi = new MultipartRequest(request, folderTypePath, sizeLimit,"UTF-8",new DefaultFileRenamePolicy());
            Enumeration files = multi.getFileNames();
 			//System.out.println("multi.getFileNames : " + multi.getFileNames());
            //파일 정보가 있다면
            
            if (files.hasMoreElements()) {
            	
                name = (String) files.nextElement();
                File file = multi.getFile(name);
                fileName = new String(multi.getFilesystemName(name).getBytes("KSC5601"),"8859_1");
                System.out.println("file Name : " + fileName);
            }
            
            
            System.out.println("이미지를 저장하였습니다. : " + fileName);
        } catch (IOException e) {
            out.println("안드로이드 부터 이미지를 받아옵니다.");
        }
    %>
 
</body>



