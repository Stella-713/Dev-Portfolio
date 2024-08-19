<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro.*" %>
<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("utf-8");
	String pwd = request.getParameter("pwd1");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");

	LoginDBBean dbPro = LoginDBBean.getInstance();
	dbPro.PwFind(pwd, id, name, email);
%>
