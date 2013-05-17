<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<link rel="stylesheet"
	href="<%=basePath%>js/poshytip/tip-yellowsimple/tip-yellowsimple.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=basePath%>js/poshytip/tip-darkgray/tip-darkgray.css"
	type="text/css" />

<div id="site-header">
	<div class="headerNav ">
		<ul class="hleft">
			<li class="logo2">
				<span style="font-size: 17px;"><b>Hnfnu Online Judge</b> </span>
			</li>
			<li class="t_conlinejudge">
				<a href="home"><s:text name="home" /> </a>
			</li>
			<li>
				<a href="news"><s:text name="news" /> </a>
			</li>
			<li>
				<a href="topic"><s:text name="topic" /> </a>
			</li>
			<li class="t_c_problemset">
				<a href="problemset"><s:text name="problemset" /> <img
						src="img/t_c_bg.gif" /> </a>
				<ul class="t_c1_box t_c_problemset__box" style="display: none;">
					<li>
						<a href="problemset"><s:text name="problems" /> </a>
						<br />
					</li>
					<li>
						<a href="problemset/status"><s:text name="status" /> </a>
						<br />
					</li>
					<li>
						<a href="problemset/standings"><s:text name="standings" /> </a>
					</li>
				</ul>
			</li>
			<li class="t_c_contests">
				<a href="contests"><s:text name="contests" /> <img
						src="img/t_c_bg.gif" /> </a>
				<ul class="t_c1_box t_c_contests_box" style="display: none;">
					<li>
						<a href="contests"><s:text name="contests" /> </a>
						<br />
					</li>
					<li>
						<a href="contest/recent"><s:text name="recent-contest" /> </a>
					</li>
				</ul>
			</li>
			<li class="t_c_search">
				<a href="search"><s:text name="search" /> </a>
			</li>
			<li class="t_c_faq">
				<a href="topic/9"><s:text name="faq" /> </a>
			</li>
		</ul>

		<ul class="hright">

			<s:if test="#session.session_username==null">

				<li>
					<a href="enter" class="enter"><s:text name="login" /> </a>
				</li>
				<li>
					<a href="registration" class="register"><s:text name="register" />
					</a>
				</li>
			</s:if>
			<s:else>
				<li class="t_cprofile">
					<a href="profile/<s:property value="#session.session_username"/>"><s:property
							value="#session.session_username" /> <img src="img/t_c_bg.gif" />
					</a>
					<ul class="t_c2_box t_cprofile_box" style="display: none;">
						<li>
							<a href="profile/<s:property value="#session.session_username"/>"><s:text
									name="account" /> </a>
						</li>
						<li>
							<a href="settings"><s:text name="settings" /> </a>
						</li>
					</ul>
				</li>
				<li class="t_c_mail">
					<a href="mails"><s:text name="mails" /> </a>
					<ul class="t_c3_box t_c_mail_box" style="display: none;">
						<li>
							<a href="mails"><span title="new mails"
								class="new-mail-count">(0)</span> </a>
						</li>
					</ul>
					<li>
						<a href="logout" class="logout"><s:text name="logout" /> </a>
					</li>
			</s:else>
			<li class="locale">
				<a href="#" class="locale-zh" title="Chinese"><img
						src="img/flag/cn.png" /> </a><a href="#" class="locale-en"
					title="English"><img src="img/flag/gb.png" /> </a>
			</li>
		</ul>
	</div>
	<div class="header_after_bg">
	
	</div>
</div>
<script type="text/javascript"
	src="<%=basePath%>js/poshytip/jquery.poshytip.js">
</script>
<script type="text/javascript">

var _gaq = _gaq || [];
_gaq.push( [ '_setAccount', 'UA-32530365-1' ]);
_gaq.push( [ '_trackPageview' ]);

(function() {
	var ga = document.createElement('script');
	ga.type = 'text/javascript';
	ga.async = true;
	ga.src = ('https:' == document.location.protocol ? 'https://ssl'
			: 'http://www') + '.google-analytics.com/ga.js';
	var s = document.getElementsByTagName('script')[0];
	s.parentNode.insertBefore(ga, s);

	$("a.enter").click(function() {
		setUrlSession();
		window.location = "enter";
		return false;
	});
	$("a.logout").click(function() {
		setUrlSession();
		window.location = "logout";
		return false;
	});

	$("a.locale-en").click(function() {
		$.post("locale.action", {
			lang : "en"
		}, function(data) {
			if (data.success != true) {
				alert(data["success"]);
				return;
			}
			window.location.reload();
		}, "json");
		return false;
	});

	$("a.locale-zh").click(function() {

		$.post("locale.action", {
			lang : "zh"
		}, function(data) {
			if (data.success != true) {
				alert(data["success"]);
				return;
			}
			window.location.reload();
		}, "json");
		return false;
	});
	$.post("new-mail-count", function(json) {
		if (json.success != true) {
			return;
		}
		$(".new-mail-count").html("(" + json.nCount + ")");
		if (json.nCount > 0) {
			$(".t_c_mail_box").show();
		}
	}, "json");

	$(".t_c_problemset").mouseover(function() {
		$(".t_c_problemset__box").show();
	});
	$(".t_c_problemset").mouseout(function() {
		$(".t_c_problemset__box").hide();
	});
	$(".t_c_contests").mouseover(function() {
		$(".t_c_contests_box").show();
		$
	});
	$(".t_c_contests").mouseout(function() {
		$(".t_c_contests_box").hide();
	});
	$(".t_cprofile").mouseover(function() {
		$(".t_cprofile_box").show();
	});
	$(".t_cprofile").mouseout(function() {
		$(".t_cprofile_box").hide();
	});
})();
</script>