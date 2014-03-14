
<%@ page import="ar.com.burudos.party.Employee" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="upload"><g:message code="default.upload.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-employee" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="uid" title="${message(code: 'employee.uid.label', default: 'Uid')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'employee.name.label', default: 'Name')}" />
					
					    <g:sortableColumn property="legajo" title="${message(code: 'employee.legajo.label', default: 'Employee Number')}" />
					
						<th><g:message code="employee.bu.label" default="Bu" /></th>
					
						<g:sortableColumn property="isworker" title="${message(code: 'employee.isworker.label', default: 'Isworker')}" />
						
						<g:sortableColumn property="iscoordinator" title="${message(code: 'employee.iscoordinator.label', default: 'IsCoordinator')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${employeeInstanceList}" status="i" var="employeeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${employeeInstance.id}">${fieldValue(bean: employeeInstance, field: "uid")}</g:link></td>
					
						<td>${fieldValue(bean: employeeInstance, field: "name")}</td>
					
					    <td>${fieldValue(bean: employeeInstance, field: "legajo")}</td>
					
						<td>${fieldValue(bean: employeeInstance, field: "bu")}</td>
					
						<td><g:formatBoolean boolean="${employeeInstance.isworker}" /></td>
						
						<td><g:formatBoolean boolean="${employeeInstance.iscoordinator}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${employeeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
