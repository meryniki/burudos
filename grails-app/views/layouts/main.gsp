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
					<h5 class="title" style="margin-bottom: 0">Empresa</h5>
				</div>


				<div class="mainnav">
					<ul>


						<li><a href="/burucps/bussinesUnit/index"> <span
								class="icon16
									<!-- No quitar espacio siguiente --> icomoon-icon-office
									"></span>
								Puntos de venta
						</a></li>


						<li><a href="/burucps/employee/index"> <span
								class="icon16          <!-- No quitar espacio siguiente --> icomoon-icon-people"></span>
								Empleados
						</a></li>
					</ul>
				</div>
				<div class="sidebar-widget" style="margin: -1px 0 0 0;">
					<h5 class="title" style="margin-bottom: 0">Transacciones</h5>
				</div>


				<div class="mainnav">
					<ul>


						<li><a href="/burucps/operation/index"> <span
								class="icon16          <!-- No quitar espacio siguiente --> icomoon-icon-stack"></span>
								Operaciones
						</a></li>

						<li><a href="/burucps/transaction/index"> <span
								class="icon16
									<!-- No quitar espacio siguiente --> icomoon-icon-cabinet
									"></span>
								Trxs del Mes
						</a></li>


						<li><a href="/burucps/filter/index"> <span
								class="icon16          <!-- No quitar espacio siguiente --> icomoon-icon-archive"></span>
								Filtros
						</a></li>




						<li><a href="/burucps/summary/index" class="hasUl"> <span
								class="icon16          <!-- No quitar espacio siguiente --> icomoon-icon-stats-up"></span>
								Totales <span class="hasDrop icon16 icomoon-icon-arrow-down-2"></span></a>

							<ul class="sub" style="display: none;">

								<li><a href="/burucps/summary/index?employeeorbu=1"><span
										class="icon16 icomoon-icon-arrow-right-3"></span> Empleados</a></li>



								<li><a href="/burucps/summary/index?employeeorbu=2"><span
										class="icon16 icomoon-icon-arrow-right-3"></span> Puntos de
										Venta</a></li>

							</ul></li>

					</ul>
				</div>
				<div class="sidebar-widget" style="margin: -1px 0 0 0;">
					<h5 class="title" style="margin-bottom: 0">Configuración</h5>
				</div>


				<div class="mainnav">
					<ul>

						<li><a href="/burucps/parameter/index"> <span
								class="icon16
									<!-- No quitar espacio siguiente --> icomoon-icon-settings
									"></span>
								Parámetros
						</a></li>

						<li><a href="/burucps/ruleSet/index"> <span
								class="icon16
									<!-- No quitar espacio siguiente --> icomoon-icon-file-xml
									"></span>
								Tipos de liquidación
						</a></li>


						<li><a href="/burucps/rule/index"> <span
								class="icon16
									<!-- No quitar espacio siguiente --> icomoon-icon-embed
									"></span>
								Reglas
						</a></li>

					</ul>
				</div>
				<div class="sidebar-widget" style="margin: -1px 0 0 0;">
					<h5 class="title" style="margin-bottom: 0">Liquidaciones</h5>
				</div>


				<div class="mainnav">
					<ul>
						<li><a href="/burucps/employeeStatement/index"> <span
								class="icon16
									<!-- No quitar espacio siguiente --> icomoon-icon-stack
									"></span>
								Liquidaciones
						</a></li>



					</ul>
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