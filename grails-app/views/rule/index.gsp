<%@ page import="ar.com.burucps.drools.Rule"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">

<g:set var="entityName"
	value="${message(code: 'rule.label', default: 'Rule')}" />

<title><g:message code="rule.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="content" class="clearfix">
		<div class="contentwrapper">
			<div class="heading">
				<h3>
					<g:message code="rule.btnLabel" args="[entityName]" />
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
					<li class="active"><g:message code="rule.list.label"
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
			<g:hasErrors bean="${ruleInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${ruleInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<div id="list-rule" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default gradient">
							<div class="panel-heading">
								<h4>
									<span><g:message code="rule.list.label"
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
										<table id="thetable" cellpadding="0" cellspacing="0"
											border="0"
											class="tableTools display table table-bordered dataTable"
											width="100%" id="DataTables_Table_1"
											aria-describedby="DataTables_Table_1_info">
											<!--Titulos con posibilidad de ordenar por-->
											<thead>
												<tr role="row">

													<g:sortableColumn property="ruleName" params="${mapsearch}"
														title="${message(code: 'rule.ruleName.label', default: 'Rule Name')}" />

													<g:sortableColumn property="salience" params="${mapsearch}"
														title="${message(code: 'rule.salience.label', default: 'Salience')}" />

													<g:sortableColumn property="ruleGroup"
														params="${mapsearch}"
														title="${message(code: 'rule.ruleGroup.label', default: 'Rule Group')}" />

													<th><g:message code="rule.active.label"
															default="Active" /></th>
												</tr>
											</thead>
											<!-- Pie con titulos-->
											<tfoot>
												<tr role="row">
													<th rowspan="1" colspan="1"><g:message
															code="rule.ruleName.label" default="Rule Name" /></th>
													<th rowspan="1" colspan="1"><g:message
															code="rule.salience.label" default="Salience" />
													<th rowspan="1" colspan="1"><g:message
															code="rule.ruleGroup.label" default="Rule Group" /></th>
													<th rowspan="1" colspan="1"><g:message
															code="rule.active.label" default="Active" /></th>

												</tr>
											</tfoot>
											<tbody role="alert" aria-live="polite" aria-relevant="all">
												<g:each in="${ruleInstanceList}" status="i"
													var="ruleInstance">
													<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

														<td><g:link action="show" id="${ruleInstance.id}">
																${fieldValue(bean: ruleInstance, field: "ruleName")}
															</g:link></td>

														<td>
															${fieldValue(bean: ruleInstance, field: "salience")}
														</td>

														<td>
															${g.message(code: fieldValue(bean: ruleInstance, field: "ruleGroup"))}
														</td>

														<td>
															${fieldValue(bean: ruleInstance, field: "active")}
														</td>

													</tr>
												</g:each>
											</tbody>
										</table>
										<div class="row">
											<div class="col-lg-8">
												<div class="dataTables_paginate paging_bootstrap pagination">
													<div class="pagination">
														<g:paginate total="${ruleInstanceCount ?: 0}" />
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
