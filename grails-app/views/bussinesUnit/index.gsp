
<%@ page import="ar.com.burudos.business.BussinesUnit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bussinesUnit.label', default: 'BussinesUnit')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bussinesUnit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bussinesUnit" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="bussinesUnit.coordinator.label" default="Coordinator" /></th>
					
						<g:sortableColumn property="code" title="${message(code: 'bussinesUnit.code.label', default: 'Code')}" />
					
						<th><g:message code="bussinesUnit.father.label" default="Father" /></th>
					
						<g:sortableColumn property="description" title="${message(code: 'bussinesUnit.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bussinesUnitInstanceList}" status="i" var="bussinesUnitInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bussinesUnitInstance.id}">${fieldValue(bean: bussinesUnitInstance, field: "coordinator")}</g:link></td>
					
						<td>${fieldValue(bean: bussinesUnitInstance, field: "code")}</td>
					
						<td>${fieldValue(bean: bussinesUnitInstance, field: "father")}</td>
					
						<td>${fieldValue(bean: bussinesUnitInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bussinesUnitInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
