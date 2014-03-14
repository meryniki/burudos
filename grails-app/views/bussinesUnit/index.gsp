
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
			    <li><g:link class="create" action="upload"><g:message code="default.upload.label" args="[entityName]" /></g:link></li>
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
					
						<g:sortableColumn property="code" title="${message(code: 'bussinesUnit.code.label', default: 'Code')}" />
						
						<g:sortableColumn property="nombre" title="${message(code: 'bussinesUnit.nombre.label', default: 'Nombre')}" />
						
						<g:sortableColumn property="father" title="${message(code: 'bussinesUnit.father.label', default: 'Depende de')}" />
					
						<g:sortableColumn property="provincia" title="${message(code: 'bussinesUnit.provincia.label', default: 'Provincia')}" />
					
						<g:sortableColumn property="departamento" title="${message(code: 'bussinesUnit.departamento.label', default: 'Departamento')}" />
					
						<g:sortableColumn property="localidad" title="${message(code: 'bussinesUnit.localidad.label', default: 'Localidad')}" />
					
						<g:sortableColumn property="calle" title="${message(code: 'bussinesUnit.calle.label', default: 'Calle')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bussinesUnitInstanceList}" status="i" var="bussinesUnitInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bussinesUnitInstance.id}">${fieldValue(bean: bussinesUnitInstance, field: "code")}</g:link></td>
					
					    <td>${fieldValue(bean: bussinesUnitInstance, field: "nombre")}</td>
					
					    <td>${fieldValue(bean: bussinesUnitInstance, field: "father")}</td>
					
						<td>${fieldValue(bean: bussinesUnitInstance, field: "provincia")}</td>
					
						<td>${fieldValue(bean: bussinesUnitInstance, field: "departamento")}</td>
					
						<td>${fieldValue(bean: bussinesUnitInstance, field: "localidad")}</td>
					
						<td>${fieldValue(bean: bussinesUnitInstance, field: "calle")}</td>
					
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
