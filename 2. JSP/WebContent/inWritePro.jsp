<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="pro.InBoardDBBean" %>
<%@ page import="pro.InBoardDataBean" %>
<%@ page import="java.sql.*" %>
<%	request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="article" class="pro.InBoardDataBean">
	<jsp:setProperty name="article" property="*"/>
</jsp:useBean>

<%
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	InBoardDBBean dbPro = InBoardDBBean.getInstance();
	dbPro.insertArticle(article);
	response.sendRedirect("inBoard.jsp");
%>