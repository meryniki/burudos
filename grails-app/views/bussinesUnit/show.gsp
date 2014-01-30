
<%@ page import="ar.com.burudos.business.BussinesUnit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bussinesUnit.label', default: 'BussinesUnit')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bussinesUnit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bussinesUnit" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bussinesUnit">
			
				<g:if test="${bussinesUnitInstance?.coordinator}">
				<li class="fieldcontain">
					<span id="coordinator-label" class="property-label"><g:message code="bussinesUnit.coordinator.label" default="Coordinator" /></span>
					
						<span class="property-value" aria-labelledby="coordinator-label"><g:link controller="employee" action="show" id="${bussinesUnitInstance?.coordinator?.id}">${bussinesUnitInstance?.coordinator?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bussinesUnitInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="bussinesUnit.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${bussinesUnitInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bussinesUnitInstance?.father}">
				<li class="fieldcontain">
					<span id="father-label" class="property-label"><g:message code="bussinesUnit.father.label" default="Father" /></span>
					
						<span class="property-value" aria-labelledby="father-label"><g:link controller="bussinesUnit" action="show" id="${bussinesUnitInstance?.father?.id}">${bussinesUnitInstance?.father?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bussinesUnitInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="bussinesUnit.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${bussinesUnitInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:bussinesUnitInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${bussinesUnitInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
