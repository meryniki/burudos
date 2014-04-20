<%@ page import="ar.com.burudos.sales.statement.Statement"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">

<g:set var="entityName"
	value="${message(code: 'statement.label', default: 'Statement')}" />

<title><g:message code="default.show.label" args="[entityName]" /></title>
<script type="text/javascript" src="../static/js/jquery-ui.min.js"></script>
</head>
<body>
	<div id="content" class="clearfix">
		<div class="contentwrapper">
			<div class="heading">

				<h3>
					<g:message code="statement.btnLabel" args="[entityName]" />
				</h3>

				<div class="resBtnSearch">
					<a href="#"><span class="icon16 icomoon-icon-search-3"></span></a>
				</div>

				<ul class="breadcrumb">
					<li>You are here:</li>
					<li><a href="#" class="tip" title="" data-hasqtip="true">
							<span class="icon16 icomoon-icon-screen-2"></span>
					</a> <span class="divider"> <span
							class="icon16 icomoon-icon-arrow-right-3"></span>
					</span></li>
					<li class="active"><g:message code="statement.show.label"
							args="[entityName]" /></li>
				</ul>

			</div>

			<ul class="bigBtnIcon">
				<li><g:link class="create" action="index">
						<span class="icon icomoon-icon-menu"></span>
						<g:message code="default.list.label" args="[entityName]" />
					</g:link></li>
			</ul>

			<div class="row">

				<div class="col-lg-2"></div>

				<div class="col-lg-8">
					<div id="show-statement" class="content scaffold-show" role="main">
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>
						<div class="panel panel-default">

							<div class="panel-heading">
								<h4>
									<span>Liquidación de comisiones</span>
								</h4>
							</div>
							<div class="panel-body">

								<div id="statement-header" class="row statement-group">
									<div class="page-header">
										<h4>Datos de la liquidación</h4>
									</div>
									<div class="col-lg-8">
										<div class="row">
											<ul class="col-lg-12">

												<li><span class="blue col-lg-3">Período</span> <span
													class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
													<span class="col-lg-7">Abril 2014</span></li>

												<li><span class="blue col-lg-3">Vendedor</span> <span
													class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
													class="col-lg-7"><a href="/burucps/employee/show/11">
															Fernández, Juan R. </a></span></li>

												<li><span class="blue col-lg-3">Punto de venta</span> <span
													class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
													class="col-lg-7"><a
														href="/burucps/bussinesUnit/show/13"> 1033-LOCAL BEIRO
													</a></span></li>
											</ul>
										</div>
									</div>
									<div class="col-lg-4 statement-result">
										<div class="alert alert-success">
											Saldo a cobrar<br /> $2120,50
										</div>
									</div>
								</div>

								<div class="row statement-group">
									<div class="page-header">
										<h4>Detalle de la liquidación</h4>
									</div>

									<ul id="statement-tab" class="nav nav-tabs pattern">
										<li class="active"><a href="#pos-tab" data-toggle="tab"><span
												class="icon16 icomoon-icon-office"></span>Desempeño del
												punto de venta</a></li>
										<li class=""><a href="#employee-tab" data-toggle="tab"><span
												class="icon16 icomoon-icon-man"></span>Desempeño del
												empleado</a></li>
										<li class=""><a href="#deductions-tab" data-toggle="tab"><span
												class="icon16 icomoon-icon-minus-circle-2"></span>Deducciones</a></li>
									</ul>

									<div class="tab content">
										<div id="pos-tab" class="tab-pane fade active in">
											<div class="col-lg-12">
												<div class="panel panel-default">
													<div class="panel-heading">
														<h4>
															<span>Puntajes del mes</span>
															<form class="panel-form right" action="">
																<a class="btn dropdown-toggle" data-toggle="dropdown"
																	href="#"> <span class="icon16 icomoon-icon-cog-2"></span>
																	<span class="caret"></span>
																</a>
																<ul class="dropdown-menu">
																	<li><a href="#"><span
																			class="icomoon-icon-plus"></span> Agregar</a></li>
																</ul>
															</form>

														</h4>
														<a href="#" class="minimize" style="display: none;">Minimize</a>
													</div>
													<div class="panel-body noPad" style="display: block;">
														<div class="responsive" tabindex="5006"
															style="overflow: hidden; outline: none;">
															<table class="table table-bordered" id="checkAll">
																<thead>
																	<tr>
																		<th>Operación comercial</th>
																		<th>Pts. / operación</th>
																		<th># operaciones</th>
																		<th>Total</th>
																		<th>Actions</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>Cambio de Plan (Altas)</td>
																		<td>12,00</td>
																		<td>16</td>
																		<td>204,00</td>
																		<td>
																			<div class="controls center">
																				<a href="#" class="tip" oldtitle="Edit task"
																					title="" data-hasqtip="true"><span
																					class="icon12 icomoon-icon-pencil"></span></a> <a
																					href="#" class="tip" oldtitle="Remove task"
																					title="" data-hasqtip="true"><span
																					class="icon12 icomoon-icon-remove"></span></a>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>Cambio de Plan (Bajas)</td>
																		<td>-12,00</td>
																		<td>1</td>
																		<td>-12,00</td>
																		<td>
																			<div class="controls center">
																				<a href="#" class="tip" oldtitle="Edit task"
																					title="" data-hasqtip="true"
																					aria-describedby="qtip-17"><span
																					class="icon12 icomoon-icon-pencil"></span></a> <a
																					href="#" class="tip" oldtitle="Remove task"
																					title="" data-hasqtip="true"
																					aria-describedby="qtip-18"><span
																					class="icon12 icomoon-icon-remove"></span></a>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>Migraciones Positivas (Altas)</td>
																		<td>4,80</td>
																		<td>2</td>
																		<td>9,60</td>
																		<td>
																			<div class="controls center">
																				<a href="#" class="tip" oldtitle="Edit task"
																					title="" data-hasqtip="true"
																					aria-describedby="qtip-17"><span
																					class="icon12 icomoon-icon-pencil"></span></a> <a
																					href="#" class="tip" oldtitle="Remove task"
																					title="" data-hasqtip="true"
																					aria-describedby="qtip-18"><span
																					class="icon12 icomoon-icon-remove"></span></a>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>CATER Pospago (Altas)</td>
																		<td>12,00</td>
																		<td>41</td>
																		<td>492,00</td>
																		<td>
																			<div class="controls center">
																				<a href="#" class="tip" oldtitle="Edit task"
																					title="" data-hasqtip="true"
																					aria-describedby="qtip-17"><span
																					class="icon12 icomoon-icon-pencil"></span></a> <a
																					href="#" class="tip" oldtitle="Remove task"
																					title="" data-hasqtip="true"
																					aria-describedby="qtip-18"><span
																					class="icon12 icomoon-icon-remove"></span></a>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>CASIM Pospago (Altas)</td>
																		<td>0,50</td>
																		<td>61</td>
																		<td>30,50</td>
																		<td>
																			<div class="controls center">
																				<a href="#" class="tip" oldtitle="Edit task"
																					title="" data-hasqtip="true"
																					aria-describedby="qtip-17"><span
																					class="icon12 icomoon-icon-pencil"></span></a> <a
																					href="#" class="tip" oldtitle="Remove task"
																					title="" data-hasqtip="true"
																					aria-describedby="qtip-18"><span
																					class="icon12 icomoon-icon-remove"></span></a>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>Bonos (Altas)</td>
																		<td>4,40</td>
																		<td>307</td>
																		<td>1350,80</td>
																		<td>
																			<div class="controls center">
																				<a href="#" class="tip" oldtitle="Edit task"
																					title="" data-hasqtip="true"
																					aria-describedby="qtip-17"><span
																					class="icon12 icomoon-icon-pencil"></span></a> <a
																					href="#" class="tip" oldtitle="Remove task"
																					title="" data-hasqtip="true"
																					aria-describedby="qtip-18"><span
																					class="icon12 icomoon-icon-remove"></span></a>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td colspan="3">Total</td>
																		<td>2074,90</td>
																		<td>
																			<div class="controls center">
																				<a href="#" class="tip" oldtitle="Edit task"
																					title="" data-hasqtip="true"
																					aria-describedby="qtip-17"><span
																					class="icon12 icomoon-icon-sigma"></span></a>
																			</div>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- End .panel -->
											<!-- End totales de ountos -->
											<!-- Objetivos -->
											<div class="col-lg-12">
												<div class="panel panel-default">
													<div class="panel-heading">
														<h4>Objetivos</h4>
														<a href="#" class="minimize" style="display: none;">Minimize</a>
													</div>
													<div class="panel-body noPad" style="display: block;">
														<div class="responsive" tabindex="5007"
															style="overflow: hidden; outline: none;">
															<table class="table">
																<thead>
																	<tr>
																		<th colspan="2">Puntajes</th>
																	</tr>
																</thead>
																<tbody>
																	<tr class="success">
																		<td>Puntaje objetivo</td>
																		<td>1900</td>
																	</tr>
																	<tr class="error">
																		<td>Porcentaje de cumplimiento logrado</td>
																		<td>109,21%</td>
																	</tr>
															</table>
															<table class="table">
																<thead>
																	<tr>
																		<th colspan="2">Cantidad de operaciones</th>
																	</tr>
																	<tr>
																		<th>Operación</th>
																		<th>Q objetivo</th>
																	</tr>
																</thead>
																<tbody>
																	<tr class="success">
																		<td>Altas</td>
																		<td>70</td>
																	</tr>
																	<tr class="error">
																		<td>MEC</td>
																		<td>10</td>
																	</tr>
																	<tr class="info">
																		<td>Prepago</td>
																		<td>20</td>
																	</tr>
																	<tr>
																		<td>Total</td>
																		<td>100</td>
																	</tr>
																	<tr>
																		<td>Estimación CATER</td>
																		<td>100</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- End Objetivos -->
											<!-- Incentivos -->
											<div class="col-lg-12">
												<div class="panel panel-default">
													<div class="panel-heading">
														<h4>Incentivos</h4>
														<a href="#" class="minimize" style="display: none;">Minimize</a>
													</div>
													<div class="panel-body noPad" style="display: block;">
														<div class="responsive" tabindex="5007"
															style="overflow: hidden; outline: none;">
															<table class="table">
																<thead>
																	<tr>
																		<th>Descripción</th>
																		<th>Valor</th>
																		<th>Cantidad/%</th>
																		<th>Total</th>
																	</tr>
																</thead>
																<tbody>
																	<tr class="success">
																		<td>Premio Postventa (Sujeto a 100% puntaje
																			objetivo y CDP no mas o menos 20% CATER)</td>
																		<td>700</td>
																		<td>0</td>
																		<td>0,00</td>
																	</tr>
																	<tr class="success">
																		<td>230 Altas (MEC/Altas de Voz/Prepagos)
																			proporcional a las ventas de c/vendedor</td>
																		<td></td>
																		<td></td>
																		<td>0,00</td>
																	</tr>
																	<tr class="error">
																		<td>250 Altas (MEC/Altas de Voz/Prepagos)
																			proporcional a las ventas de c/vendedor</td>
																		<td></td>
																		<td></td>
																		<td>0,00</td>
																	</tr>
																	<tr>
																		<td>1005 MEC ($ 5 adicionales por alta de MEC)*
																			Sujeto al alcance de su Objetivo MEC EMPRESA</td>
																		<td>5</td>
																		<td>0</td>
																		<td>0,00</td>
																	</tr>
															</table>
														</div>
													</div>
												</div>
											</div>
											<!-- End Objetivos -->
										</div>
										<!-- Employee -->
										<div id="employee-tab" class="tab-pane fade">
											<div class="col-lg-12">
												<div class="panel panel-default">
													<div class="panel-heading">
														<h4>Título</h4>
														<a href="#" class="minimize" style="display: none;">Minimize</a>
													</div>
													<div class="panel-body noPad" style="display: block;">
														<div class="responsive" tabindex="5006"
															style="overflow: hidden; outline: none;"></div>
													</div>
												</div>
											</div>
										</div>
										<!-- End employee -->
										<!-- Deducciones -->
										<div id="deductions-tab" class="tab-pane fade">
											<div class="col-lg-12">
												<div class="panel panel-default">
													<div class="panel-heading">
														<h4>Título</h4>
														<a href="#" class="minimize" style="display: none;">Minimize</a>
													</div>
													<div class="panel-body noPad" style="display: block;">
														<div class="responsive" tabindex="5006"
															style="overflow: hidden; outline: none;"></div>
													</div>
												</div>
											</div>
										</div>
										<!-- End deductions -->
									</div>
								</div>
							</div>
						</div>
						<ul>

							<li class="fieldcontain"><span id="pointsSubtotal-label"
								class="property-label"><g:message
										code="statement.pointsSubtotal.label"
										default="Points Subtotal" /></span> <span class="property-value"
								aria-labelledby="pointsSubtotal-label"></span></li>

							<li class="fieldcontain"><span id="stalesSubtotal-label"
								class="property-label"><g:message
										code="statement.stalesSubtotal.label"
										default="Stales Subtotal" /></span> <span class="property-value"
								aria-labelledby="stalesSubtotal-label"></span></li>

							<li class="fieldcontain"><span id="indIncentSubtotal-label"
								class="property-label"><g:message
										code="statement.indIncentSubtotal.label"
										default="Ind Incent Subtotal" /></span> <span class="property-value"
								aria-labelledby="indIncentSubtotal-label"></span></li>

							<li class="fieldcontain"><span id="posIncentSubtotal-label"
								class="property-label"><g:message
										code="statement.posIncentSubtotal.label"
										default="Pos Incent Subtotal" /></span> <span class="property-value"
								aria-labelledby="posIncentSubtotal-label"></span></li>

							<li class="fieldcontain"><span id="positiveSubtotal-label"
								class="property-label"><g:message
										code="statement.positiveSubtotal.label"
										default="Positive Subtotal" /></span> <span class="property-value"
								aria-labelledby="positiveSubtotal-label"></span></li>

							<li class="fieldcontain"><span id="deductionsSubtotal-label"
								class="property-label"><g:message
										code="statement.deductionsSubtotal.label"
										default="Deductions Subtotal" /></span> <span class="property-value"
								aria-labelledby="deductionsSubtotal-label"></span></li>

							<li class="fieldcontain"><span id="fixedSubtotal-label"
								class="property-label"><g:message
										code="statement.fixedSubtotal.label" default="Fixed Subtotal" /></span>
								<span class="property-value"
								aria-labelledby="fixedSubtotal-label"></span></li>

							<li class="fieldcontain"><span id="total-label"
								class="property-label"><g:message
										code="statement.total.label" default="Total" /></span> <span
								class="property-value" aria-labelledby="total-label"></span></li>

							<li class="fieldcontain"><span id="dueBalance-label"
								class="property-label"><g:message
										code="statement.dueBalance.label" default="Due Balance" /></span> <span
								class="property-value" aria-labelledby="dueBalance-label"></span></li>

							<li class="fieldcontain"><span id="lines-label"
								class="property-label"><g:message
										code="statement.lines.label" default="Lines" /></span></span></li>

							<li class="fieldcontain"><span id="othersSubtotal-label"
								class="property-label"><g:message
										code="statement.othersSubtotal.label"
										default="Others Subtotal" /></span> <span class="property-value"
								aria-labelledby="othersSubtotal-label"></span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
</body>
</html>
