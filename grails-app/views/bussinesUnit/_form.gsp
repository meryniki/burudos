<%@ page import="ar.com.burudos.business.BussinesUnit" %>



<div class="fieldcontain ${hasErrors(bean: bussinesUnitInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="bussinesUnit.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${bussinesUnitInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bussinesUnitInstance, field: 'provincia', 'error')} ">
	<label for="provincia">
		<g:message code="bussinesUnit.provincia.label" default="Provincia" />
		
	</label>
	<g:textField name="provincia" value="${bussinesUnitInstance?.provincia}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bussinesUnitInstance, field: 'departamento', 'error')} ">
	<label for="departamento">
		<g:message code="bussinesUnit.departamento.label" default="Departamento" />
		
	</label>
	<g:textField name="departamento" value="${bussinesUnitInstance?.departamento}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bussinesUnitInstance, field: 'localidad', 'error')} ">
	<label for="localidad">
		<g:message code="bussinesUnit.localidad.label" default="Localidad" />
		
	</label>
	<g:textField name="localidad" value="${bussinesUnitInstance?.localidad}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bussinesUnitInstance, field: 'calle', 'error')} ">
	<label for="calle">
		<g:message code="bussinesUnit.calle.label" default="Calle" />
		
	</label>
	<g:textField name="calle" value="${bussinesUnitInstance?.calle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bussinesUnitInstance, field: 'altura', 'error')} ">
	<label for="altura">
		<g:message code="bussinesUnit.altura.label" default="Altura" />
		
	</label>
	<g:textField name="altura" value="${bussinesUnitInstance?.altura}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bussinesUnitInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="bussinesUnit.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${bussinesUnitInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bussinesUnitInstance, field: 'coordinator', 'error')} ">
	<label for="coordinator">
		<g:message code="bussinesUnit.coordinator.label" default="Coordinator" />
		
	</label>
	<g:select id="coordinator" name="coordinator.id" from="${ar.com.burudos.party.Employee.list()}" optionKey="id" value="${bussinesUnitInstance?.coordinator?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bussinesUnitInstance, field: 'father', 'error')} ">
	<label for="father">
		<g:message code="bussinesUnit.father.label" default="Father" />
		
	</label>
	<g:select id="father" name="father.id" from="${ar.com.burudos.business.BussinesUnit.list()}" optionKey="id" value="${bussinesUnitInstance?.father?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

