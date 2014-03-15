
<%@ page import="ar.com.burudos.party.Employee" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-employee" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list employee">
			
				<g:if test="${employeeInstance?.uid}">
				<li class="fieldcontain">
					<span id="uid-label" class="property-label"><g:message code="employee.uid.label" default="Uid" /></span>
					
						<span class="property-value" aria-labelledby="uid-label"><g:fieldValue bean="${employeeInstance}" field="uid"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="employee.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${employeeInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="employee.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${employeeInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.creationDate}">
				<li class="fieldcontain">
					<span id="creationDate-label" class="property-label"><g:message code="employee.creationDate.label" default="Creation Date" /></span>
					
						<span class="property-value" aria-labelledby="creationDate-label"><g:formatDate date="${employeeInstance?.creationDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="employee.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${employeeInstance}" field="createdBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.lastUpdateDate}">
				<li class="fieldcontain">
					<span id="lastUpdateDate-label" class="property-label"><g:message code="employee.lastUpdateDate.label" default="Last Update Date" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdateDate-label"><g:formatDate date="${employeeInstance?.lastUpdateDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.lastUpdateBy}">
				<li class="fieldcontain">
					<span id="lastUpdateBy-label" class="property-label"><g:message code="employee.lastUpdateBy.label" default="Last Update By" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdateBy-label"><g:fieldValue bean="${employeeInstance}" field="lastUpdateBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.legajo}">
				<li class="fieldcontain">
					<span id="legajo-label" class="property-label"><g:message code="employee.legajo.label" default="Legajo" /></span>
					
						<span class="property-value" aria-labelledby="legajo-label"><g:fieldValue bean="${employeeInstance}" field="legajo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.fullname}">
				<li class="fieldcontain">
					<span id="fullname-label" class="property-label"><g:message code="employee.fullname.label" default="Fullname" /></span>
					
						<span class="property-value" aria-labelledby="fullname-label"><g:fieldValue bean="${employeeInstance}" field="fullname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.names}">
				<li class="fieldcontain">
					<span id="names-label" class="property-label"><g:message code="employee.names.label" default="Names" /></span>
					
						<span class="property-value" aria-labelledby="names-label"><g:fieldValue bean="${employeeInstance}" field="names"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.lastname}">
				<li class="fieldcontain">
					<span id="lastname-label" class="property-label"><g:message code="employee.lastname.label" default="Lastname" /></span>
					
						<span class="property-value" aria-labelledby="lastname-label"><g:fieldValue bean="${employeeInstance}" field="lastname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.dofingreso}">
				<li class="fieldcontain">
					<span id="dofingreso-label" class="property-label"><g:message code="employee.dofingreso.label" default="Dofingreso" /></span>
					
						<span class="property-value" aria-labelledby="dofingreso-label"><g:formatDate date="${employeeInstance?.dofingreso}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.bu}">
				<li class="fieldcontain">
					<span id="bu-label" class="property-label"><g:message code="employee.bu.label" default="Bu" /></span>
					
						<span class="property-value" aria-labelledby="bu-label"><g:link controller="bussinesUnit" action="show" id="${employeeInstance?.bu?.id}">${employeeInstance?.bu?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.dofbirth}">
				<li class="fieldcontain">
					<span id="dofbirth-label" class="property-label"><g:message code="employee.dofbirth.label" default="Dofbirth" /></span>
					
						<span class="property-value" aria-labelledby="dofbirth-label"><g:formatDate date="${employeeInstance?.dofbirth}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.isworker}">
				<li class="fieldcontain">
					<span id="isworker-label" class="property-label"><g:message code="employee.isworker.label" default="Isworker" /></span>
					
						<span class="property-value" aria-labelledby="isworker-label"><g:formatBoolean boolean="${employeeInstance?.isworker}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.iscoordinator}">
				<li class="fieldcontain">
					<span id="iscoordinator-label" class="property-label"><g:message code="employee.iscoordinator.label" default="Iscoordinator" /></span>
					
						<span class="property-value" aria-labelledby="iscoordinator-label"><g:formatBoolean boolean="${employeeInstance?.iscoordinator}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.basic}">
				<li class="fieldcontain">
					<span id="basic-label" class="property-label"><g:message code="employee.basic.label" default="Basic" /></span>
					
						<span class="property-value" aria-labelledby="basic-label"><g:fieldValue bean="${employeeInstance}" field="basic"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:employeeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${employeeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
