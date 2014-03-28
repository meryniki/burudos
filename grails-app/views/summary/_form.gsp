<%@ page import="ar.com.burudos.sales.Summary"%>

<div
	class=" form-group fieldcontain ${hasErrors(bean: summaryInstance, field: 'bu', 'error')} required">
	<label class="col-lg-3 control-label" for="bu"> <g:message
			code="summary.bu.label" default="Bu" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="col-lg-9">
		<g:select id="bu" name="bu.id"
			from="${ar.com.burudos.business.BussinesUnit.list()}" optionKey="id"
			required="" value="${summaryInstance?.bu?.id}" class="many-to-one" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: summaryInstance, field: 'op', 'error')} required">
	<label class="col-lg-3 control-label" for="op"> <g:message
			code="summary.op.label" default="Op" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="col-lg-9">
		<g:select id="op" name="op.id"
			from="${ar.com.burudos.sales.Operation.list()}" optionKey="id"
			required="" value="${summaryInstance?.op?.id}" class="many-to-one" />
		<a onmouseover="nhpup.popup('<g:message code="summary.op.help"/>');">?</a>
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: summaryInstance, field: 'month', 'error')} required">
	<label class="col-lg-3 control-label" for="month"> <g:message
			code="summary.month.label" default="Month" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="col-lg-9">
		<g:field name="month" type="number" value="${summaryInstance.month}"
			required="" />
		<a
			onmouseover="nhpup.popup('<g:message code="summary.month.help"/>');">?</a>
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: summaryInstance, field: 'quantity', 'error')} required">
	<label class="col-lg-3 control-label" for="quantity"> <g:message
			code="summary.quantity.label" default="Quantity" />
	</label>
	<div class="col-lg-9">
		<g:field name="quantity" type="number"
			value="${summaryInstance.quantity}"/>
		<a
			onmouseover="nhpup.popup('<g:message code="summary.quantity.help"/>');">?</a>
	</div>
</div>
