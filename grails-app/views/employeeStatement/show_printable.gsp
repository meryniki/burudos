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
			<div id="show-statement" class="plano_negro" role="main">
				<div class="plano_negro panel panel-default">
					<div class="plano_negro panel-body">
						<div id="statement-header" class="plano_negro row statement-group">
							<h4>
								<span class="plano_negro col-lg-7"> ${employeeStatementInstance?.employee?.encodeAsHTML()}
								</span>
							</h4>
							<table class="printable_titulo">
								<td>
									<ul class="plano_negro">

										<li><span class="plano_negro blue col-lg-4"><g:message
													code="statement.statementPeriod.label" default="Periodo" />:</span><span
											class="plano_negro col-lg-7"><g:formatDate
													format="yyyy/MM"
													date="${employeeStatementInstance.statementPeriod}" /></span></li>

										<li><span class="plano_negro blue col-lg-4"><g:message
													code="statement.updateDate.label"
													default="Última Actualización" />:</span><span
											class="plano_negro col-lg-7"><g:formatDate
													format="yyyy/MM/dd hh:mm"
													date="${employeeStatementInstance.lastUpdateDate}" /></span></li>

										<li><span class="plano_negro blue col-lg-4"><g:message
													code="statement.businessUnit.label"
													default="Punto de Venta" />:</span><span
											class="plano_negro col-lg-7"> ${employeeStatementInstance?.businessUnit?.encodeAsHTML()}
										</span></li>
									</ul>
								</td>
								<td>
									<div class="plano_negro statement-result">
										<div class="plano_negro alert alert-info">
											Saldo a cobrar<br /> $
											<g:fieldValue bean="${employeeStatementInstance}"
												field="total" />
										</div>
									</div>
								</td>
							</table>
						</div>
						</br>
						<div class="plano_negro">
							<table class="plano_negro printable">
								<thead>
									<tr>
										<th>Premio Postventa</th>
										<th>Puntaje Objetivo</th>
										<th>% Alcanzado</th>
										<th>Comision</th>
									</tr>
								</thead>
								<tbody>
									<g:each in="${employeeStatementInstance.getBuObjPointsLines()}">
										<tr>
											<td>
												${it.description}
											</td>
											<td><g:formatNumber number="${it.unitAmount}"
													type="number" minIntegerDigits="1" maxFractionDigits="0" /></td>
											<td><g:formatNumber
													number="${employeeStatementInstance.pointsObjPerc}"
													type="number" minIntegerDigits="1" maxFractionDigits="2" /></td>
											<td><g:formatNumber number="${it.amount}" type="number"
													minIntegerDigits="1" maxFractionDigits="2" /></td>

										</tr>
									</g:each>
								</tbody>
							</table>
						</div>
						<br />
						<div class="plano_negro panel panel-default">
							<table class="plano_negro printable">
								<thead>
									<tr>
										<th>Altas</th>
										<th>Valor</th>
										<th>Cantidad/%</th>
										<th>Total</th>
									</tr>
								</thead>
								<tbody>
									<g:each in="${employeeStatementInstance.getEmpSalesLines()}">
										<g:if test="${it.amount!=0}">
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
										</g:if>
									</g:each>
									<tr>
										<td colspan="3">Total</td>
										<td><g:fieldValue bean="${employeeStatementInstance}"
												field="stalesSubtotal" /></td>
									</tr>
							</table>
						</div>
						<br />
						<div class="plano_negro">
							<table class="plano_negro printable">
								<thead>
									<tr>
										<th>Objetivos de Operaciones</th>
										<th>Q Punto de Venta</th>
										<th>Q Empleado</th>
										<th>Q alcanzado</th>
										<th>%</th>
									</tr>
								</thead>
								<tbody>
									<g:each in="${employeeStatementInstance.getBuObjQLines()}">
										<tr>
											<td>
												${it.description}
											</td>
											<td><g:formatNumber number="${it.unitAmount}"
													type="number" minIntegerDigits="1" maxFractionDigits="0" /></td>
											<td><g:formatNumber number="${it.operationsAmount}"
													type="number" minIntegerDigits="1" maxFractionDigits="0" /></td>
											<td><g:formatNumber number="${it.amount}" type="number"
													minIntegerDigits="1" maxFractionDigits="0" /></td>
											<td><g:formatNumber
													number="${it.amount/it.operationsAmount*100}" type="number"
													minIntegerDigits="2" maxFractionDigits="0" /></td>
										</tr>
									</g:each>
								</tbody>
							</table>
						</div>

						<br />

						<div class="plano_negro">
							<table class="plano_negro printable" id="checkAll">
								<thead>
									<tr>
										<th>Operaciones comerciales del Punto de Venta</th>
										<th>Pts. / operación</th>
										<th># operaciones</th>
										<th>Total</th>
									</tr>
								</thead>
								<tbody>
									<g:each in="${employeeStatementInstance.getBuPointsLines()}">
										<g:if test="${it.amount!=0}">
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
										</g:if>
									</g:each>


									<tr>
										<td colspan="3">Total</td>
										<td><g:fieldValue bean="${employeeStatementInstance}"
												field="pointsSubtotal" /></td>
									</tr>
								</tbody>
							</table>
						</div>
						<br />
						<div class="plano_negro panel panel-default">
							<table class="plano_negro printable">
								<thead>
									<tr>
										<th>Incentivos</th>
										<th>Valor</th>
										<th>Cantidad/%</th>
										<th>Total</th>
									</tr>
								</thead>
								<tbody>
									<g:each
										in="${employeeStatementInstance.getBuIncentivesLines()}">
										<g:if test="${it.amount!=0}">
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
										</g:if>
									</g:each>

									<tr>
										<td colspan="3">Total</td>
										<td><g:fieldValue bean="${employeeStatementInstance}"
												field="posIncentSubtotal" /></td>
									</tr>
							</table>
						</div>
						<br />
						<div class="plano_negro panel panel-default">
							<table class="plano_negro printable">
								<thead>
									<tr>
										<th>Incentivos Individuales</th>
										<th>Valor</th>
										<th>Cantidad/%</th>
										<th>Total</th>
									</tr>
								</thead>
								<tbody>
									<g:each
										in="${employeeStatementInstance.getEmpIncentivesLines()}">
										<g:if test="${it.amount!=0}">
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
										</g:if>
									</g:each>
									<tr>
										<td colspan="3">Total</td>
										<td><g:fieldValue bean="${employeeStatementInstance}"
												field="indIncentSubtotal" /></td>
									</tr>
							</table>
						</div>
						<br />
						<div class="plano_negro panel panel-default">
							<table class="plano_negro printable">
								<thead>
									<tr>
										<th>Descuentos</th>
										<th>Valor</th>
										<th>Cantidad/%</th>
										<th>Total</th>
									</tr>
								</thead>
								<tbody>
									<g:each in="${employeeStatementInstance.getEmpDedLines()}">
										<g:if test="${it.amount!=0}">
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
										</g:if>
									</g:each>
									<tr>
										<td colspan="3">Total</td>
										<td><g:fieldValue bean="${employeeStatementInstance}"
												field="deductionsSubtotal" /></td>
									</tr>
							</table>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
<r:layoutResources />
</html>
