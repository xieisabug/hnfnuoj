<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Home - HNFNU Online Judge</title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="第一电,OJ,HNFNU,ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Hunan First Normal University Technology Online Judge System for ACM">
	<link rel="stylesheet" type="text/css" href="css/styles.css">
    <script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
  	<script type="text/javascript">
$(document).ready(function() {
	 $("#s_type u").bind("click",function(){
	 	$("#t").attr("value",$(this).attr("rel")),
	 	$("#s_type u.curr").removeClass("curr"),
	 	$(this).addClass("curr")
	 	}
	 )
  }
);
</script>


  </head>
 
  <body>
  <jsp:include  page="jsp/head.jsp" ></jsp:include> 
  <div id="body">
  	<div id="sidebar"> 	          
	<jsp:include  page="/jsp/sidebar.jsp" ></jsp:include>
	
   	</div> <!-- End sidebar -->
   	<div id="content" class="content-with-sidebar">	
   		<div id="nav-content" >    	
 
     	</div>
	 <div class="content " style="">      	

		<jsp:include page="/WEB-INF/templates/homepage.html"></jsp:include>	

     </div>
   
    </div> 
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
