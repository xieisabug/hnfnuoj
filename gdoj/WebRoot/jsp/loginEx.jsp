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
    <title>Welcome to GuiLin University of Electronic Technology Online Judge System</title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="GUET,ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="GuiLin University of Electronic Technology Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
  	
</head>

  <body>
  <jsp:include   page="/jsp/head.jsp"/> 
  <div id="body">   
    <div style="position: relative;">
      <div id="content" >
		 <div>
			<div class="roundbox" style="width: 420px;margin: 24px auto;">
					<div class="top-link"> 
					  <div class="titled">LoginEx Of  OnlneJudge   
			          </div>
			        </div>  		        	
					<div class="register-box">
						<form id="loginEx" method="post" action="" >						
							<table class="table-form">       
			                   <tr>
				                  <td class="field-name"><s:text name="login.username"/></td>
				                  <td class="input"> <input  id="username" style="width: 250px;"  name="username" maxlength="30" placeholder="Your username,not your nickname" value="<s:property value="username"/>"/></td>
			                  </tr>
			                  <tr class="subscription-row">
				                  <td >&nbsp;</td>
				                  <td><div class="shiftUp"><span class="fielderror"><s:fielderror ><s:param>username</s:param></s:fielderror></span></div></td>
			                  </tr>
			                  <tr>
				                  <td class="field-name"><s:text name="login.password"/></td>
				                  <td> <input  id="password" name="password" style="width: 250px;" maxlength="30" type="password"  value=""/></td> 
			                  </tr>
			                  <tr class="subscription-row">
				                  <td >&nbsp;</td>
				                  <td><div class="shiftUp"><span class="fielderror"><s:fielderror ><s:param>password</s:param></s:fielderror></span></div></td> 
			                  </tr>     
			                    <tr>
			                        <td colspan="2">
			                            <div style="text-align: center;"><input id="sub" style="width: 86px;" type="Submit" value="<s:text name="login"/>"/> </div>        
			                    	</td>
			                    </tr>
			                    <tr>
			                        <td colspan="2">
			                            <div style="text-align: right; margin-bottom: -16px;"><a href="registration"><s:text name="login.register"/></a> | <a href="password-recovery"><s:text name="login.recovery"/></a></div>        
			                        	
			                        </td>
			                    </tr>
		  
			                </table>
			            </form>
			      </div>
			  </div>      
	       </div>     
	    </div>   
    </div>
    <script type="text/javascript">
	$(document).ready(function()
	{	
		
		 $("#loginEx").submit(function()
		    {		      	
	 			var uname = $("#username").val();
	 			var upass = $("#password").val();	 		
	 			$.ajax({
				    type: "POST",
				    url: "loginEx",
				    data: "username=" + uname + "&password=" + upass,
				    success: function(msg){
				    	//alert(username);
				    	if(msg==1){
				    		window.location.reload();  	
				   		 }else {
				   		 
				    	}
				    }
				});	
		      
		        return false;
		   });
		   
});
	</script>
        <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
