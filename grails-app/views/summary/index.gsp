
<%@ page import="ar.com.burudos.sales.Summary"%>

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'summary.label', default: 'summary')}" />
<title><g:message code="summary.btnLabel" args="[entityName]" /></title>
</head>
<body>
	<div id="content" class="clearfix">
		<div class="contentwrapper">
			<div class="heading">

				<h3>
					<g:message code="summary.btnLabel" args="[entityName]" />
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
					<li class="active"><g:message code="summary.list.label"
							args="[entityName]" /></li>
				</ul>

			</div>

			<ul class="bigBtnIcon">
				<li><g:link controller="filter" class="create" action="create">
						<span class="icon icomoon-icon-plus-circle"></span>
						<g:message code="filter.new.label" args="[entityName]" />
					</g:link></li>
				<li><g:link controller="filter" class="index" action="index">
						<span class="icon icomoon-icon-list"></span>
						<g:message code="filter.list.label" args="[entityName]" />
					</g:link></li>
				<li></li>
				<li></li>
				<li></li>
				<li><g:link class="create" action="create">
						<span class="icon icomoon-icon-plus"></span>
						<g:message code="default.new.label" args="[entityName]" />
					</g:link></li>
				<li><g:link class="domonthly" action="domonthly">
						<span class="icon icomoon-icon-calculate-2"></span>
						<g:message code="summary.domonthly.label" args="[entityName]" />
					</g:link></li>
				<li><g:link class="create" action="upload">
						<span class="icon icomoon-icon-table"></span>
						<g:message code="default.upload.label" args="[entityName]" />
					</g:link></li>
			</ul>
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${summaryInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${summaryInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors>

			<div id="list-summary" class="content scaffold-list" role="main">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default gradient">
							<div class="panel-heading">
								<h4>
									<span><g:message code="summary.list.label"
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
													<input id="employeeorbu" type="hidden"
														value="${mapsearch["employeeorbu"]}">
														<input id="search" style="width: 75%;" type="text"
														aria-controls="DataTables_Table_1" class="form-control"
														value="${mapsearch["search"]}" autofocus>
													</label>
												</div>
											</div>
											<div class="col-lg-7">
												<g:form>
													<div class="form-group">
														<g:datePicker id="month" name="sumMonth" precision="month"
															default="${defaultmonth}" value="${month}" />
													</div>
													<div class="form-group">
														<g:actionSubmit class="save btn btn-info" action="index"
															params="${mapsearch}"
															value="${message(code: 'default.button.search.label', default: 'Buscar')}" />
													</div>
												</g:form>
											</div>

										</div>
										<table cellpadding="0" cellspacing="0" border="0"
											class="tableTools display table table-bordered dataTable"
											width="100%" id="DataTables_Table_1"
											aria-describedby="DataTables_Table_1_info">

											<!--Titulos con posibilidad de ordenar por-->
											<thead>
												<tr role="row">
													<g:sortableColumn params="${mapsearch}"
														property="summaryCode"
														title="${message(code: 'summary.summaryCode.label', default: 'Codigo')}" />
													<g:sortableColumn params="${mapsearch}" property="name"
														title="${message(code: 'summary.date.label', default: 'Fecha')}" />
													<g:if test="${mapsearch["employeeorbu"]=='2'}">
														<g:sortableColumn params="${mapsearch}" property="bu"
															title="${message(code: 'summary.bu.label', default: 'Punto de Venta')}" />
													</g:if>
													<g:else>
														<g:sortableColumn params="${mapsearch}"
															property="employee"
															title="${message(code: 'summary.employee.label', default: 'Empleado')}" />
													</g:else>
													<g:sortableColumn params="${mapsearch}" property="quantity"
														title="${message(code: 'summary.quantity.label', default: 'Total')}" />
												</tr>
											</thead>
											<!-- Pie con titulos-->
											<tfoot>
												<tr>
													<th rowspan="1" colspan="1"><g:message
															code="summary.summaryCode.label" default="Codigo" /></th>
													<th rowspan="1" colspan="1"><g:message
															code="summary.date.label" default="Fecha" /></th>
													<g:if test="${mapsearch["employeeorbu"]=='2'}">
														<th rowspan="1" colspan="1"><g:message
																code="summary.bu.label" default="Punto de Venta" /></th>
													</g:if>
													<g:else>
														<th rowspan="1" colspan="1"><g:message
																code="summary.employee.label" default="Empleado" /></th>
													</g:else>
													<th rowspan="1" colspan="1"><g:message
															code="summary.quantity.label" default="Total" /></th>
												</tr>
											</tfoot>
											<!--Data-->
											<tbody role="alert" aria-live="polite" aria-relevant="all">
												<g:each in="${summaryInstanceList}" status="i"
													var="summaryInstance">
													<tr class="gradeA ${(i % 2) == 0 ? 'even' : 'odd'}">

														<td><g:link action="show" id="${summaryInstance.id}">
																${fieldValue(bean: summaryInstance, field: "summaryCode")}
															</g:link></td>

														<td class=" "><g:formatDate format="yyyy/MM"
																date="${summaryInstance.sumMonth}" /></td>
														<g:if test="${mapsearch["employeeorbu"]=='2'}">
															<td class=" ">
																${fieldValue(bean: summaryInstance, field: "bu")}
															</td>
														</g:if>
														<g:else>
															<td class=" ">
																${fieldValue(bean: summaryInstance, field: "employee")}
															</td>
														</g:else>
														<td class=" ">
															${fieldValue(bean: summaryInstance, field: "quantity")}
														</td>
													</tr>
												</g:each>
											</tbody>

										</table>
										<div class="row">
											<div class="col-lg-12">
												<div class="dataTables_paginate paging_bootstrap pagination">
													<ul class="pagination">
														<li><g:paginate total="${summaryInstanceCount ?: 0}"
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
			var vbu = document.getElementById("employeeorbu");
			var vser = document.getElementById("search");
			var url = "./index?search=" + vser.value;
			if (vmax)
				url += "&max=" + vmax.value;
			if (voff)
				url += "&offset=" + voff.value;
			if (vbu)
				url += "&employeeorbu=" + vbu.value;

			window.location.replace(url);
		});
	</script>
</body>
</html>
