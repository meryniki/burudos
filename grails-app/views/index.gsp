<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>BuruCPS</title>
</head>
<body>

	<div id="content" class="clearfix">
		<div class="contentwrapper">
			<div class="heading">
				<h3>Principal</h3>
			</div>

			<div id="status" role="complementary">
				<h1>Software</h1>
				<ul class="mlist">
					<li>Gestión de zonas, puntos de venta, vendedores,
						coordinadores y subagentes.</li>
					<li>Definición de puntajes objetivos, premios, y otros
						valores.</li>
					<li>Carga y edición de operación mensual</li>
					<li>Definición de reglas para liquidación</li>
					<li>Generación de liquidaciones de comisiones</li>
					<li>Visualización del historial de liquidaciones</li>
					<li>Visualización de resúmenes de operación mensual</li>
				</ul>
			</div>
			<div id="page-body" role="main">
				<h1>Bienvenido a BuruCPS</h1>
				<p>La función principal de la herramienta es el cálculo de
					comisiones a empleados. La fortaleza de la misma es la
					flexibilidad, tanto en la definición de la información que se
					recibe sobre los mismos, así como también la especificación de las
					reglas de pago de comisiones y/o penalizaciones para cada uno de
					ellos.</p>

				<div id="controller-list" role="navigation">
					<h2>Para liquidar:</h2>
					<ul>
						
						<li><g:link class="create" controller="employee" action="index">
						<span class="icon icomoon-icon-people"></span>Verificar los Empleados del Mes
						</g:link></li>
					
						<li><g:link class="create" controller="transaction" action="upload">
						<span class="icon icomoon-icon-cabinet"></span>Subir Transacciones del Mes
						</g:link></li>
						
						<li><g:link class="create" controller="summary" action="domonthly">
						<span class="icon icomoon-icon-stats-up"></span>Totalizar transacciones
						</g:link></li>
						
						<li><g:link class="create" controller="parameter" action="index">
						<span class="icon icomoon-icon-settings"></span>Verificar los Parametros de las Reglas de Liquidación
						</g:link></li>
						
						<li><g:link class="create" controller="employeeStatement" action="process">
						<span class="icon icomoon-icon-stack"></span>Liquidar
						</g:link></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>