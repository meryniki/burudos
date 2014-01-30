<%@ page import="ar.com.burudos.party.Subcontractor" %>



<div class="fieldcontain ${hasErrors(bean: subcontractorInstance, field: 'uid', 'error')} ">
	<label for="uid">
		<g:message code="subcontractor.uid.label" default="Uid" />
		
	</label>
	<g:textField name="uid" value="${subcontractorInstance?.uid}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subcontractorInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="subcontractor.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${subcontractorInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subcontractorInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="subcontractor.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${subcontractorInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subcontractorInstance, field: 'dofbeg', 'error')} required">
	<label for="dofbeg">
		<g:message code="subcontractor.dofbeg.label" default="Dofbeg" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dofbeg" precision="day"  value="${subcontractorInstance?.dofbeg}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: subcontractorInstance, field: 'bu', 'error')} ">
	<label for="bu">
		<g:message code="subcontractor.bu.label" default="Bu" />
		
	</label>
	<g:select id="bu" name="bu.id" from="${ar.com.burudos.business.BussinesUnit.list()}" optionKey="id" value="${subcontractorInstance?.bu?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

