
<%@ page import="ar.com.burudos.sales.statement.StatementLine" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'statementLine.label', default: 'StatementLine')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-statementLine" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-statementLine" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list statementLine">
			
				<g:if test="${statementLineInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="statementLine.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${statementLineInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statementLineInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="statementLine.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${statementLineInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statementLineInstance?.paramGroup}">
				<li class="fieldcontain">
					<span id="paramGroup-label" class="property-label"><g:message code="statementLine.paramGroup.label" default="Param Group" /></span>
					
						<span class="property-value" aria-labelledby="paramGroup-label"><g:fieldValue bean="${statementLineInstance}" field="paramGroup"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statementLineInstance?.unitAmount}">
				<li class="fieldcontain">
					<span id="unitAmount-label" class="property-label"><g:message code="statementLine.unitAmount.label" default="Unit Amount" /></span>
					
						<span class="property-value" aria-labelledby="unitAmount-label"><g:fieldValue bean="${statementLineInstance}" field="unitAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statementLineInstance?.unitAmountFixed}">
				<li class="fieldcontain">
					<span id="unitAmountFixed-label" class="property-label"><g:message code="statementLine.unitAmountFixed.label" default="Unit Amount Fixed" /></span>
					
						<span class="property-value" aria-labelledby="unitAmountFixed-label"><g:fieldValue bean="${statementLineInstance}" field="unitAmountFixed"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statementLineInstance?.operationsAmount}">
				<li class="fieldcontain">
					<span id="operationsAmount-label" class="property-label"><g:message code="statementLine.operationsAmount.label" default="Operations Amount" /></span>
					
						<span class="property-value" aria-labelledby="operationsAmount-label"><g:fieldValue bean="${statementLineInstance}" field="operationsAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statementLineInstance?.operationsAmountFixed}">
				<li class="fieldcontain">
					<span id="operationsAmountFixed-label" class="property-label"><g:message code="statementLine.operationsAmountFixed.label" default="Operations Amount Fixed" /></span>
					
						<span class="property-value" aria-labelledby="operationsAmountFixed-label"><g:fieldValue bean="${statementLineInstance}" field="operationsAmountFixed"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statementLineInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="statementLine.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${statementLineInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statementLineInstance?.amountFixed}">
				<li class="fieldcontain">
					<span id="amountFixed-label" class="property-label"><g:message code="statementLine.amountFixed.label" default="Amount Fixed" /></span>
					
						<span class="property-value" aria-labelledby="amountFixed-label"><g:fieldValue bean="${statementLineInstance}" field="amountFixed"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statementLineInstance?.lineOrder}">
				<li class="fieldcontain">
					<span id="lineOrder-label" class="property-label"><g:message code="statementLine.lineOrder.label" default="Line Order" /></span>
					
						<span class="property-value" aria-labelledby="lineOrder-label"><g:fieldValue bean="${statementLineInstance}" field="lineOrder"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statementLineInstance?.statement}">
				<li class="fieldcontain">
					<span id="statement-label" class="property-label"><g:message code="statementLine.statement.label" default="Statement" /></span>
					
						<span class="property-value" aria-labelledby="statement-label"><g:link controller="statement" action="show" id="${statementLineInstance?.statement?.id}">${statementLineInstance?.statement?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:statementLineInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${statementLineInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
