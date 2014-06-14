<%@ page import="ar.com.burudos.sales.Summary"%>


<div
	class=" form-group fieldcontain ${hasErrors(bean: summaryInstance, field: 'summaryCode', 'error')}" required>
	<label class="col-lg-3 control-label" for="summaryCode"> <g:message
			code="summary.summaryCode.label" default="Codigo" />
	</label>
	<div class="col-lg-9">
		<g:field name="summaryCode" type="text"
			value="${summaryInstance.summaryCode}" />
		<a
			onmouseover="nhpup.popup('<g:message code="summary.summaryCode.help"/>');">?</a>
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: summaryInstance, field: 'bu', 'error')}">
	<label class="col-lg-3 control-label" for="bu"> <g:message
			code="summary.bu.label" default="Punto de Venta" />
	</label>
	<div class="col-lg-9">
		<g:select id="bu" name="bu.id"
			from="${ar.com.burudos.business.BussinesUnit.list()}" optionKey="id"
			 value="${summaryInstance?.bu?.id}" class="many-to-one" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: summaryInstance, field: 'employee', 'error')}">
	<label class="col-lg-3 control-label" for="employee"> <g:message
			code="summary.employee.label" default="Empleado" />
	</label>
	<div class="col-lg-9">
		<g:select id="employee" name="employee.id"
			from="${ar.com.burudos.party.Employee.list()}" optionKey="id"
		 value="${summaryInstance?.employee?.id}" class="many-to-one" noSelection="['':'-Ninguno-']"/>
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: summaryInstance, field: 'filter', 'error')}">
	<label class="col-lg-3 control-label" for="filter"> <g:message
			code="summary.op.label" default="Filtro" />
	</label>
	<div class="col-lg-9">
		<g:select id="filter" name="filter.id"
			from="${ar.com.burudos.sales.Filter.list()}" optionKey="id" 
			value="${summaryInstance?.filter?.id}" class="many-to-one" noSelection="['':'-Ninguno-']" />
		<a
			onmouseover="nhpup.popup('<g:message code="summary.filter.help"/>');">?</a>
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: summaryInstance, field: 'sumMonth', 'error')} required">
	<label class="col-lg-3 control-label" for="sumMonth"> <g:message
			code="summary.month.label" default="Mes a totalizar" /> <span
		class="required-indicator">*</span>
	</label>
	<g:datePicker name="sumMonth" precision="month" default="${sumMonth}"/>
	<a onmouseover="nhpup.popup('<g:message code="summary.month.help"/>');">?</a>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: summaryInstance, field: 'quantity', 'error')} required">
	<label class="col-lg-3 control-label" for="quantity"> <g:message
			code="summary.quantity.label" default="Quantity" />
	</label>
	<div class="col-lg-9">
		<g:field name="quantity" type="number"
			value="${summaryInstance.quantity}" />
		<a
			onmouseover="nhpup.popup('<g:message code="summary.quantity.help"/>');">?</a>
	</div>
</div>
