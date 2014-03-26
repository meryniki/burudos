<%@ page import="ar.com.burudos.party.Employee"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'employee.label', default: 'Employee')}" />
<title><g:message code="employee.btnLabel" args="[entityName]" /></title>
</head>
<body>
	<div id="content" class="clearfix">
		<div class="contentwrapper">
			<div class="heading">

				<h3>
					<g:message code="employee.btnLabel" args="[entityName]" />
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
					<li class="active"><g:message code="employee.list.label"
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

			<div id="list-employee" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<g:hasErrors bean="${employeeInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${employeeInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</g:hasErrors>

				<g:if test="${employeeInstanceCount == 0}">
					<h4>No hay registros</h4>
				</g:if>
				<g:if test="${employeeInstanceCount != 0}">
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default gradient">
								<div class="panel-heading">
									<h4>
										<span><g:message code="employee.list.label"
												args="[entityName]" /></span>
									</h4>
								</div>
								<div class="panel-body noPad clearfix">
									<div class="responsive" tabindex="5001"
										style="overflow: hidden; outline: none;">
										<div id="DataTables_Table_1_wrapper"
											class="dataTables_wrapper form-inline" role="grid">
											<div class="row">
												<div class="col-lg-4">
													<div id="DataTables_Table_1_length"
														class="dataTables_length">
														<label> Lineas por pagina<span>
																<div class="selector" style="width: 25% !important;">
																	<span style="-webkit-user-select: none;">20</span> <select
																		size="1" name="max" aria-controls="DataTables_Table_1">
																		<option value="10">10</option>
																		<option value="20" selected="selected">20</option>
																		<option value="25">25</option>
																		<option value="50">50</option>
																		<option value="100">100</option>
																	</select>
																</div>
														</span>
														</label>
													</div>
												</div>
												<div class="col-lg-4">
													<div class="DTTT_container">
														<a class="DTTT_button DTTT_button_copy"
															id="ToolTables_DataTables_Table_1_0"> <span>Copy</span>

														</a> <a class="DTTT_button DTTT_button_print"
															id="ToolTables_DataTables_Table_1_1"
															title="View print view"> <span>Print</span>
														</a> <a class="DTTT_button DTTT_button_collection"
															id="ToolTables_DataTables_Table_1_2"> <span>Save
																<span class="caret"> </span>
														</span>
														</a>
													</div>
												</div>
												<div class="col-lg-4">
													<div class="dataTables_filter"
														id="DataTables_Table_1_filter">
														<label> <span class="icon16 icomoon-icon-search"></span>
															<input style="width: 75%;" type="text"
															aria-controls="DataTables_Table_1" class="form-control">
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
														<g:sortableColumn property="uid"
															title="${message(code: 'employee.uid.label', default: 'Uid')}" />
														<g:sortableColumn property="name"
															title="${message(code: 'employee.name.label', default: 'Name')}" />

														<g:sortableColumn property="legajo"
															title="${message(code: 'employee.legajo.label', default: 'Employee Number')}" />

														<th><g:message code="employee.bu.label" default="Bu" /></th>
													</tr>
												</thead>
												<!-- Pie con titulos-->
												<tfoot>
													<tr>
														<th rowspan="1" colspan="1"><g:message
																code="employee.uid.label" default="Uid" /></th>
														<th rowspan="1" colspan="1"><g:message
																code="employee.name.label" default="Nombre" /></th>
														<th rowspan="1" colspan="1"><g:message
																code="employee.legajo.label" default="Legajo" /></th>
														<th rowspan="1" colspan="1"><g:message
																code="employee.bu.label" default="Bu" /></th>
													</tr>
												</tfoot>
												<!--Data-->
												<tbody role="alert" aria-live="polite" aria-relevant="all">
													<g:each in="${employeeInstanceList}" status="i"
														var="employeeInstance">
														<tr class="gradeA ${(i % 2) == 0 ? 'even' : 'odd'}">

															<td class=" "><g:link action="show"
																	id="${employeeInstance.id}">
																	${fieldValue(bean: employeeInstance, field: "uid")}
																</g:link></td>

															<td class=" ">
																${fieldValue(bean: employeeInstance, field: "name")}
															</td>

															<td class=" ">
																${fieldValue(bean: employeeInstance, field: "legajo")}
															</td>

															<td class=" ">
																${fieldValue(bean: employeeInstance, field: "bu")}
															</td>
														</tr>
													</g:each>
												</tbody>

											</table>
											<div class="row">
												<div class="col-lg-8">
													<div
														class="dataTables_paginate paging_bootstrap pagination">
														<ul class="pagination">
															<li><g:paginate
																	total="${employeeInstanceCount ?: 0}" /></li>
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
				</g:if>

			</div>
		</div>
	</div>
</body>
</html>
