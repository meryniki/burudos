
<%@ page import="ar.com.burudos.sales.statement.Statement"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'statement.label', default: 'Statement')}" />

<title><g:message code="statement.label" args="[entityName]" /></title>
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
					<li><a href="#" class="tip" oldtitle="back to dashboard"
						title="" data-hasqtip="true"> <span
							class="icon16 icomoon-icon-screen-2"></span>
					</a> <span class="divider"> <span
							class="icon16 icomoon-icon-arrow-right-3"></span>
					</span></li>
					<li class="active"><g:message code="statement.list.label"
							args="[entityName]" /></li>
				</ul>
			</div>
			<ul class="bigBtnIcon">
				<li><g:link class="create" action="process">
						<span class="icon icomoon-icon-calculate"></span>
						<g:message code="default.process.label" args="[entityName]" />
					</g:link></li>
			</ul>
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${statementInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${statementInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<div id="list-statement" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>

				<g:if test="${statementInstanceCount == 0}">
					<h4>No hay registros</h4>
				</g:if>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default gradient">
							<div class="panel-heading">
								<h4>
									<span><g:message code="statement.list.label"
											args="[entityName]" /></span>
								</h4>
							</div>
							<div class="panel-body noPad clearfix">
								<div class="responsive" tabindex="5001"
									style="overflow: hidden; outline: none;">
									<div id="DataTables_Table_1_wrapper"
										class="dataTables_wrapper form-inline" role="grid">
										<div class="row">
											<div class="col-lg-5">
												<div class="dataTables_filter"
													id="DataTables_Table_1_filter">
													<label> <span class="icon16 icomoon-icon-search"></span>
														<input id="search" style="width: 75%;" type="text"
														aria-controls="DataTables_Table_1" class="form-control"
														value="${mapsearch["search"]}" autofocus>
													</label>
												</div>
											</div>
											<div class="col-lg-7">
												<g:form>
													<div class="form-group">
														<g:datePicker id="month" name="month" precision="month"
															default="${defaultmonth}" value="${month}" />
													</div>
													<div class="form-group">
														<g:actionSubmit class="save btn btn-info" action="index"
															value="${message(code: 'default.button.search.label', default: 'Buscar')}" />
													</div>
												</g:form>
											</div>
										</div>
										<table id="thetable" cellpadding="0" cellspacing="0"
											border="0"
											class="tableTools display table table-bordered dataTable"
											width="100%" id="DataTables_Table_1"
											aria-describedby="DataTables_Table_1_info">
											<!--Titulos con posibilidad de ordenar por-->
											<thead>
												<tr role="row">
													<th><g:message code="statement.employee.label"
															default="Employee" /></th>
													<g:sortableColumn params="${mapsearch}"
														property="statementPeriod"
														title="${message(code: 'statement.statementPeriod.label', default: 'Statement Period')}" />
													<th><g:message code="statement.businessUnit.label"
															default="Business Unit" /></th>
													<th><g:message code="statement.total.label"
															default="Total" /></th>

												</tr>
											</thead>
											<!-- Pie con titulos-->
											<tfoot>
												<tr role="row">
													<th rowspan="1" colspan="1"><g:message
															code="statement.employee.label" default="Employee" /></th>
													<th rowspan="1" colspan="1"><g:message
															code="statement.statementPeriod.label"
															default="Statement Period" />
													<th rowspan="1" colspan="1"><g:message
															code="statement.businessUnit.label"
															default="Business Unit" /></th>
													<th rowspan="1" colspan="1"><g:message
															code="statement.total.label" default="Total" /></th>

												</tr>
											</tfoot>
											<tbody role="alert" aria-live="polite" aria-relevant="all">
												<g:each in="${employeeStatementInstanceList}" status="i"
													var="employeeStatementInstance">
													<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

														<td><g:link
																action="show"
																id="${employeeStatementInstance.id}">
																${fieldValue(bean: employeeStatementInstance, field: "employee.name")}
															</g:link></td>

														<td class=" "><g:formatDate format="yyyy/MM"
																date="${employeeStatementInstance.statementPeriod}" /></td>

														<td>
															${fieldValue(bean: employeeStatementInstance, field: "businessUnit")}
														</td>

														<td>
															${fieldValue(bean: employeeStatementInstance, field: "total")}
														</td>
													</tr>
												</g:each>
											</tbody>
										</table>
										<div class="row">
											<div class="col-lg-8">
												<div class="dataTables_paginate paging_bootstrap pagination">
													<ul class="pagination">
														<li><g:paginate
																total="${statementInstanceCount ?: 0}"
																params="${mapsearch}" /></li>
													</ul>
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
	<script type="text/javascript"
		src="../static/plugins/tables/dataTables/jquery.dataTables.js"></script>

	<script type="text/javascript">
		var isearch = document.getElementById("search");

		/* Add event listeners to the two range filtering inputs */
		isearch.addEventListener("change", function() {
			var vmax = document.getElementById("max");
			var voff = document.getElementById("offset");
			var vser = document.getElementById("search");
			var url = "./index?search=" + vser.value;
			if (vmax)
				url += "&max=" + vmax.value;
			if (voff)
				url += "&offset=" + voff.value;

			window.location.replace(url);
		});
	</script>
</body>
</html>
