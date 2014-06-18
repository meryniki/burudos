<%@ page import="ar.com.burudos.sales.statement.EmployeeStatement"%>
<!DOCTYPE html>
<html>
<head>
<g:set var="entityName"
	value="${message(code: 'statement.label', default: 'Statement')}" />

<title><g:message code="default.show.label" args="[entityName]" /></title>

<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"
	type="text/css">

<r:require module="jquery" />
<r:require module="bootstrap" />
<r:require module="core" />
<r:require module="plugins" />
<r:layoutResources />
</head>
<body>
	<div class="plano_negro width_fijo row">

		<div class="plano_negro col-lg-12">
			<div id="show-statement" class="plano_negro content scaffold-show" role="main">
				<g:if test="${flash.message}">
					<div class="plano_negro message" role="status">
						${flash.message}
					</div>
				</g:if>
				<div class="plano_negro panel panel-default">

					<div class="plano_negro panel-body">

						<div id="statement-header" class="plano_negro row statement-group">
							<div class="plano_negro page-header">
								<h4>Liquidación</h4>
							</div>
							<div class="plano_negro col-lg-8">
								<div class="plano_negro row">
									<ul class="plano_negro col-lg-12">

										<li><span class="plano_negro blue col-lg-3"><g:message
													code="statement.statementPeriod.label" default="Periodo" /></span>
											<span class="plano_negro icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="plano_negro col-lg-7"><g:formatDate format="yyyy/MM"
													date="${employeeStatementInstance.statementPeriod}" /></span></li>

										<li><span class="plano_negro blue col-lg-3"><g:message
													code="statement.updateDate.label"
													default="Última Actualización" /></span> <span
											class="plano_negro icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="plano_negro col-lg-7"><g:formatDate
													format="yyyy/MM/dd hh:mm"
													date="${employeeStatementInstance.lastUpdateDate}" /></span></li>

										<li><span class="plano_negro blue col-lg-3"><g:message
													code="statement.statement.employee.label"
													default="Empleado" /></span> <span
											class="plano_negro icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="plano_negro col-lg-7"> <g:link controller="employee"
													action="show"
													id="${employeeStatementInstance?.employee?.id}">
													${employeeStatementInstance?.employee?.encodeAsHTML()}
												</g:link></span></li>

										<li><span class="plano_negro blue col-lg-3"><g:message
													code="statement.businessUnit.label"
													default="Punto de Venta" /></span> <span
											class="plano_negro icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="plano_negro col-lg-7"><g:link controller="bussinesUnit"
													action="show"
													id="${employeeStatementInstance?.businessUnit?.id}">
													${employeeStatementInstance?.businessUnit?.encodeAsHTML()}
												</g:link></span></li>
									</ul>
								</div>
							</div>
							<div class="plano_negro col-lg-4 statement-result">
								<div class="plano_negro alert alert-info">
									Saldo a cobrar<br /> $
									<g:fieldValue bean="${employeeStatementInstance}" field="total" />
								</div>
							</div>
						</div>

						<!-- Objetivos -->
						<div class="plano_negro col-lg-12">
							<div class="plano_negro panel panel-default">
								<div class="plano_negro panel-body noPad" style="display: block;">
									<div class="plano_negro responsive" tabindex="5007"
										style="overflow: hidden; outline: none;">
										<table class="plano_negro table alert alert-success">
											<thead>
												<tr>
													<th>Premio Postventa</th>
													<th>Puntaje Objetivo</th>
													<th>% Alcanzado</th>
													<th>Comision</th>
												</tr>
											</thead>
											<tbody>
												<g:each
													in="${employeeStatementInstance.getBuObjPointsLines()}">
													<tr>
														<td>
															${it.description}
														</td>
														<td>
															${it.unitAmount}
														</td>
														<td>
															${it.operationsAmount}
														</td>
														<td>
															${it.amount}
														</td>
													</tr>
												</g:each>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="plano_negro col-lg-12">
							<div class="plano_negro panel panel-default">
								<div class="plano_negro panel-body noPad" style="display: block;">

									<div class="plano_negro responsive" tabindex="5007"
										style="overflow: hidden; outline: none;">
										<table class="plano_negro table">
											<thead>
												<tr>
													<th colspan="2">Objetivos de operaciones</th>
												</tr>
												<tr>
													<th>Operación</th>
													<th>Q objetivo</th>
												</tr>
											</thead>
											<tbody>
												<g:each in="${employeeStatementInstance.getBuObjQLines()}">
													<tr>
														<td>
															${it.description}
														</td>
														<td>
															${it.unitAmount}
														</td>
														<td>
															${it.amount}
														</td>
													</tr>
												</g:each>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>



						<div class="plano_negro row statement-group">
							<div class="plano_negro page-header">

								<h4>Detalle de la liquidación del Punto de Venta</h4>


								<div class="plano_negro tab content">
									<div id="pos-tab" class="plano_negro tab-pane fade active in">
										<div class="plano_negro col-lg-12">
											<div class="plano_negro panel panel-default">
												<div class="plano_negro panel-heading">
													<h4>
														<span>Operaciones Comerciales de Postventa</span>
													</h4>
												</div>
												<div class="plano_negro panel-body noPad" style="display: block;">
													<div class="plano_negro responsive" tabindex="5006"
														style="overflow: hidden; outline: none;">
														<table class="plano_negro table table-bordered" id="checkAll">
															<thead>
																<tr>
																	<th>Operación comercial</th>
																	<th>Pts. / operación</th>
																	<th># operaciones</th>
																	<th>Total</th>
																</tr>
															</thead>
															<tbody>
																<g:each
																	in="${employeeStatementInstance.getBuPointsLines()}">
																	<tr>
																		<td>
																			${it.description}
																		</td>
																		<td>
																			${it.unitAmount}
																		</td>
																		<td>
																			${it.operationsAmount}
																		</td>
																		<td>
																			${it.amount}
																		</td>
																	</tr>
																</g:each>


																<tr>
																	<td colspan="3">Total</td>
																	<td><g:fieldValue
																			bean="${employeeStatementInstance}"
																			field="pointsSubtotal" /></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										<!-- End .panel -->
										<!-- End totales de ountos -->
										<!-- Incentivos -->
										<div class="plano_negro col-lg-12">
											<div class="plano_negro panel panel-default">
												<div class="plano_negro panel-heading">
													<h4>Incentivos</h4>
													<a href="#" class="plano_negro minimize" style="display: none;">Minimize</a>
												</div>
												<div class="plano_negro panel-body noPad" style="display: block;">
													<div class="plano_negro responsive" tabindex="5007"
														style="overflow: hidden; outline: none;">
														<table class="plano_negro table">
															<thead>
																<tr>
																	<th>Descripción</th>
																	<th>Valor</th>
																	<th>Cantidad/%</th>
																	<th>Total</th>
																</tr>
															</thead>
															<tbody>
																<g:each
																	in="${employeeStatementInstance.getBuIncentivesLines()}">
																	<tr>
																		<td>
																			${it.description}
																		</td>
																		<td>
																			${it.unitAmount}
																		</td>
																		<td>
																			${it.operationsAmount}
																		</td>
																		<td>
																			${it.amount}
																		</td>
																	</tr>
																</g:each>
														</table>
													</div>
												</div>
											</div>
										</div>
										<!-- End Incentivos -->

									</div>
									<!-- Employee -->
									<div>

										<h4>Detalle de la liquidación del Empleado</h4>

										<div class="plano_negro col-lg-12">
											<div class="plano_negro panel panel-default">
												<div class="plano_negro panel-heading">
													<h4>Altas</h4>
												</div>
												<div class="plano_negro panel-body noPad" style="display: block;">
													<div class="plano_negro responsive" tabindex="5006"
														style="overflow: hidden; outline: none;"></div>
												</div>
												<div class="plano_negro panel-body noPad" style="display: block;">
													<div class="plano_negro responsive" tabindex="5007"
														style="overflow: hidden; outline: none;">
														<table class="plano_negro table">
															<thead>
																<tr>
																	<th>Descripción</th>
																	<th>Valor</th>
																	<th>Cantidad/%</th>
																	<th>Total</th>
																</tr>
															</thead>
															<tbody>
																<g:each
																	in="${employeeStatementInstance.getEmpSalesLines()}">
																	<tr>
																		<td>
																			${it.description}
																		</td>
																		<td>
																			${it.unitAmount}
																		</td>
																		<td>
																			${it.operationsAmount}
																		</td>
																		<td>
																			${it.amount}
																		</td>
																	</tr>
																</g:each>
														</table>
													</div>
												</div>
											</div>
											<div class="plano_negro panel panel-default">
												<div class="plano_negro panel-heading">
													<h4>Incentivos Individuales</h4>
													<a href="#" class="plano_negro minimize" style="display: none;">Minimize</a>
												</div>
												<div class="plano_negro panel-body noPad" style="display: block;">
													<div class="plano_negro responsive" tabindex="5006"
														style="overflow: hidden; outline: none;"></div>
												</div>
												<div class="plano_negro panel-body noPad" style="display: block;">
													<div class="plano_negro responsive" tabindex="5007"
														style="overflow: hidden; outline: none;">
														<table class="plano_negro table">
															<thead>
																<tr>
																	<th>Descripción</th>
																	<th>Valor</th>
																	<th>Cantidad/%</th>
																	<th>Total</th>
																</tr>
															</thead>
															<tbody>
																<g:each
																	in="${employeeStatementInstance.getEmpIncentivesLines()}">
																	<tr>
																		<td>
																			${it.description}
																		</td>
																		<td>
																			${it.unitAmount}
																		</td>
																		<td>
																			${it.operationsAmount}
																		</td>
																		<td>
																			${it.amount}
																		</td>
																	</tr>
																</g:each>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="plano_negro col-lg-12">
									<div class="plano_negro panel panel-default">
										<div class="plano_negro panel-heading">
											<h4>Descuentos</h4>
											<a href="#" class="plano_negro minimize" style="display: none;">Minimize</a>
										</div>
										<div class="plano_negro panel-body noPad" style="display: block;">
											<div class="plano_negro responsive" tabindex="5006"
												style="overflow: hidden; outline: none;"></div>
										</div>
										<div class="plano_negro panel-body noPad" style="display: block;">
											<div class="plano_negro responsive" tabindex="5007"
												style="overflow: hidden; outline: none;">
												<table class="plano_negro table">
													<thead>
														<tr>
															<th>Descripción</th>
															<th>Valor</th>
															<th>Cantidad/%</th>
															<th>Total</th>
														</tr>
													</thead>
													<tbody>
														<g:each in="${employeeStatementInstance.getEmpDedLines()}">
															<tr>
																<td>
																	${it.description}
																</td>
																<td>
																	${it.unitAmount}
																</td>
																<td>
																	${it.operationsAmount}
																</td>
																<td>
																	${it.amount}
																</td>
															</tr>
														</g:each>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
