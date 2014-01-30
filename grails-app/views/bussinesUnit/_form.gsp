<%@ page import="ar.com.burudos.business.BussinesUnit" %>


<div class="fieldcontain ${hasErrors(bean: bussinesUnitInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="bussinesUnit.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="code" type="number" value="${bussinesUnitInstance.code}" required=""/>
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

<div class="fieldcontain ${hasErrors(bean: bussinesUnitInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="bussinesUnit.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${bussinesUnitInstance?.description}"/>
</div>

