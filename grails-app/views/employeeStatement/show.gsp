<%@ page import="ar.com.burudos.sales.statement.EmployeeStatement"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">

<g:set var="entityName"
	value="${message(code: 'statement.label', default: 'Statement')}" />

<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<script type="text/javascript"
		src="../../static/plugins/misc/pnotify/jquery.pnotify.min.js"></script>
	<script language="javascript">
$( document ).ready( function() {
	$("a[rel='pop-up']").click(function () {
      	var caracteristicas = "height=400,width=400,scrollTo,resizable=1,scrollbars=0,location=0";
      	nueva=window.open(this.href, 'Editar/Borrar', caracteristicas);
      	return false;
 });
});
</script>

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

			<div class="row">

				<div class="col-lg-12">
					<div id="show-statement" class="content scaffold-show" role="main">
						<ul class="bigBtnIcon">
							<li><g:link class="show_printable" action="show_printable"
												controller="employeeStatement" resource="${employeeStatementInstance}" >
									<span class="icon icomoon-icon-print"></span>
									<g:message code="default.print.label" args="[entityName]" />
								</g:link></li>
						</ul>
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>
						<div class="panel panel-default">

							<div class="panel-body">

								<div id="statement-header" class="row statement-group">
									<div class="page-header">
										<h4>Liquidación</h4>
									</div>
									<div class="col-lg-8">
										<div class="row">
											<ul class="col-lg-12">

												<li><span class="blue col-lg-3"><g:message
															code="statement.statementPeriod.label" default="Periodo" /></span>
													<span
													class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
													class="col-lg-7"><g:formatDate format="yyyy/MM"
															date="${employeeStatementInstance.statementPeriod}" /></span></li>

												<li><span class="blue col-lg-3"><g:message
															code="statement.updateDate.label"
															default="Última Actualización" /></span> <span
													class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
													class="col-lg-7"><g:formatDate
															format="yyyy/MM/dd hh:mm"
															date="${employeeStatementInstance.lastUpdateDate}" /></span></li>

												<li><span class="blue col-lg-3"><g:message
															code="statement.statement.employee.label"
															default="Empleado" /></span> <span
													class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
													class="col-lg-7"> <g:link controller="employee"
															action="show"
															id="${employeeStatementInstance?.employee?.id}">
															${employeeStatementInstance?.employee?.encodeAsHTML()}
														</g:link></span></li>

												<li><span class="blue col-lg-3"><g:message
															code="statement.businessUnit.label"
															default="Punto de Venta" /></span> <span
													class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
													class="col-lg-7"><g:link controller="bussinesUnit"
															action="show"
															id="${employeeStatementInstance?.businessUnit?.id}">
															${employeeStatementInstance?.businessUnit?.encodeAsHTML()}
														</g:link></span></li>
											</ul>
										</div>
									</div>
									<div class="col-lg-4 statement-result">
										<div class="alert alert-info">
											Saldo a cobrar<br /> $
											<g:fieldValue bean="${employeeStatementInstance}"
												field="total" />
										</div>
									</div>
								</div>

								<!-- Objetivos -->
								<div class="col-lg-12">
									<div class="panel panel-default">
										<div class="panel-body noPad" style="display: block;">
											<div class="responsive" tabindex="5007"
												style="overflow: hidden; outline: none;">
												<table class="table alert alert-success">
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
																<td>
																	<div class="controls center">
																		<g:link class="edit" action="edit" rel="pop-up"
																			controller="statementLine" resource="${it}">
																			<span class="icon12 icomoon-icon-pencil"></span>
																		</g:link>
																		<g:link class="delete" action="delete" rel="pop-up"
																			controller="statementLine"
																			value="${message(code: 'default.button.delete.label', default: 'Delete')}"
																			resource="${it}"
																			onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
																			<span class="icon12 icomoon-icon-remove"></span>
																		</g:link>
																	</div>
																</td>
															</tr>
														</g:each>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="panel panel-default">
										<div class="panel-body noPad" style="display: block;">

											<div class="responsive" tabindex="5007"
												style="overflow: hidden; outline: none;">
												<table class="table">
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
																<td>
																	<div class="controls center">
																		<g:link class="edit" action="edit" rel="pop-up"
																			controller="statementLine" resource="${it}">
																			<span class="icon12 icomoon-icon-pencil"></span>
																		</g:link>
																		<g:link class="delete" action="delete" rel="pop-up"
																			controller="statementLine"
																			value="${message(code: 'default.button.delete.label', default: 'Delete')}"
																			resource="${it}"
																			onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
																			<span class="icon12 icomoon-icon-remove"></span>
																		</g:link>
																	</div>
																</td>
															</tr>
														</g:each>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>



								<div class="row statement-group">
									<div class="page-header">

										<h4>Detalle de la liquidación del Punto de Venta</h4>


										<div class="tab content">
											<div id="pos-tab" class="tab-pane fade active in">
												<div class="col-lg-12">
													<div class="panel panel-default">
														<div class="panel-heading">
															<h4>
																<span>Operaciones Comerciales de Postventa</span>
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
																				<td>
																					<div class="controls center">
																						<g:link class="edit" action="edit" rel="pop-up"
																							controller="statementLine" resource="${it}">
																							<span class="icon12 icomoon-icon-pencil"></span>
																						</g:link>
																						<g:link class="delete" action="delete"
																							rel="pop-up" controller="statementLine"
																							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
																							resource="${it}"
																							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
																							<span class="icon12 icomoon-icon-remove"></span>
																						</g:link>
																					</div>
																				</td>
																			</tr>
																		</g:each>


																		<tr>
																			<td colspan="3">Total</td>
																			<td><g:fieldValue
																					bean="${employeeStatementInstance}"
																					field="pointsSubtotal" /></td>
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
																			<th>Actions</th>
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
																				<td>
																					<div class="controls center">
																						<g:link class="edit" action="edit" rel="pop-up"
																							controller="statementLine" resource="${it}">
																							<span class="icon12 icomoon-icon-pencil"></span>
																						</g:link>
																						<g:link class="delete" action="delete"
																							rel="pop-up" controller="statementLine"
																							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
																							resource="${it}"
																							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
																							<span class="icon12 icomoon-icon-remove"></span>
																						</g:link>
																					</div>
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

												<div class="col-lg-12">
													<div class="panel panel-default">
														<div class="panel-heading">
															<h4>Altas</h4>
														</div>
														<div class="panel-body noPad" style="display: block;">
															<div class="responsive" tabindex="5006"
																style="overflow: hidden; outline: none;"></div>
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
																			<th>Actions</th>
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
																				<td>
																					<div class="controls center">
																						<g:link class="edit" action="edit" rel="pop-up"
																							controller="statementLine" resource="${it}">
																							<span class="icon12 icomoon-icon-pencil"></span>
																						</g:link>
																						<g:link class="delete" action="delete"
																							rel="pop-up" controller="statementLine"
																							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
																							resource="${it}"
																							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
																							<span class="icon12 icomoon-icon-remove"></span>
																						</g:link>
																					</div>
																				</td>
																			</tr>
																		</g:each>
																</table>
															</div>
														</div>
													</div>
													<div class="panel panel-default">
														<div class="panel-heading">
															<h4>Incentivos Individuales</h4>
															<a href="#" class="minimize" style="display: none;">Minimize</a>
														</div>
														<div class="panel-body noPad" style="display: block;">
															<div class="responsive" tabindex="5006"
																style="overflow: hidden; outline: none;"></div>
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
																			<th>Actions</th>
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
																				<td>
																					<div class="controls center">
																						<g:link class="edit" action="edit" rel="pop-up"
																							controller="statementLine" resource="${it}">
																							<span class="icon12 icomoon-icon-pencil"></span>
																						</g:link>
																						<g:link class="delete" action="delete"
																							controller="statementLine"
																							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
																							resource="${it}" rel="pop-up"
																							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
																							<span class="icon12 icomoon-icon-remove"></span>
																						</g:link>
																					</div>
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

										<div class="col-lg-12">
											<div class="panel panel-default">
												<div class="panel-heading">
													<h4>Descuentos</h4>
													<a href="#" class="minimize" style="display: none;">Minimize</a>
												</div>
												<div class="panel-body noPad" style="display: block;">
													<div class="responsive" tabindex="5006"
														style="overflow: hidden; outline: none;"></div>
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
																	<th>Actions</th>
																</tr>
															</thead>
															<tbody>
																<g:each
																	in="${employeeStatementInstance.getEmpDedLines()}">
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
																		<td>
																			<div class="controls center">
																				<g:link class="edit" action="edit"
																					controller="statementLine" resource="${it}">
																					<span class="icon12 icomoon-icon-pencil"></span>
																				</g:link>
																				<g:link class="delete" action="delete"
																					controller="statementLine"
																					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
																					resource="${it}"
																					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
																					<span class="icon12 icomoon-icon-remove"></span>
																				</g:link>
																			</div>
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
		</div>
	</div>
</body>
</html>