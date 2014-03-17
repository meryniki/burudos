
<%@ page import="ar.com.burudos.sales.Summary" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'summary.label', default: 'Summary')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-summary" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="domonthly"><g:message code="summary.domonthly.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-summary" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="summary.bu.label" default="Bu" /></th>
					
						<th><g:message code="summary.op.label" default="Op" /></th>
					
						<g:sortableColumn property="month" title="${message(code: 'summary.month.label', default: 'Month')}" />
					
						<g:sortableColumn property="quantity" title="${message(code: 'summary.quantity.label', default: 'Quantity')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${summaryInstanceList}" status="i" var="summaryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${summaryInstance.id}">${fieldValue(bean: summaryInstance, field: "bu")}</g:link></td>
					
						<td>${fieldValue(bean: summaryInstance, field: "op")}</td>
					
						<td>${fieldValue(bean: summaryInstance, field: "month")}</td>
					
						<td>${fieldValue(bean: summaryInstance, field: "quantity")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${summaryInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
