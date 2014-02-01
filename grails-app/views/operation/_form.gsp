<%@ page import="ar.com.burudos.sales.Operation" %>



<div class="fieldcontain ${hasErrors(bean: operationInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="operation.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${operationInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: operationInstance, field: 'meaning', 'error')} ">
	<label for="meaning">
		<g:message code="operation.meaning.label" default="Meaning" />
		
	</label>
	<g:textField name="meaning" value="${operationInstance?.meaning}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: operationInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="operation.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${operationInstance?.description}"/>
</div>

