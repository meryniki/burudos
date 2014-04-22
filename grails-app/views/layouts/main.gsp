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

<r:require module="jquery" />
<r:require module="bootstrap" />
<r:require module="core" />
<r:require module="plugins" />

<r:layoutResources />

</head>
<body>

	<div id="header" style="position: fixed;">
		<nav class="navbar navbar-default" role="navigation"
			style="background-color: #7CA4C4;">
			<div class="navbar-header">

				<div id="burucpsLogo" role="banner">
					<a class="home" href="/burucps/"><img width="180px"
						src="${resource(dir: 'images', file: 'burucps_logo.png')}"
						alt="BuruCPS" /></a>
				</div>

			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/burucps/"><span
							class="icon16 icomoon-icon-home"></span> <span class="txt">Principal</span></a>
					</li>
				</ul>

				<ul class="nav navbar-right usernav">
					<li class="dropdown"><a href="#"
						class="dropdown-toggle avatar" data-toggle="dropdown"> <img
							src="${resource(dir: 'images', file: 'avatar.jpg')}" alt=""
							class="image"> <span class="txt">unico@usuario.com</span> <b
							class="caret"></b>
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
									</g:link> 
									<g:if test="${c.getStaticPropertyValue('submenu1', String)}">
										<ul class="sub" style="display: block;">
											<g:if test="${c.getStaticPropertyValue('submenu1', String)}">
												<li><g:link action="index" params="[employeeorbu: '1']" controller="${c.logicalPropertyName}" ><span
														class="icon16 icomoon-icon-arrow-right-3"></span> <g:message
															code="${c.getStaticPropertyValue('submenu1', String)}" /></g:link></li>
											</g:if>

											<g:if test="${c.getStaticPropertyValue('submenu2', String)}">
												<li><g:link action="index" params="[employeeorbu: '2']" controller="${c.logicalPropertyName}" ><span
														class="icon16 icomoon-icon-arrow-right-3"></span> <g:message
															code="${c.getStaticPropertyValue('submenu2', String)}" /></g:link></li>
											</g:if>
										</ul>
										</g:if></li>
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