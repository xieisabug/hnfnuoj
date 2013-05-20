<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>
 

 <div id="footer">
    Copyright &copy; Xie jingyang && Wang yan, All Rights Reserved.</br>
    GPL2.0 2011-2013 <a href="https://code.google.com/p/acsolo-oj/" style="text-decoration: none;">acsolo-oj</a> Project TEAM. 
     <br>
</div>

<script type="text/javascript">
$(document).ready(function() {	
     OnlineJudge.saveUrl();
     
     scrolltotop.offset(100,120);
	 scrolltotop.init();
 /*
 * User Tip
 * 
 */
$(function(){	
	$(".user-tip").poshytip({	
		className: 'tip-yellowsimple',		
		alignTo: 'target',		
		alignX: 'right',
		alignY: 'bottom',
		offsetX: 5,
		offsetY: -25,			
		content: function(updateCallback) {
			$.post("userInfo.action", { username:$(this).attr('user')} ,function(data){
			updateCallback(data);	
			});

			return "Loading...";		
		}	
	});	
});	
/*End User tip
*/
 });
</script>

