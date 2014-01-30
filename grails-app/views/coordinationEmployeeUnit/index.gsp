
<%@ page import="ar.com.burudos.business.CoordinationEmployeeUnit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'coordinationEmployeeUnit.label', default: 'CoordinationEmployeeUnit')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-coordinationEmployeeUnit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-coordinationEmployeeUnit" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="coordinationEmployeeUnit.role.label" default="Role" /></th>
					
						<th><g:message code="coordinationEmployeeUnit.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${coordinationEmployeeUnitInstanceList}" status="i" var="coordinationEmployeeUnitInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${coordinationEmployeeUnitInstance.id}">${fieldValue(bean: coordinationEmployeeUnitInstance, field: "role")}</g:link></td>
					
						<td>${fieldValue(bean: coordinationEmployeeUnitInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${coordinationEmployeeUnitInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
