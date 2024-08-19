<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="pro.*" %>
<%@ page import="java.sql.*" %>
<%	request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="article" class="pro.OutBoardDataBean">
	<jsp:setProperty name="article" property="*"/>
</jsp:useBean>

<%
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	OutBoardDBBean dbPro = OutBoardDBBean.getInstance();
	dbPro.insertArticle(article);
	response.sendRedirect("outBoard.jsp");
%>