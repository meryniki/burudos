
<%@ page import="ar.com.burudos.sales.statement.StatementLine" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'statementLine.label', default: 'StatementLine')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-statementLine" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-statementLine" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="type" title="${message(code: 'statementLine.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'statementLine.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="paramGroup" title="${message(code: 'statementLine.paramGroup.label', default: 'Param Group')}" />
					
						<g:sortableColumn property="unitAmount" title="${message(code: 'statementLine.unitAmount.label', default: 'Unit Amount')}" />
					
						<g:sortableColumn property="unitAmountFixed" title="${message(code: 'statementLine.unitAmountFixed.label', default: 'Unit Amount Fixed')}" />
					
						<g:sortableColumn property="operationsAmount" title="${message(code: 'statementLine.operationsAmount.label', default: 'Operations Amount')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${statementLineInstanceList}" status="i" var="statementLineInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${statementLineInstance.id}">${fieldValue(bean: statementLineInstance, field: "type")}</g:link></td>
					
						<td>${fieldValue(bean: statementLineInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: statementLineInstance, field: "paramGroup")}</td>
					
						<td>${fieldValue(bean: statementLineInstance, field: "unitAmount")}</td>
					
						<td>${fieldValue(bean: statementLineInstance, field: "unitAmountFixed")}</td>
					
						<td>${fieldValue(bean: statementLineInstance, field: "operationsAmount")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${statementLineInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
