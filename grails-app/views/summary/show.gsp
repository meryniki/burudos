
<%@ page import="ar.com.burudos.sales.Summary" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'summary.label', default: 'Summary')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-summary" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-summary" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list summary">
			
				<g:if test="${summaryInstance?.bu}">
				<li class="fieldcontain">
					<span id="bu-label" class="property-label"><g:message code="summary.bu.label" default="Bu" /></span>
					
						<span class="property-value" aria-labelledby="bu-label"><g:link controller="bussinesUnit" action="show" id="${summaryInstance?.bu?.id}">${summaryInstance?.bu?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${summaryInstance?.op}">
				<li class="fieldcontain">
					<span id="op-label" class="property-label"><g:message code="summary.op.label" default="Op" /></span>
					
						<span class="property-value" aria-labelledby="op-label"><g:link controller="operation" action="show" id="${summaryInstance?.op?.id}">${summaryInstance?.op?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${summaryInstance?.month}">
				<li class="fieldcontain">
					<span id="month-label" class="property-label"><g:message code="summary.month.label" default="Month" /></span>
					
						<span class="property-value" aria-labelledby="month-label"><g:fieldValue bean="${summaryInstance}" field="month"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${summaryInstance?.quantity}">
				<li class="fieldcontain">
					<span id="quantity-label" class="property-label"><g:message code="summary.quantity.label" default="Quantity" /></span>
					
						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${summaryInstance}" field="quantity"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:summaryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${summaryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
