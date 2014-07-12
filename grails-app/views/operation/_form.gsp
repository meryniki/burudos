<%@ page import="ar.com.burudos.sales.Operation" %>



<div
	class=" form-group fieldcontain ${hasErrors(bean: operationInstance, field: 'code', 'error')} ">
	<label class="col-lg-3 control-label" for="code"> <g:message
			code="operation.code.label" default="Code" />

	</label>
	<div class="col-lg-9">
		<g:textField name="code" value="${operationInstance?.code}" />
	</div>
</div>


<div class=" form-group fieldcontain ${hasErrors(bean: operationInstance, field: 'description', 'error')} ">
	<label class="col-lg-3 control-label" for="description">
		<g:message code="operation.description.label" default="Description" />
		
	</label>
	<div class="col-lg-9">
	<g:textField name="description" value="${operationInstance?.description}"/>
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: operationInstance, field: 'active', 'error')} ">
	<label class="col-lg-3 control-label" for="active"> <g:message
			code="employee.active.label" default="Activo" />
	</label>
	<div class="col-lg-9">
		<g:checkBox name="Activo" value="${employeeInstance?.active}" />
	</div>
</div>
