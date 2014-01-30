
<%@ page import="ar.com.burudos.business.CoordinationEmployeeUnit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'coordinationEmployeeUnit.label', default: 'CoordinationEmployeeUnit')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-coordinationEmployeeUnit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-coordinationEmployeeUnit" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list coordinationEmployeeUnit">
			
				<g:if test="${coordinationEmployeeUnitInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="coordinationEmployeeUnit.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:link controller="bussinesUnit" action="show" id="${coordinationEmployeeUnitInstance?.role?.id}">${coordinationEmployeeUnitInstance?.role?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${coordinationEmployeeUnitInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="coordinationEmployeeUnit.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="employee" action="show" id="${coordinationEmployeeUnitInstance?.user?.id}">${coordinationEmployeeUnitInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:coordinationEmployeeUnitInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${coordinationEmployeeUnitInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
