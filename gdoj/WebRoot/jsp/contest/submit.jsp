<%@ page language="java" import="java.util.*,
java.io.File,
javax.xml.parsers.DocumentBuilder,
javax.xml.parsers.DocumentBuilderFactory,org.w3c.dom.Document,org.w3c.dom.NodeList" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">

<html>
  <head>
    <base href="<%=basePath%>">
    <title>Submit Solution</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="GUET,ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="GuiLin University of Electronic Technology Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
	
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
  <!--  <script type="text/javascript" src="js/json.js"></script> -->	
  	<script type="text/javascript">
      $(document).ready(function() {
 
});
</script>  

  </head>

  <body>&nbsp;   
  <jsp:include   page="/jsp/head.jsp"></jsp:include> 
  <div id="body">
  		<div id="sidebar"> 	
            <div class="sidebox roundbox">
	            <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="title-sidebox" style="width: 100%"><s:text name="sidebar.infobox"/></div>
	            </div>  
	            <div class="" style="margin: 6px;">
	            1、MS C/C++要注意的是:<br/>
 &nbsp;&nbsp; 1)主函数必须int main(){return 0;}<br/>
  &nbsp;&nbsp;2)sqrt函数必须的参数必须浮点型，否则你将得到编译错误的裁判。。。。如：sqrt((double)Var)<br/>

2、建议大家使用GNU，因为与VC++6比较相似。<br/>

3、java的童鞋注意main函数必须被包含在一个名为Main的类中，注意是Main。否则您将无法编译通过。其他类可自定义名字<br/>


4、请注意，每错一次将会被罚掉20分钟（编译错误不罚）。在解题数一样的情况下将比较罚时。。罚时=每道题Accepted的时间+错误次数*20分钟<br/>
	            
	            </div>
	         
	        </div>    
	
		
   	 </div> <!-- End sidebar -->
     <div id="content" class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
     	<div id="nav-content" >	
     	<a href="contest/<s:property value="contestId"/>"><s:text name="problems"/></a>
     	<a href="contest/<s:property value="contestId"/>/status"><s:text name="status"/></a>
     	<a href="contest/<s:property value="contestId"/>/standings" target="blank"><s:text name="standings"/></a>
     		<s:if test="#session.session_username!=null">
     	<a href="contest/<s:property value="contestId"/>/status/with/<s:property value="#session.session_username"/>/page/1" target="blank"><s:text name="mysubmission"/></a>
     	</s:if>
     	</div>
	    <div class="content" style="">	    				
				<div class="roundbox" style="word-wrap:break-word;">		
				<s:form id="submit" method="post" action="submited.action" theme="simple">
					<input type="hidden" name="contestId" value="<s:property value="contestId"/>"/>
					<div class="info" style="width:560px;margin: 0px auto;padding:12px 12px 12px 12px;">
						<b><span style="color:red"><s:fielderror></s:fielderror></span></b>
						<b>Problem&nbsp;:</b>
						<SELECT  style= "width:250px" name="num">
							<s:iterator value="problemList" status="st">
								<option value="<s:property value="num"/>" <s:if test="numId==num">selected="selected"</s:if>><s:property value="num"/>-<s:property value="title"/> </option>
							</s:iterator>	
						</SELECT>
						<br/>
						<b>Language:</b>
						<select id="select_lang"  style= "width:250px" name="language">
							<%
			   try {
			   		long lasting = System.currentTimeMillis();
					File f = new File("D:\\OJ\\GDOJ\\Language.xml");
					DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
					DocumentBuilder builder = factory.newDocumentBuilder();
					Document doc = builder.parse(f);
					NodeList nl = doc.getElementsByTagName("VALUE");
					String LanguageId=new String();
					String Language=new String();
					for (int i = 0; i < nl.getLength(); i++) {	
						LanguageId=doc.getElementsByTagName("ID").item(i).getFirstChild().getNodeValue();
						Language=doc.getElementsByTagName("LANG").item(i).getFirstChild().getNodeValue();
						request.setAttribute("LanguageId",LanguageId); 
						//System.out.print("Language:"+Language);
						//System.out.println("运行时间：" + (System.currentTimeMillis() - lasting)+ "毫秒");
					
	   		 		%>		   		 			
						<s:property value="LanguageId"/><option value="<%=LanguageId%>" <s:if test="language==#request.LanguageId">selected="selected"</s:if>><%=Language %></option>
					<%
					}
				} catch (Exception e) {
				%>
													<option value="1" <s:if test="language==1">selected="selected"</s:if>>MS C++</option>
													<option value="2" <s:if test="language==2">selected="selected"</s:if>>MS C</option>
													<option value="3" <s:if test="language==3">selected="selected"</s:if>>GNU C++</option>
													<option value="4" <s:if test="language==4">selected="selected"</s:if>>GNU C</option>
													<option value="5" <s:if test="language==5">selected="selected"</s:if>>Java</option>
													<option value="8" <s:if test="language==8">selected="selected"</s:if>>Pascal</option>
				<% } %>		
						</select>
					<h5>
						Source:
					</h5>
						<textarea id="source" name="source" rows="25" style="width: 100%" ><s:property value="source"/></textarea>	
					</div>
					<div style="text-align: center;margin: 12px;">	
			    		<input id="submitsolution" type="Submit" value="Submit Solution"/>
			    	</div>
				</s:form>	
		   </div>	  	  	 
	  </div>    
	</div>   
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
