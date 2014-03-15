
<%@ page import="ar.com.burudos.sales.Transaction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-transaction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="upload"><g:message code="default.upload.label" args="[entityName]" /></g:link></li>			
			</ul>
		</div>
		<div id="show-transaction" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list transaction">
			
				<g:if test="${transactionInstance?.party}">
				<li class="fieldcontain">
					<span id="party-label" class="property-label"><g:message code="transaction.party.label" default="Party" /></span>
					
						<span class="property-value" aria-labelledby="party-label"><g:link controller="party" action="show" id="${transactionInstance?.party?.id}">${transactionInstance?.party?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.op}">
				<li class="fieldcontain">
					<span id="op-label" class="property-label"><g:message code="transaction.op.label" default="Op" /></span>
					
						<span class="property-value" aria-labelledby="op-label"><g:link controller="operation" action="show" id="${transactionInstance?.op?.id}">${transactionInstance?.op?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="transaction.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${transactionInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.sds}">
				<li class="fieldcontain">
					<span id="sds-label" class="property-label"><g:message code="transaction.sds.label" default="Sds" /></span>
					
						<span class="property-value" aria-labelledby="sds-label"><g:fieldValue bean="${transactionInstance}" field="sds"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.ani}">
				<li class="fieldcontain">
					<span id="ani-label" class="property-label"><g:message code="transaction.ani.label" default="Ani" /></span>
					
						<span class="property-value" aria-labelledby="ani-label"><g:fieldValue bean="${transactionInstance}" field="ani"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.imei}">
				<li class="fieldcontain">
					<span id="imei-label" class="property-label"><g:message code="transaction.imei.label" default="Imei" /></span>
					
						<span class="property-value" aria-labelledby="imei-label"><g:fieldValue bean="${transactionInstance}" field="imei"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.sim}">
				<li class="fieldcontain">
					<span id="sim-label" class="property-label"><g:message code="transaction.sim.label" default="Sim" /></span>
					
						<span class="property-value" aria-labelledby="sim-label"><g:fieldValue bean="${transactionInstance}" field="sim"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.folio}">
				<li class="fieldcontain">
					<span id="folio-label" class="property-label"><g:message code="transaction.folio.label" default="Folio" /></span>
					
						<span class="property-value" aria-labelledby="folio-label"><g:fieldValue bean="${transactionInstance}" field="folio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.partida}">
				<li class="fieldcontain">
					<span id="partida-label" class="property-label"><g:message code="transaction.partida.label" default="Partida" /></span>
					
						<span class="property-value" aria-labelledby="partida-label"><g:fieldValue bean="${transactionInstance}" field="partida"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.equipo}">
				<li class="fieldcontain">
					<span id="equipo-label" class="property-label"><g:message code="transaction.equipo.label" default="Equipo" /></span>
					
						<span class="property-value" aria-labelledby="equipo-label"><g:fieldValue bean="${transactionInstance}" field="equipo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.almacen}">
				<li class="fieldcontain">
					<span id="almacen-label" class="property-label"><g:message code="transaction.almacen.label" default="Almacen" /></span>
					
						<span class="property-value" aria-labelledby="almacen-label"><g:link controller="bussinesUnit" action="show" id="${transactionInstance?.almacen?.id}">${transactionInstance?.almacen?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="transaction.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="client" action="show" id="${transactionInstance?.cliente?.id}">${transactionInstance?.cliente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.cancel}">
				<li class="fieldcontain">
					<span id="cancel-label" class="property-label"><g:message code="transaction.cancel.label" default="Cancel" /></span>
					
						<span class="property-value" aria-labelledby="cancel-label"><g:fieldValue bean="${transactionInstance}" field="cancel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="transaction.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:fieldValue bean="${transactionInstance}" field="estado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.factura}">
				<li class="fieldcontain">
					<span id="factura-label" class="property-label"><g:message code="transaction.factura.label" default="Factura" /></span>
					
						<span class="property-value" aria-labelledby="factura-label"><g:fieldValue bean="${transactionInstance}" field="factura"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.importe}">
				<li class="fieldcontain">
					<span id="importe-label" class="property-label"><g:message code="transaction.importe.label" default="Importe" /></span>
					
						<span class="property-value" aria-labelledby="importe-label"><g:fieldValue bean="${transactionInstance}" field="importe"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.plan_desc}">
				<li class="fieldcontain">
					<span id="plan_desc-label" class="property-label"><g:message code="transaction.plan_desc.label" default="Plandesc" /></span>
					
						<span class="property-value" aria-labelledby="plan_desc-label"><g:fieldValue bean="${transactionInstance}" field="plan_desc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.debaut}">
				<li class="fieldcontain">
					<span id="debaut-label" class="property-label"><g:message code="transaction.debaut.label" default="Debaut" /></span>
					
						<span class="property-value" aria-labelledby="debaut-label"><g:fieldValue bean="${transactionInstance}" field="debaut"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:transactionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${transactionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
