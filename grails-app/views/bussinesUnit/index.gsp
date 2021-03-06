<%@ page import="ar.com.burudos.business.BussinesUnit"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'bussinesUnit.label', default: 'Business Unit')}" />
<title><g:message code="bussinesUnit.btnLabel"
		args="[entityName]" /></title>
</head>
<body>
	<div id="content" class="clearfix">
		<div class="contentwrapper">
			<div class="heading">

				<h3>
					<g:message code="bussinesUnit.btnLabel" args="[entityName]" />
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
					<li class="active"><g:message code="bussinesUnit.list.label"
							args="[entityName]" /></li>
				</ul>

			</div>

			<ul class="bigBtnIcon">
				<li><g:link class="create" action="create">
						<span class="icon icomoon-icon-plus"></span>
						<g:message code="default.new.label" args="[entityName]" />
					</g:link></li>
				<li><g:link class="create" action="upload">
						<span class="icon icomoon-icon-table"></span>
						<g:message code="default.upload.label" args="[entityName]" />
					</g:link></li>
			</ul>

			<div id="list-bussinesUnit" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<g:hasErrors bean="${bussinesUnitInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${bussinesUnitInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</g:hasErrors>

				<g:if test="${bussinesUnitInstanceCount == 0}">
					<h4>No hay registros</h4>
				</g:if>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default gradient">
							<div class="panel-heading">
								<h4>
									<span><g:message code="bussinesUnit.list.label"
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


											<thead>
												<tr role="row">
													<g:sortableColumn params="${mapsearch}" property="code"
														title="${message(code: 'bussinesUnit.code.label', default: 'Code')}" />
													<g:sortableColumn params="${mapsearch}" property="nombre"
														title="${message(code: 'bussinesUnit.name.label', default: 'Nombre')}" />
													<g:sortableColumn property="father"
														title="${message(code: 'bussinesUnit.father.label', default: 'Padre')}" />

													<g:sortableColumn params="${mapsearch}"
														property="provincia"
														title="${message(code: 'bussinesUnit.provincia.label', default: 'Provincia')}" />

													<g:sortableColumn params="${mapsearch}"
														property="departamento"
														title="${message(code: 'bussinesUnit.departamento.label', default: 'Departamento')}" />

													<g:sortableColumn params="${mapsearch}"
														property="localidad"
														title="${message(code: 'bussinesUnit.localidad.label', default: 'Localidad')}" />

													<g:sortableColumn params="${mapsearch}" property="calle"
														title="${message(code: 'bussinesUnit.calle.label', default: 'Calle')}" />
												</tr>
											</thead>
											<!-- Pie con titulos-->
											<tfoot>
												<tr>
													<th rowspan="1" colspan="1"><g:message
															code="bussinesUnit.code.label" default="Code" /></th>
													<th rowspan="1" colspan="1"><g:message
															code="bussinesUnit.name.label" default="Nombre" /></th>
													<th rowspan="1" colspan="1"><g:message
															code="bussinesUnit.father.label" default="Padre" /></th>
													<th rowspan="1" colspan="1"><g:message
															code="bussinesUnit.provincia.label" default="Provincia" /></th>
													<th rowspan="1" colspan="1"><g:message
															code="bussinesUnit.departamento.label"
															default="Departamento" /></th>
													<th rowspan="1" colspan="1"><g:message
															code="bussinesUnit.localidad.label" default="Localidad" /></th>
													<th rowspan="1" colspan="1"><g:message
															code="bussinesUnit.calle.label" default="Calle" /></th>

												</tr>
											</tfoot>
											<!--Data-->
											<tbody role="alert" aria-live="polite" aria-relevant="all">
												<g:each in="${bussinesUnitInstanceList}" status="i"
													var="bussinesUnitInstance">
													<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

														<td><g:link action="show"
																id="${bussinesUnitInstance.id}">
																${fieldValue(bean: bussinesUnitInstance, field: "code")}
															</g:link></td>

														<td>
															${fieldValue(bean: bussinesUnitInstance, field: "nombre")}
														</td>

														<td>
															${fieldValue(bean: bussinesUnitInstance, field: "father")}
														</td>

														<td>
															${fieldValue(bean: bussinesUnitInstance, field: "provincia")}
														</td>

														<td>
															${fieldValue(bean: bussinesUnitInstance, field: "departamento")}
														</td>

														<td>
															${fieldValue(bean: bussinesUnitInstance, field: "localidad")}
														</td>

														<td>
															${fieldValue(bean: bussinesUnitInstance, field: "calle")}
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
																total="${bussinesUnitInstanceCount ?: 0}"
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
