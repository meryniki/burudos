
<%@ page import="ar.com.burudos.sales.Filter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'filter.label', default: 'Filter')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-filter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-filter" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list filter">
			
				<g:if test="${filterInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="filter.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${filterInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filterInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="filter.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${filterInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filterInstance?.bu}">
				<li class="fieldcontain">
					<span id="bu-label" class="property-label"><g:message code="filter.bu.label" default="Bu" /></span>
					
						<span class="property-value" aria-labelledby="bu-label"><g:link controller="bussinesUnit" action="show" id="${filterInstance?.bu?.id}">${filterInstance?.bu?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${filterInstance?.op}">
				<li class="fieldcontain">
					<span id="op-label" class="property-label"><g:message code="filter.op.label" default="Op" /></span>
					
						<span class="property-value" aria-labelledby="op-label"><g:link controller="operation" action="show" id="${filterInstance?.op?.id}">${filterInstance?.op?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${filterInstance?.sds}">
				<li class="fieldcontain">
					<span id="sds-label" class="property-label"><g:message code="filter.sds.label" default="Sds" /></span>
					
						<span class="property-value" aria-labelledby="sds-label"><g:fieldValue bean="${filterInstance}" field="sds"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filterInstance?.ani}">
				<li class="fieldcontain">
					<span id="ani-label" class="property-label"><g:message code="filter.ani.label" default="Ani" /></span>
					
						<span class="property-value" aria-labelledby="ani-label"><g:fieldValue bean="${filterInstance}" field="ani"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filterInstance?.imei}">
				<li class="fieldcontain">
					<span id="imei-label" class="property-label"><g:message code="filter.imei.label" default="Imei" /></span>
					
						<span class="property-value" aria-labelledby="imei-label"><g:fieldValue bean="${filterInstance}" field="imei"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filterInstance?.sim}">
				<li class="fieldcontain">
					<span id="sim-label" class="property-label"><g:message code="filter.sim.label" default="Sim" /></span>
					
						<span class="property-value" aria-labelledby="sim-label"><g:fieldValue bean="${filterInstance}" field="sim"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filterInstance?.folio}">
				<li class="fieldcontain">
					<span id="folio-label" class="property-label"><g:message code="filter.folio.label" default="Folio" /></span>
					
						<span class="property-value" aria-labelledby="folio-label"><g:fieldValue bean="${filterInstance}" field="folio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filterInstance?.partida}">
				<li class="fieldcontain">
					<span id="partida-label" class="property-label"><g:message code="filter.partida.label" default="Partida" /></span>
					
						<span class="property-value" aria-labelledby="partida-label"><g:fieldValue bean="${filterInstance}" field="partida"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filterInstance?.equipo}">
				<li class="fieldcontain">
					<span id="equipo-label" class="property-label"><g:message code="filter.equipo.label" default="Equipo" /></span>
					
						<span class="property-value" aria-labelledby="equipo-label"><g:fieldValue bean="${filterInstance}" field="equipo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filterInstance?.solicitud}">
				<li class="fieldcontain">
					<span id="solicitud-label" class="property-label"><g:message code="filter.solicitud.label" default="Solicitud" /></span>
					
						<span class="property-value" aria-labelledby="solicitud-label"><g:fieldValue bean="${filterInstance}" field="solicitud"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filterInstance?.cancel}">
				<li class="fieldcontain">
					<span id="cancel-label" class="property-label"><g:message code="filter.cancel.label" default="Cancel" /></span>
					
						<span class="property-value" aria-labelledby="cancel-label"><g:fieldValue bean="${filterInstance}" field="cancel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filterInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="filter.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:fieldValue bean="${filterInstance}" field="estado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filterInstance?.factura}">
				<li class="fieldcontain">
					<span id="factura-label" class="property-label"><g:message code="filter.factura.label" default="Factura" /></span>
					
						<span class="property-value" aria-labelledby="factura-label"><g:fieldValue bean="${filterInstance}" field="factura"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filterInstance?.importe}">
				<li class="fieldcontain">
					<span id="importe-label" class="property-label"><g:message code="filter.importe.label" default="Importe" /></span>
					
						<span class="property-value" aria-labelledby="importe-label"><g:fieldValue bean="${filterInstance}" field="importe"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filterInstance?.plan_desc}">
				<li class="fieldcontain">
					<span id="plan_desc-label" class="property-label"><g:message code="filter.plan_desc.label" default="Plandesc" /></span>
					
						<span class="property-value" aria-labelledby="plan_desc-label"><g:fieldValue bean="${filterInstance}" field="plan_desc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filterInstance?.debaut}">
				<li class="fieldcontain">
					<span id="debaut-label" class="property-label"><g:message code="filter.debaut.label" default="Debaut" /></span>
					
						<span class="property-value" aria-labelledby="debaut-label"><g:fieldValue bean="${filterInstance}" field="debaut"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filterInstance?.month}">
				<li class="fieldcontain">
					<span id="month-label" class="property-label"><g:message code="filter.month.label" default="Month" /></span>
					
						<span class="property-value" aria-labelledby="month-label"><g:formatDate date="${filterInstance?.month}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:filterInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${filterInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
