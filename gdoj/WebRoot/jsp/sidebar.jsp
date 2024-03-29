﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
   
   	<link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>

    <style>
	.ui-autocomplete-loading { background: white url('img/ui-anim_basic_16x16.gif') right center no-repeat; }
	.ui-autocomplete {
		max-height: 200px;
		overflow-y: auto;
		/* prevent horizontal scrollbar */
		overflow-x: hidden;
		/* add padding to account for vertical scrollbar */
		padding-right: 3px;
		
		font-size:11px;
		line-height: 12px;
	}
	/* IE 6 doesn't support max-height
	 * we use height instead, but this forces the menu to always be this tall
	 */
	* html .ui-autocomplete {
		height: 200px;
	}	
	</style>
	
	<jsp:include page="/WEB-INF/templates/sidebarex.html"></jsp:include>
<div class="sidebox roundbox">
           
	            <div class="top-link" >
	            	<div class="title-sidebox" style="width: 100%"><s:text name="sidebar.findusers"/></div>
	            </div>  
	            
	            <form class="handleForm" action="profile">
		            <div style="padding:1em;text-align:right;">
		                <label style="padding-right:0.3em;">Username:</label>
		                <input style="width:11em;" type="text" class="handleBox"/>
		            </div>
		            <div style="padding: 0 1em 1em 1em;text-align:right;">
		                <input style="height:1.65em;padding:0 0.75em;" type="submit" value="Find"/>
		            </div>
		        </form>

<script src="js/jquery-ui.min.js"></script>	
	<script>
	$(function() {
		var cache = {},
			lastXhr;
		$( ".handleBox" ).autocomplete({
		    delay: 300,	
		    width:100,
			minLength: 1,
			selectFirst: false,
			matchSubset:true,  
            matchContains: true,   
			source: function( request, response ) {				
				var term = request.term;		
				if ( term in cache ) {
					//alert(term);
					response( cache[ term ] );
					return;
				}

				lastXhr = $.getJSON( "ajaxUsers", {q:request.term} , function( data, status, xhr ) {
					//alert(data.users[0]);
					cache[ term ] = data.users;
					if ( xhr === lastXhr ) {
						response( data.users );
					}
				});
			}
		});
		
		 $(".handleForm").attr("autocomplete", "off").submit(function() {
		 var name = $(this).find(".handleBox").val();
		 var link;
		 if(name==""){
		 	//alert("No");
		 	 link= "profile";
		 }else {
		  link= "profile/" + name;
		 }
       
        window.location = link;
        return false;

    });
		
		
	});
</script>
   </div> 	






	<%--<div class="sidebox roundbox ">
            	<div class="roundbox-lt">&nbsp;</div>
	       		<div class="roundbox-rt">&nbsp;</div>	    
	            <div class="top-link" style="border-bottom: 1px solid #b9b9b9;">
	            	<div class="title-sidebox" style="width: 100%"><s:text name="sidebar.topusers"/></div>
	            </div>  
	           	<div class="top10">
	            <table class="rtable">
					<tbody>
					<tr>
					<th class="left-item" style="width:28px;">#</th>
					<th class="user" ><s:text name="author"/></th>
					<th class="" style="width:48px;"><s:text name="solved"/></th>
					</tr>
						<jsp:include page="/WEB-INF/templates/topusers.html"></jsp:include>
					</tbody>
				</table>
	            </div>
	            <div class="bottom-link" >
					<table style="width:100%;">
                    <tbody>
                        <tr>
                            <td style="text-align:left;">
                            </td>
                            <td style="text-align:right;">
                                    <a href="problemset/standings">More &rarr;</a>
                            </td>
                        </tr>
                    </tbody>
                    </table>
				</div>   
	</div>--%>
	
		        
	<div class="sidebox roundbox" >
            	
	            <div class="top-link" >
	            	<div class="title-sidebox" style="width: 100%"><s:text name="sidebar.onlineusers"/> (<span class="user-sum">0</span>)</div>
	            </div>  
	            <div class="sidebar-online-users" style="padding: 6px;">					
	           		<img alt="Loading..." src='img/loader.gif'/>
	            </div>	           
	       </div> 
	       
	       
	       
	       
	       
	<div class="sidebox roundbox " >
            	
	            <div class="top-link" >
	            	<div class="title-sidebox" style=""><s:text name="sidebar.recentaction"/></div>
	            </div>  
	            <div class="latest_news" style="">
	            	<jsp:include page="/WEB-INF/templates/latesttopic.html"></jsp:include>
	            </div>
	            <div class="bottom-link" >
					<table style="width: 100%">
                    <tbody>
                        <tr>
                            <td style="text-align:left;">
                            </td>
                            <td style="text-align:right;">
                                    <a href="#">Detailed &rarr;</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
				</div>    
		</div>

   		     	  
<script type="text/javascript">
$(document).ready(function() {
			$.post(
                "onlineUsers",              
                function(json) {    
                   if (json.success != true) {
                    alert(json["error"]);
                    return;
                  }	
                     var size=0;
	                 var opt="";   
		          	 for(var i in json.usersList){	
		          		 size++;	
					 	 opt+="<b><a style='font-size:12px; padding:0 10 0 0px;' href='profile/"+json.usersList[i]+"'>"+json.usersList[i]+"</a></b>"	 	
					}  							
					$(".user-sum").html(size);	
					if(size==0){
						opt="<span style='font: 11px/26px Monaco, monospace;color: #454545;'>No user online.</span>";
					}
					$("div.sidebar-online-users").html(opt);
                },
                "json"
            );
});
</script>

<!--  
<script>
$.fn.smartFloat = function() {
	var position = function(element) {
		var top = element.position().top, pos = element.css("position");
		$(window).scroll(function() {
			var scrolls = $(this).scrollTop();
			if (scrolls > top) {
				if (window.XMLHttpRequest) {
					element.css({
						position: "fixed",
						top: 0
					});	
				} else {
					element.css({
						top: scrolls
					});	
				}
			}else {
				element.css({
					position: pos,
					top: pos
				});	
			}
		});
	};
	return $(this).each(function() {
		position($(this));						 
	});
};

//绑定
$("#float").smartFloat();
</script>
-->