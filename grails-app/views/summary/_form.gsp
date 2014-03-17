<%@ page import="ar.com.burudos.sales.Summary" %>

<div class="fieldcontain ${hasErrors(bean: summaryInstance, field: 'bu', 'error')} required">
	<label for="bu">
		<g:message code="summary.bu.label" default="Bu" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="bu" name="bu.id" from="${ar.com.burudos.business.BussinesUnit.list()}" optionKey="id" required="" value="${summaryInstance?.bu?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: summaryInstance, field: 'op', 'error')} required">
	<label for="op">
		<g:message code="summary.op.label" default="Op" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="op" name="op.id" from="${ar.com.burudos.sales.Operation.list()}" optionKey="id" required="" value="${summaryInstance?.op?.id}" class="many-to-one"/>
	<a onmouseover="nhpup.popup('<g:message code="summary.op.help"/>');">?</a>
</div>

<div class="fieldcontain ${hasErrors(bean: summaryInstance, field: 'month', 'error')} required">
	<label for="month">
		<g:message code="summary.month.label" default="Month" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="month" type="number" value="${summaryInstance.month}" required=""/>
		<a onmouseover="nhpup.popup('<g:message code="summary.month.help"/>');">?</a>
</div>

