
<%@ page import="ar.com.burudos.sales.Transaction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-transaction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-transaction" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="transaction.party.label" default="Party" /></th>
					
						<th><g:message code="transaction.op.label" default="Op" /></th>
					
						<g:sortableColumn property="month" title="${message(code: 'transaction.month.label', default: 'Month')}" />
					
						<g:sortableColumn property="quantity" title="${message(code: 'transaction.quantity.label', default: 'Quantity')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${transactionInstanceList}" status="i" var="transactionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${transactionInstance.id}">${fieldValue(bean: transactionInstance, field: "party")}</g:link></td>
					
						<td>${fieldValue(bean: transactionInstance, field: "op")}</td>
					
						<td>${fieldValue(bean: transactionInstance, field: "month")}</td>
					
						<td>${fieldValue(bean: transactionInstance, field: "quantity")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${transactionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
