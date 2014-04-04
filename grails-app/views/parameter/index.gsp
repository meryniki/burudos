<%@ page import="ar.com.burudos.sales.statement.Parameter"%>
<%@ page import="ar.com.burudos.sales.statement.StatementLine"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'parameter.label', default: 'Parameter')}" />

<title><g:message code="parameter.list.label"
		args="[entityName]" /></title>
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
				<h1>
					<g:message code="paramerter.list.label" args="[entityName]" />
				</h1>
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<table>
					<thead>
						<tr>

							<g:sortableColumn property="paramCode"
								title="${message(code: 'parameter.paramCode.label', default: 'Param Code')}" />

							<g:sortableColumn property="paramCategory"
								title="${message(code: 'parameter.paramCategory.label', default: 'Param Category')}" />

							<g:sortableColumn property="paramGroup"
								title="${message(code: 'parameter.paramGroup.label', default: 'Param Group')}" />

							<g:sortableColumn property="paramDescription"
								title="${message(code: 'parameter.paramDescription.label', default: 'Param Description')}" />

							<g:sortableColumn property="maxValue"
								title="${message(code: 'parameter.maxValue.label', default: 'Max Value')}" />

							<g:sortableColumn property="minValue"
								title="${message(code: 'parameter.minValue.label', default: 'Min Value')}" />

						</tr>
					</thead>
					<tbody>
						<g:each in="${parameterInstanceList}" status="i"
							var="parameterInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

								<td><g:link action="show" id="${parameterInstance.id}">
										${fieldValue(bean: parameterInstance, field: "paramCode")}
									</g:link></td>

								<td>
									${message(code: fieldValue(bean: parameterInstance, field: "paramCategoryDescription"))}
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
				<div class="pagination">
					<g:paginate total="${parameterInstanceCount ?: 0}" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>