<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->

<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="BuruCPS" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
<script type="text/javascript"
	src="${resource(dir: 'js', file:'jquery.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'js', file:'jquery.min.js')}"></script>
	<script type="text/javascript"
	src="${resource(dir: 'js', file:'nhpup_1.1.js')}"></script>

<!-- Important plugins put in all pages -->
<script type="text/javascript"
	src="${resource(dir: 'js', file:'bootstrap/bootstrap.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'js', file:'libs/jRespond.min.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'js', file:'libs/modernizr.js')}"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<!-- Charts plugins -->
<script type="text/javascript"
	src="${resource(dir: 'plugins', file:'charts/flot/jquery.flot.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'plugins', file:'charts/flot/jquery.flot.grow.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'plugins', file:'charts/flot/jquery.flot.pie.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'plugins', file:'charts/flot/jquery.flot.resize.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'plugins', file:'charts/flot/jquery.flot.tooltip_0.4.4.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'plugins', file:'charts/flot/jquery.flot.orderBars.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'plugins', file:'charts/sparkline/jquery.sparkline.min.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'plugins', file:'charts/knob/jquery.knob.js')}"></script>

<!-- Misc plugins -->
<script type="text/javascript"
	src="${resource(dir: 'plugins', file:'misc/fullcalendar/fullcalendar.min.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'plugins', file:'misc/qtip/jquery.qtip.min.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'plugins', file:'misc/totop/jquery.ui.totop.min.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'plugins', file:'tables/dataTables/jquery.dataTables.min.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'plugins', file:'tables/dataTables/TableTools.min.js')}"></script>

<!-- Search plugin -->
<script type="text/javascript"
	src="${resource(dir: 'plugins', file:'misc/search/tipuesearch_set.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'plugins', file:'misc/search/tipuesearch_data.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'plugins', file:'misc/search/tipuesearch.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'plugins', file:'jquery.placeholder.min.js')}"></script>

<!-- Form plugins -->
<script type="text/javascript"
	src="${resource(dir: 'plugins', file:'forms/uniform/jquery.uniform.min.js')}"></script>

<!-- Init plugins -->
<script type="text/javascript"
	src="${resource(dir: 'js', file:'main.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'js', file:'dashboard.js')}"></script>
	
<!--  Mi plugins -->
<script type="text/javascript"
	src="${resource(dir: 'js', file:'mi.js')}"></script>

<g:layoutHead />
<g:javascript library="jquery" plugin="jquery" />
<r:layoutResources />

<!-- Mobile Specific Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Force IE9 to render in normal mode -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Le styles -->
<!-- Use new way for google web fonts 
    http://www.smashingmagazine.com/2012/07/11/avoiding-faux-weights-styles-google-web-fonts -->
<!-- Headings -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,700"
	rel="stylesheet" type="text/css">
<!-- Text -->
<link href="http://fonts.googleapis.com/css?family=Droid+Sans:400,700"
	rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:700" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/css?family=Droid+Sans:400" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/css?family=Droid+Sans:700" rel="stylesheet" type="text/css" />
    <![endif]-->

<!-- Core stylesheets do not remove -->
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'bootstrap/bootstrap.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'bootstrap/bootstrap.min.css')}"
	type="text/css">
	<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'bootstrap/bootstrap-theme.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'supr-theme/jquery.ui.supr.css')}"
	type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'icons.css')}"
	type="text/css">

<!-- Plugins stylesheets -->
<link rel="stylesheet"
	href="${resource(dir: 'plugins', file: 'misc/qtip/jquery.qtip.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'plugins', file: 'misc/fullcalendar/fullcalendar.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'plugins', file: 'misc/search/tipuesearch.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'plugins', file: 'forms/uniform/uniform.default.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'plugins', file: 'tables/dataTables/jquery.dataTables.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'plugins', file: 'tables/dataTables/TableTools.css')}"
	type="text/css">

<!-- Main stylesheets -->
<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"
	type="text/css">


<!-- Custom stylesheets ( Put your own changes here ) -->
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'custom.css')}" type="text/css">


<style type="text/css" media="screen">
.mlist ul {
	font-size: 0.9em;
	list-style-type: circle;
	margin-bottom: 0.6em;
	padding: 0;
}

.mlist li {
	font-size: 0.9em;
	list-style-type: square;
	margin-left: 0.6em;
	margin-bottom: 0.8em;
	padding: 0;
}

#status {
	background-color: #eee;
	border: .2em solid #fff;
	margin: 2em 2em 1em;
	padding: 1em;
	width: 12em;
	float: left;
	-moz-box-shadow: 0px 0px 1.25em #ccc;
	-webkit-box-shadow: 0px 0px 1.25em #ccc;
	box-shadow: 0px 0px 1.25em #ccc;
	-moz-border-radius: 0.6em;
	-webkit-border-radius: 0.6em;
	border-radius: 0.6em;
}

.ie6 #status {
	display: inline;
	/* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
}

#status ul {
	font-size: 0.9em;
	list-style-type: none;
	margin-bottom: 0.6em;
	padding: 0;
}

#status li {
	line-height: 1.3;
}

#status h1 {
	text-transform: uppercase;
	font-size: 1.1em;
	margin: 0 0 0.3em;
}

#page-body {
	margin: 2em 1em 1.25em 18em;
}

h2 {
	margin-top: 1em;
	margin-bottom: 0.3em;
	font-size: 1em;
}

p {
	line-height: 1.5;
	margin: 0.25em 0;
}

#controller-list ul {
	list-style-position: inside;
}

#controller-list li {
	line-height: 1.3;
	list-style-position: inside;
	margin: 0.25em 0;
}

@media screen and (max-width: 480px) {
	#status {
		display: none;
	}
	#page-body {
		margin: 0 1em 1em;
	}
	#page-body h1 {
		margin-top: 0;
	}
}
</style>
<style type="text/css">
.jqstooltip {
	position: absolute;
	left: 0px;
	top: 0px;
	visibility: hidden;
	background: rgb(0, 0, 0) transparent;
	background-color: rgba(0, 0, 0, 0.6);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,
		endColorstr=#99000000);
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
	color: white;
	font: 10px arial, san serif;
	text-align: left;
	white-space: nowrap;
	padding: 5px;
	border: 1px solid white;
	z-index: 10000;
}

.jqsfield {
	color: white;
	font: 10px arial, san serif;
	text-align: left;
}
</style>


</head>
<body>

	<div id="header" style="position: fixed;">
		<nav class="navbar navbar-default" role="navigation"
			style="background-color: #7CA4C4;">
			<div class="navbar-header">

				<div id="burucpsLogo" role="banner">
					<a class="home" href="/burudos/"><img width="180px"
						src="${resource(dir: 'images', file: 'burucps_logo.png')}"
						alt="BuruCPS" /></a>
				</div>

			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/burudos/"><span
							class="icon16 icomoon-icon-home"></span> <span class="txt">Principal</span></a>
					</li>
				</ul>

				<ul class="nav navbar-right usernav">
					<li class="dropdown"><a href="#"
						class="dropdown-toggle avatar" data-toggle="dropdown"> <img
							src="images/avatar.jpg" alt="" class="image"> <span
							class="txt">unico@usuario.com</span> <b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li class="menu">
								<ul>
									<li><a href="#"><span
											class="icon16 icomoon-icon-user-plus"></span>Edit profile</a></li>
									<li><a href="#"><span class="icon16 icomoon-icon-plus"></span>Add
											user</a></li>
								</ul>
							</li>
						</ul></li>
					<li><a href="#"><span class="icon16 icomoon-icon-exit"></span><span
							class="txt"> Logout</span></a></li>
				</ul>
			</div>
			<!-- /.nav-collapse -->
		</nav>
		<!-- /navbar -->
	</div>
	<div id="wrapper">
		<div class="resBtn">
			<a href="#"><span class="icon16 icomoon-icon-menu"></span></a>
		</div>
		<div id="sidebarbg"></div>
		<!--Sidebar content-->
		<div id="sidebar" style="position: fixed;">

			<div class="sidenav">

				<div class="sidebar-widget" style="margin: -1px 0 0 0;">
					<h5 class="title" style="margin-bottom: 0">Navigation</h5>
				</div>

				<!-- End .sidenav-widget -->

				<div class="mainnav">
					<ul>
						<!-- <li><a href="#" class="hasUl"><span
							class="icon16 icomoon-icon-list"></span>Forms<span
							class="notification red">sub2</span><span
							class="hasDrop icon16 icomoon-icon-arrow-down-2"></span></a>
				    </li> -->
						<g:each var="c"
							in="${grailsApplication.controllerClasses.sort { it.fullName } }">
							<g:if test="${c.getStaticPropertyValue('linkMe', Boolean)}">
								<li><g:link controller="${c.logicalPropertyName}">
										<span
											class="icon16
									<!-- No quitar espacio siguiente --> <g:message code="${c.getStaticPropertyValue('iconName', String)}" />
									"></span>
										<g:message
											code="${c.getStaticPropertyValue('btnName', String)}" />
									</g:link></li>
							</g:if>
						</g:each>
					</ul>
				</div>
			</div>
		</div>


		<g:layoutBody />
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display: none;">
			<g:message code="spinner.alt" default="Loading&hellip;" />
		</div>
		<r:layoutResources />
	</div>

</body>
</html>