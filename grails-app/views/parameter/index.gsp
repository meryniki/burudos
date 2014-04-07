<%@ page import="ar.com.burudos.sales.statement.Parameter"%>
<%@ page import="ar.com.burudos.sales.statement.StatementLine"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'parameter.label', default: 'Parameter')}" />

<title><g:message code="parameter.label" args="[entityName]" /></title>
</head>
<body>
	<div id="content" class="clearfix">
		<div class="contentwrapper">
			<div class="heading">
				<h3>
					<g:message code="parameter.btnLabel" args="[entityName]" />
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
					<li class="active"><g:message code="parameter.list.label"
							args="[entityName]" /></li>
				</ul>
			</div>
			<ul class="bigBtnIcon">
				<li><g:link class="create" action="create">
						<span class="icon icomoon-icon-plus"></span>
						<g:message code="default.new.label" args="[entityName]" />
					</g:link></li>
			</ul>
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${parameterInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${parameterInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<div id="list-parameter" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>

				<g:if test="${parameterInstanceCount == 0}">
					<h4>No hay registros</h4>
				</g:if>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default gradient">
							<div class="panel-heading">
								<h4>
									<span><g:message code="parameter.list.label"
											args="[entityName]" /></span>
								</h4>
							</div>
							<div class="panel-body noPad clearfix">
								<div class="responsive" tabindex="5001"
									style="overflow: hidden; outline: none;">
									<div id="DataTables_Table_1_wrapper"
										class="dataTables_wrapper form-inline" role="grid">
										<div class="row">
											<div class="col-lg-12">
												<div class="dataTables_filter"
													id="DataTables_Table_1_filter">
													<label> <span class="icon16 icomoon-icon-search"></span>
														<input id="search" style="width: 75%;" type="text"
														aria-controls="DataTables_Table_1" class="form-control"
														value="${mapsearch["search"]}" autofocus>
													</label>
												</div>
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
														property="paramCode"
														title="${message(code: 'parameter.paramCode.label', default: 'Param Code')}" />

													<g:sortableColumn params="${mapsearch}" property="minValue"
														title="${message(code: 'parameter.businessUnit.label', default: 'Level')}" />

													<g:sortableColumn params="${mapsearch}"
														property="paramCategory"
														title="${message(code: 'parameter.paramCategory.label', default: 'Param Category')}" />

													<g:sortableColumn params="${mapsearch}"
														property="paramGroup"
														title="${message(code: 'parameter.paramGroup.label', default: 'Param Group')}" />

													<g:sortableColumn params="${mapsearch}"
														property="paramDescription"
														title="${message(code: 'parameter.paramDescription.label', default: 'Param Description')}" />

													<g:sortableColumn params="${mapsearch}" property="maxValue"
														title="${message(code: 'parameter.maxValue.label', default: 'Max Value')}" />

													<g:sortableColumn params="${mapsearch}" property="minValue"
														title="${message(code: 'parameter.minValue.label', default: 'Min Value')}" />
												</tr>
											</thead>
											<!-- Pie con titulos-->
											<tfoot>
												<tr>
													<th rowspan="1" colspan="1"><g:message
															code="parameter.paramCode.label" default="Param Code" /></th>
													<th rowspan="1" colspan="1"><g:message
															code="parameter.businessUnit.label" default="Level" /></th>
													<th rowspan="1" colspan="1"><g:message
															code="parameter.paramCategory.label" default="Param Cat" /></th>
													<th rowspan="1" colspan="1"><g:message
															code="parameter.paramGroup.label" default="Param Group" /></th>
													<th rowspan="1" colspan="1"><g:message
															code="parameter.paramDescription.label" default="Param" /></th>
													<th rowspan="1" colspan="1"><g:message
															code="parameter.maxValue.label" default="Max Value" /></th>
													<th rowspan="1" colspan="1"><g:message
															code="parameter.minValue.label" default="Min Value" /></th>
												</tr>
											</tfoot>
											<!--Data-->
											<tbody role="alert" aria-live="polite" aria-relevant="all">
												<g:each in="${parameterInstanceList}" status="i"
													var="parameterInstance">
													<tr
														class="${(i % 2) == 0 ? 'even' : 'odd'} ${fieldValue(bean: parameterInstance, field: active) ? ' active' : ' inactive'}">

														<td><g:link action="show"
																id="${parameterInstance.id}">
																${fieldValue(bean: parameterInstance, field: "paramCode")}
															</g:link></td>

														<td><g:link action="show" controller="bussinesUnit"
																id="${parameterInstance.bussinesUnit.id}">
																${fieldValue(bean: parameterInstance, field: "bussinesUnit")}
															</g:link></td>

														<td>
															${message(code: fieldValue(bean: parameterInstance, field: "paramCategory"))}
														</td>

														<td>
															${fieldValue(bean: parameterInstance, field: "paramGroup")}
														</td>

														<td>
															${fieldValue(bean: parameterInstance, field: "paramDescription")}
														</td>

														<td>
															${fieldValue(bean: parameterInstance, field: "maxValue")}
														</td>

														<td>
															${fieldValue(bean: parameterInstance, field: "minValue")}
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
																total="${parameterInstanceCount ?: 0}" /></li>
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