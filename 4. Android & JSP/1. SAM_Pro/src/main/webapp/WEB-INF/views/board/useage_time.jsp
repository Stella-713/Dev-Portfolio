<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<%-- <jsp:useBean id="phoneNum" class="com.hoseoSP.bean.phoneNumBean" scope="page"/>
<jsp:setProperty name="phoneNum" property="pText" param="*"/> --%>

<html>
<head>
<meta charset="UTF-8">
<title>using_time</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<style>
	.h_graph ul{
		margin:0 50px 0 0px;
		padding:1px 0 0 0;
		border:1px solid #ddd;
		border-top:0;
		border-right:0;
		font-size:11px;
		font-family:Tahoma, Geneva, sans-serif;
		list-style:none;
	}
	
    .h_graph li{
		position:relative;
		margin:10px 0;
		vertical-align:top;
		white-space:nowrap;
    }
    
    .h_graph .g_term{
    	position:absolute;
    	top:0;
    	left:-50px;
    	width:40px;
    	font-weight:bold;
    	color:#767676;
    	line-height:20px;
    	text-align:right;
    }
    
    .h_graph .g_bar{
    	display:inline-block;
    	position:relative;
    	height:20px;
    	border:1px solid #ccc;
    	border-left:0;
    	background:#B7F0B1;
    }
    
    .h_graph .g_bar span{
    	position:absolute;
    	top:0;
    	right:-50px;
    	width:40px;
    	color:#767676;
    	line-height:20px;
    }

	.header {
		width : 100%;
		height : 240px;
		<!--background-color : red;--> 
	}
	
	.body {
		width : 100%;
		background-color : white;
	}
	
	.footer {
		width : 100%;
		height : 140px;
		background-color : gray;
	}
	
	.main_logo {
		width : 180px;
		height : 180px;
	}
	.rightG{
		float : right;
		width : 50%;
	}
	
	.leftG{
		float : left;
		width : 50%;	
	}
	
	.kLock_header {
	font-family: 'Lato', Calibri, Arial, sans-serif;
    color: #fff;
    background: #000;
    font-family: "KimNamyun";
}
.kLock_header > header {
	width: 90%;
	max-width: 69em;
	margin: 0 auto;
	padding: 1.175em 1.875em;
}

.kLock_header > header h1 {
	font-family: "yg-jalnan";
	font-size: 3.0em;
	line-height: 1.3;
	margin: 0 0 0.6em 0;
	float: left;
	font-weight: 400;
}

.kLock_header > header > span {
	display: block;
	position: relative;
	z-index: 9999;
	font-weight: 700;
	text-transform: uppercase;
	letter-spacing: 0.5em;
	padding: 0 0 0.6em 0.1em;
}

.kLock_header > header > span span:after {
	width: 30px;
	height: 30px;
	left: -12px;
	font-size: 50%;
	top: -8px;
	font-size: 75%;
	position: relative;
}

.kLock_header > header > span span:hover:before {
	content: attr(data-content);
	text-transform: none;
	text-indent: 0;
	letter-spacing: 0;
	font-weight: 300;
	font-size: 110%;
	padding: 0.8em 1em;
	line-height: 1.2;
	text-align: left;
	left: auto;
	margin-left: 4px;
	position: absolute;
	color: #47a3da;
	background: #fff;
}

.kLock_header > header nav {
	float: right;
	text-align: center;
}


.bp-icon-next:after {
	content: "\e000";
}
.bp-icon-drop:after {
	content: "\e001";
}
.bp-icon-archive:after {
	content: "\e002";
}
.bp-icon-about:after {
	content: "\e003";
}
.bp-icon-prev:after {
	content: "\e004";
}

@media screen and (max-width: 55em) {

	.kLock_header > header h1,
	.kLock_header > header nav {
		float: none;
	}

	.kLock_header > header > span,
	.kLock_header > header h1 {
		text-align: center;
	}

	.kLock_header > header nav {
		margin: 0 auto;
	}

	.kLock_header > header > span {
		text-indent: 30px;
	}
	nav ul{
	list-style: none;
	margin: 0;
	padding: 0;
	z-index: 9999;
}

.access-menu{
	display: table;
	margin: 0.5em auto;
}



.access-menu button{
	font-size: 25px;
	color: #eee;
	display: block;
	padding: .45em 2em;
	text-decoration: none;

	-webkit-transition: all .2s linear;
	-moz-transition: all .2s linear;
	-ms-transition: all .2s linear;
	-o-transition: all .2s linear;
	transition: all .2s linear;
}

.access-menu button:hover,
.access-menu button:focus{
	background: #369;
	outline: none;
}
}



	
</style>

<body>
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.18/c3.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>
    <script src="https://d3js.org/d3.v3.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<!--
	<div class="header">
		
		<a class="navbar-brand"><img class="main_logo" src="/resources/images/main_logo.png"></a>
		
		 <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="#">SAM_Pro</a>
			
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav nav-dark">
					<a class="nav-item nav-link" href="#">menu1 <span class="sr-only">(current)</span></a>
					<a class="nav-item nav-link" href="#">menu2</a>
					<a class="nav-item nav-link" href="#">menu3</a>
				</div>
			</div>
			
		</nav> 
		
	
	</div>-->
	<div class="kLock_header" style="height : 150px;">
	<header>   

            <h1>SAM_Pro</h1>
            
            <nav>
              
			<%-- 
            <ul class="access-menu">
			<li>
<form action="/board/index" method="post">
         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
         <button><a>로그아웃</a></button>
      </form>		
			</li>
			</ul>           
             --%>

            </nav>
         </header>
</div>
<br>
	<div class="body">
	

   



<a href="#" class="btn btn-lg btn-info" data-toggle="modal" data-target="#basicModal" style="float: right; margin-left:10px; margin-right:10px;">
  MEMORY
</a>
<div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
  <div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">MEMORY</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
  
              <%	
					BufferedReader ireader = null;
				try{
					String filePath = "D:/Program Files/Nox/bin/memdump.txt";
					//파일열기
					ireader = new BufferedReader(new FileReader(filePath));
					
					while(true){
						String str = ireader.readLine();//줄단위로 데이터 읽기
						if(str==null)
							break;
						out.println(str + "<br>");//읽은 데이터 웹으로 전송		
					}
				}catch(FileNotFoundException fnfe){
					out.println("파일이 존재하지 않습니다.");
				}catch(IOException ioe){
					out.println("파일을 읽을 수 없습니다.");
				}finally{
					try{
						ireader.close();
					}catch(Exception e){
						
					}
				}
			%>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>  



<a href="#" class="btn btn-lg btn-info" data-toggle="modal" data-target="#basicModal2" style="float: right;">
  CPU
</a>
<div class="modal fade" id="basicModal2" tabindex="-1" role="dialog" aria-labelledby="basicModal2" aria-hidden="true">
  <div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel2">CPU </h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
		<%
			BufferedReader reader = null;
		try{
			String filePath = application.getRealPath("/resources/images/cpuSys.txt");
			//파일열기
			reader = new BufferedReader(new FileReader(filePath));
			
			while(true){
				String str = reader.readLine();//줄단위로 데이터 읽기
				if(str==null)
					break;
				out.println(str + "<br>");//읽은 데이터 웹으로 전송		
			}
		}catch(FileNotFoundException fnfe){
			out.println("파일이 존재하지 않습니다.");
		}catch(IOException ioe){
			out.println("파일을 읽을 수 없습니다.");
		}finally{
			try{
				reader.close();
			}catch(Exception e){
				
			}
		}
		%>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>  




	
	
		<br><br><br>
		<br><br><br><br><br>
		<form action="/board/test" style="float:left;">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="submit" value=""> 
		</form>
		<!-- <select id="r_phoneNum" style="float:left" onchange="phoneNum();"> 
		
	<%
		
		String tF = request.getParameter("tF");
		
					
	%>
		
	<%

		Date today = new Date();        
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		String toDay = date.format(today);
		String beforeWeek = "";
		String beforeWeek2 = "";
		String beforeWeek3 = "";
		String beforeWeek4 = "";
		
		String Interval = request.getParameter("Interval");
		
		if("1".equals(Interval))
		{
			Calendar week = Calendar.getInstance();
			week.add(Calendar.DATE , -7);
			beforeWeek = new java.text.SimpleDateFormat("yyyy-MM-dd").format(week.getTime());
			week.add(Calendar.DATE , -7);
			beforeWeek2 = new java.text.SimpleDateFormat("yyyy-MM-dd").format(week.getTime());
			week.add(Calendar.DATE , -7);
			beforeWeek3 = new java.text.SimpleDateFormat("yyyy-MM-dd").format(week.getTime());
			week.add(Calendar.DATE , -7);
			beforeWeek4 = new java.text.SimpleDateFormat("yyyy-MM-dd").format(week.getTime());
			
			%><% 
		}
		
		if("2".equals(Interval))
		{
			Calendar week = Calendar.getInstance();
			week.add(Calendar.DATE , -30);
			beforeWeek = new java.text.SimpleDateFormat("yyyy-MM-dd").format(week.getTime());
			
			%><%
		}
		
	%>
				
		<form action="/board/useage_time?tF=1" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="submit" value="+" style="float:right">
			<input type="text" name="pNumber" style="float:right"><br>
		</form>
		
<!-- 		<button class="btn btn-default" data-target="#layerpop" data-toggle="modal">모달출력버튼</button><br/>
 -->		
 <%
 	if("1".equals(tF))
 	{
 		
%>
 		<table class="table table-bordered" id="pTable">
			<thead class="thead-dark">
				<tr style="background-color : red;">
					<!-- <th></th> -->
					<th>ICON</th>
					<th>APPNAME</th>
					<th>USING TIME</th>
				</tr>
			</thead>
 	
			<c:forEach items="${useage_time}" var="UT" >
				<tbody>
					<td style="width : 100px;">
						<img src="/resources/images/${UT.appName }.png" width="48" height="48">
					</td>
					<td style="width : 222px;">
						<c:out value="${UT.appName }"/>
					</td>
					
					<td style="width : 500px;">
						<div class="h_graph">
					        <ul>
					            <li><span class="g_bar" style="width:${UT.sumTime}%">
					            <span>
					            
					            <fmt:parseNumber value="${UT.sumTime/(1000*60*60)}" integerOnly="true" />시간 <fmt:parseNumber value="${UT.sumTime/(1000*60)}" integerOnly="true" />분 <fmt:parseNumber value="${UT.sumTime/(1000)}" integerOnly="true" />초
								

					            </span></span></li>
					        </ul>
					    </div>
					</td>
					
				</tbody>
			</c:forEach>
		</table>
 		
 		<% 
 	}
 %>
<%-- <div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">Header</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
	
        <table class="table table-bordered" id="pTable">
			<thead class="thead-dark">
				<tr style="background-color : red;">
					<!-- <th></th> -->
					<th>ICON</th>
					<th>APPNAME</th>
					<th>USING TIME</th>
				</tr>
			</thead>
 	
			<c:forEach items="${useage_time}" var="UT" >
				<tbody>
					<td style="width : 100px;">
						<img src="/resources/images/${UT.appName }.png" width="48" height="48">
					</td>
					<td style="width : 222px;">
						<c:out value="${UT.appName }"/>
					</td>
					
					<td style="width : 500px;">
						<div class="h_graph">
					        <ul>
					            <li><span class="g_bar" style="width:${UT.sumTime}%">
					            <span>${UT.sumTime }%</span></span></li>
					        </ul>
					    </div>
					</td>
					
				</tbody>
			</c:forEach>
		</table>       </div>
      <!-- Footer -->
      <div class="modal-footer">
        
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div> --%>
	
		<div id="chart">

            
        </div>
        
        <script>
       	var json = new Array();
		
		var settingDate = new Date();
		settingDate.setMonth(settingDate.getMonth()+1); //하루 전
        var nDate = new Array();
		
        for(var i=0;i<30;i++)
        {
            nDate[i] = settingDate.getMonth(); // 11월
            nDate[i] = nDate[i] + "/" + (settingDate.getDate()); //11월에 날짜 더하기
            settingDate.setDate(settingDate.getDate()-1);
        }
        var i=0;
        
        <c:forEach items="${Month_Use}" var="mu">
        	json[i] = "${mu}";
        	i++;
        	console.log("jsonc : " + json);
        </c:forEach>
        
        
            var chart = c3.generate({
                bindto: '#chart',
                data : {
                    json : {
                        	일별사용시간 : json,
                    },
                    onclick: function (d,i) { 
                    	if(d.x == 0)
                    		window.location.href= "/board/useage_time?Interval="+0;
                    	if(d.x == 1)
                    		window.location.href= "/board/useage_time?Interval="+1;
                    	if(d.x == 2)
                    		window.location.href= "/board/useage_time?Interval="+2;
                    	if(d.x == 3)
                    		window.location.href= "/board/useage_time?Interval="+3;
                    	if(d.x == 4)
                    		window.location.href= "/board/useage_time?Interval="+4;
                    	if(d.x == 5)
                    		window.location.href= "/board/useage_time?Interval="+5;
                    	if(d.x == 6)
                    		window.location.href= "/board/useage_time?Interval="+6;

                    },

                },
	            axis : {
	                x : {
	                    type : 'category',
	                    categories : [nDate[0],nDate[1],nDate[2],nDate[3],	nDate[4],	nDate[5],	nDate[6],	nDate[7],	nDate[8],	nDate[9],	nDate[10],	nDate[11],	nDate[12],	nDate[13],	nDate[14],	nDate[15],	nDate[16],	nDate[17],	nDate[18],	nDate[19],	nDate[20],	nDate[21],	nDate[22],	nDate[23],	nDate[24],	nDate[25],	nDate[26],	nDate[27],	nDate[28],	nDate[29]]

	                },
                	y:{
                		tick : {
                            format: function(d) {
                            		
                                    return Math.ceil(d/(1000*60)) + "분";
                                }
                        }
                	}
                
	            }
            }); 	
            
        </script>
        <BR><br><BR>
	


	
       <%--  <table class="table table-bordered" id="pTable">
			<thead class="thead-dark">
				<tr>
					<!-- <th></th> -->
					<th>ICON</th>
					<th>APPNAME</th>
					<th>USING TIME</th>
				</tr>
			</thead>
			<c:forEach items="${useage_time}" var="UT" >
				<tbody>
					<td style="width : 100px;">
						<img src="/resources/images/${UT.appName }.png" width="48" height="48">
					</td>
					<td style="width : 222px;">
						<c:out value="${UT.appName }"/>
					</td>
					
					<td style="width : 500px;">
						<div class="h_graph">
					        <ul>
					            <li><span class="g_bar" style="width:${UT.sumTime}%">
					            <span>${UT.sumTime }%</span></span></li>
					        </ul>
					    </div>
					</td>
					
				</tbody>
			</c:forEach>
		</table>  --%>
	
		
		<%
		if("0".equals(Interval))
		{
			
			
		
		%>
		
		<table class="table table-bordered" id="pTable">
			<thead class="thead-dark">
				<tr>
					<!-- <th></th> -->
					<th>ICON</th>
					<th>APPNAME</th>
					<th>USING TIME</th>
				</tr>
			</thead>
			<c:forEach items="${useage_time}" var="UT" >
				<tbody>
					<td style="width : 100px;">
						<img src="/resources/images/${UT.appName }.png" width="48" height="48">
					</td>
					<td style="width : 222px;">
						<c:out value="${UT.appName }"/>
					</td>
					
					<td style="width : 500px;">
						<div class="h_graph">
					        <ul>
					            <li><span class="g_bar" style="width:${UT.sumTime}%">
					            <span>${UT.sumTime }%</span></span></li>
					        </ul>
					    </div>
					</td>
					
				</tbody>
			</c:forEach>
		</table>
		<%
		}
			if("1".equals(Interval))
			{
				
		%>
		<table class="table table-bordered" id="pTable">
			<thead class="thead-dark">
				<tr>
					<!-- <th></th> -->
					<th>ICON</th>
					<th>APPNAME</th>
					<th>USING TIME</th>
				</tr>
			</thead>
			<c:forEach items="${useage_time2}" var="UT" >
				<tbody>
					<td style="width : 100px;">
						<img src="/resources/images/${UT.appName }.png" width="48" height="48">
					</td>
					<td style="width : 222px;">
						<c:out value="${UT.appName }"/>
					</td>
					
					<td style="width : 500px;">
						<div class="h_graph">
					        <ul>
					            <li><span class="g_bar" style="width:${UT.sumTime}%">
					            <span>${UT.sumTime }%</span></span></li>
					        </ul>
					    </div>
					</td>
					
				</tbody>
			</c:forEach>
		</table>
		
		<%
		}
		%>
		<%
			if("2".equals(Interval))
			{
				
		%>
		<table class="table table-bordered" id="pTable">
			<thead class="thead-dark">
				<tr>
					<!-- <th></th> -->
					<th>ICON</th>
					<th>APPNAME</th>
					<th>USING TIME</th>
				</tr>
			</thead>
			<c:forEach items="${useage_time3}" var="UT" >
				<tbody>
					<td style="width : 100px;">
						<img src="/resources/images/${UT.appName }.png" width="48" height="48">
					</td>
					<td style="width : 222px;">
						<c:out value="${UT.appName }"/>
					</td>
					
					<td style="width : 500px;">
						<div class="h_graph">
					        <ul>
					            <li><span class="g_bar" style="width:${UT.sumTime}%">
					            <span>${UT.sumTime }%</span></span></li>
					        </ul>
					    </div>
					</td>
					
				</tbody>
			</c:forEach>
		</table>
		
		<%
		}
		%>
		<%
			if("3".equals(Interval))
			{
				
		%>
		<table class="table table-bordered" id="pTable">
			<thead class="thead-dark">
				<tr>
					<!-- <th></th> -->
					<th>ICON</th>
					<th>APPNAME</th>
					<th>USING TIME</th>
				</tr>
			</thead>
			<c:forEach items="${useage_time4}" var="UT" >
				<tbody>
					<td style="width : 100px;">
						<img src="/resources/images/${UT.appName }.png" width="48" height="48">
					</td>
					<td style="width : 222px;">
						<c:out value="${UT.appName }"/>
					</td>
					
					<td style="width : 500px;">
						<div class="h_graph">
					        <ul>
					            <li><span class="g_bar" style="width:${UT.sumTime}%">
					            <span>${UT.sumTime }%</span></span></li>
					        </ul>
					    </div>
					</td>
					
				</tbody>
			</c:forEach>
		</table>
		
		<%
		}
		%>
		<%
			if("4".equals(Interval))
			{
				
		%>
		<table class="table table-bordered" id="pTable">
			<thead class="thead-dark">
				<tr>
					<!-- <th></th> -->
					<th>ICON</th>
					<th>APPNAME</th>
					<th>USING TIME</th>
				</tr>
			</thead>
			<c:forEach items="${useage_time5}" var="UT" >
				<tbody>
					<td style="width : 100px;">
						<img src="/resources/images/${UT.appName }.png" width="48" height="48">
					</td>
					<td style="width : 222px;">
						<c:out value="${UT.appName }"/>
					</td>
					
					<td style="width : 500px;">
						<div class="h_graph">
					        <ul>
					            <li><span class="g_bar" style="width:${UT.sumTime}%">
					            <span>${UT.sumTime }%</span></span></li>
					        </ul>
					    </div>
					</td>
					
				</tbody>
			</c:forEach>
		</table>
		
		<%
		}
		%>
		<%
			if("5".equals(Interval))
			{
				
		%>
		<table class="table table-bordered" id="pTable">
			<thead class="thead-dark">
				<tr>
					<!-- <th></th> -->
					<th>ICON</th>
					<th>APPNAME</th>
					<th>USING TIME</th>
				</tr>
			</thead>
			<c:forEach items="${useage_time6}" var="UT" >
				<tbody>
					<td style="width : 100px;">
						<img src="/resources/images/${UT.appName }.png" width="48" height="48">
					</td>
					<td style="width : 222px;">
						<c:out value="${UT.appName }"/>
					</td>
					
					<td style="width : 500px;">
						<div class="h_graph">
					        <ul>
					            <li><span class="g_bar" style="width:${UT.sumTime}%">
					            <span>${UT.sumTime }%</span></span></li>
					        </ul>
					    </div>
					</td>
					
				</tbody>
			</c:forEach>
		</table>
		
		<%
		}
		%>
		<%
			if("6".equals(Interval))
			{
				
		%>
		<table class="table table-bordered" id="pTable">
			<thead class="thead-dark">
				<tr>
					<!-- <th></th> -->
					<th>ICON</th>
					<th>APPNAME</th>
					<th>USING TIME</th>
				</tr>
			</thead>
			<c:forEach items="${useage_time7}" var="UT" >
				<tbody>
					<td style="width : 100px;">
						<img src="/resources/images/${UT.appName }.png" width="48" height="48">
					</td>
					<td style="width : 222px;">
						<c:out value="${UT.appName }"/>
					</td>
					
					<td style="width : 500px;">
						<div class="h_graph">
					        <ul>
					            <li><span class="g_bar" style="width:${UT.sumTime}%">
					            <span>${UT.sumTime }%</span></span></li>
					        </ul>
					    </div>
					</td>
					
				</tbody>
			</c:forEach>
		</table>
		
		<%
		}
		%>
		
	</div>
	
	
	
</body>
<script>
	function addBtn(){
		var pNumber = document.getElementById("pNumber").value;
		
		alert(pNumber);
		
	}
	
	function phoneNum(){
		
		$("#pTable > tbody").empty();
		
		var target = document.getElementById("r_phoneNum");
	    
	    var phoneNum = $("#r_phoneNum option:selected").val()
	    
	    window.location.href = "/board/useage_time?phoneNum="+phoneNum;
	}
	
	function wControl(){

		window.location.href= "/board/useage_time?Interval="+1;
	}
	
	function mControl(){
		
		//window.location.href = "/board/useage_time?Interval="+2;
		$("#myModal").modal();

	}
	
</script>
</html>