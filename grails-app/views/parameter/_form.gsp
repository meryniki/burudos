<%@ page import="ar.com.burudos.sales.statement.Parameter"%>

<div
	class="form-group fieldcontain ${hasErrors(bean: parameterInstance, field: 'paramCode', 'error')} ">
	<label class="col-lg-3 control-label" for="paramCode"> <g:message
			code="parameter.paramCode.label" default="Parameter Code" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="col-lg-9">
		<g:field type="text" class="form-control" name="paramCode"
			value="${parameterInstance?.paramCode}" autofocus="autofocus"
			required="required" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: parameterInstance, field: 'paramCategory', 'error')} required">
	<label class="col-lg-3 control-label" for="paramCategory"> <g:message
			code="parameter.paramCategory.label" default="Parameter Category" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-lg-9">
		<g:select class="form-control many-to-one" name="paramCategory"
			optionValue="${ {name->g.message(code: name) } }"
			from="${ar.com.burucps.sales.statement.StatementLineGroup?.values()}"
			keys="${ar.com.burucps.sales.statement.StatementLineGroup.values()*.name()}"
			required="" value="${parameterInstance?.paramCategory?.name()}" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: parameterInstance, field: 'paramGroup', 'error')} ">
	<label class="col-lg-3 control-label" for="paramGroup"> <g:message
			code="parameter.paramGroup.label" default="Parameter Group" />
	</label>
	<div class="col-lg-9">
		<g:textField class="form-control" name="paramGroup"
			value="${parameterInstance?.paramGroup}" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: parameterInstance, field: 'paramDescription', 'error')} ">
	<label class="col-lg-3 control-label" for="paramDescription"> <g:message
			code="parameter.paramDescription.label"
			default="Parameter Description" />
	</label>
	<div class="col-lg-9">
		<g:textField class="form-control" name="paramDescription"
			value="${parameterInstance?.paramDescription}" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: parameterInstance, field: 'value', 'error')} required">
	<label class="col-lg-3 control-label" for="value"> <g:message
			code="parameter.value.label" default="Value" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="col-lg-9">
		<g:field class="form-control" name="value" type="text"
			value="${fieldValue(bean: parameterInstance, field: 'value')}"
			required="" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: parameterInstance, field: 'maxValue', 'error')} required">
	<label class="col-lg-3 control-label" for="maxValue"> <g:message
			code="parameter.maxValue.label" default="Max Value" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="col-lg-9">
		<g:field class="form-control" name="maxValue" type="text"
			value="${fieldValue(bean: parameterInstance, field: 'maxValue')}"
			required="" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: parameterInstance, field: 'minValue', 'error')} ">
	<label class="col-lg-3 control-label" for="minValue"> <g:message
			code="parameter.minValue.label" default="Min Value" />
	</label>
	<div class="col-lg-9">
		<g:field class="form-control" name="minValue" type="text"
			value="${fieldValue(bean: parameterInstance, field: 'minValue')}" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: parameterInstance, field: 'bussinesUnit', 'error')} required">
	<label class="col-lg-3 control-label" for="bussinesUnit"> <g:message
			code="parameter.bussinesUnit.label" default="Bussines Unit" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="col-lg-9">
		<g:select id="bussinesUnit" name="bussinesUnit.id"
			from="${ar.com.burudos.business.BussinesUnit.list()}" optionKey="id"
			required="" value="${parameterInstance?.bussinesUnit?.id}"
			class="form-control many-to-one" />
	</div>
</div>

<g:hiddenField name="active" value="true" />

