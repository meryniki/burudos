<%@ page import="ar.com.burudos.sales.statement.StatementLine"%>



<div
	class="form-group fieldcontain ${hasErrors(bean: statementLineInstance, field: 'type', 'error')} required">
	<label class="col-lg-3 control-label" for="type"> <g:message
			code="statementLine.type.label" default="Type" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="col-lg-9">
		<g:select name="type"
			from="${ar.com.burucps.sales.statement.StatementLineType?.values()}"
			keys="${ar.com.burucps.sales.statement.StatementLineType.values()*.name()}"
			required="" value="${statementLineInstance?.type?.name()}" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: statementLineInstance, field: 'description', 'error')} ">
	<label class="col-lg-3 control-label" for="description"> <g:message
			code="statementLine.description.label" default="Description" />

	</label>
	<div class="col-lg-9">
		<g:textField name="description"
			value="${statementLineInstance?.description}" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: statementLineInstance, field: 'paramGroup', 'error')} required">
	<label class="col-lg-3 control-label" for="paramGroup"> <g:message
			code="statementLine.paramGroup.label" default="Param Group" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="col-lg-9">
		<g:select name="paramGroup"
			from="${ar.com.burucps.sales.statement.StatementLineGroup?.values()}"
			keys="${ar.com.burucps.sales.statement.StatementLineGroup.values()*.name()}"
			required="" value="${statementLineInstance?.paramGroup?.name()}" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: statementLineInstance, field: 'unitAmount', 'error')} ">
	<label class="col-lg-3 control-label" for="unitAmount"> <g:message
			code="statementLine.unitAmount.label" default="Unit Amount" />

	</label>
	<div class="col-lg-9">
		<g:field name="unitAmount"
			value="${fieldValue(bean: statementLineInstance, field: 'unitAmount')}" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: statementLineInstance, field: 'unitAmountFixed', 'error')} ">
	<label class="col-lg-3 control-label" for="unitAmountFixed"> <g:message
			code="statementLine.unitAmountFixed.label"
			default="Unit Amount Fixed" />

	</label>
	<div class="col-lg-9">
		<g:field name="unitAmountFixed"
			value="${fieldValue(bean: statementLineInstance, field: 'unitAmountFixed')}" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: statementLineInstance, field: 'operationsAmount', 'error')} ">
	<label class="col-lg-3 control-label" for="operationsAmount"> <g:message
			code="statementLine.operationsAmount.label"
			default="Operations Amount" />

	</label>
	<div class="col-lg-9">
		<g:field name="operationsAmount"
			value="${fieldValue(bean: statementLineInstance, field: 'operationsAmount')}" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: statementLineInstance, field: 'operationsAmountFixed', 'error')} ">
	<label class="col-lg-3 control-label" for="operationsAmountFixed">
		<g:message code="statementLine.operationsAmountFixed.label"
			default="Operations Amount Fixed" />

	</label>
	<div class="col-lg-9">
		<g:field name="operationsAmountFixed"
			value="${fieldValue(bean: statementLineInstance, field: 'operationsAmountFixed')}" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: statementLineInstance, field: 'amount', 'error')} ">
	<label class="col-lg-3 control-label" for="amount"> <g:message
			code="statementLine.amount.label" default="Amount" />

	</label>
	<div class="col-lg-9">
		<g:field name="amount"
			value="${fieldValue(bean: statementLineInstance, field: 'amount')}" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: statementLineInstance, field: 'amountFixed', 'error')} ">
	<label class="col-lg-3 control-label" for="amountFixed"> <g:message
			code="statementLine.amountFixed.label" default="Amount Fixed" />

	</label>
	<div class="col-lg-9">
		<g:field name="amountFixed"
			value="${fieldValue(bean: statementLineInstance, field: 'amountFixed')}" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: statementLineInstance, field: 'lineOrder', 'error')} required">
	<label class="col-lg-3 control-label" for="lineOrder"> <g:message
			code="statementLine.lineOrder.label" default="Line Order" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="col-lg-9">
		<g:field name="lineOrder" type="number"
			value="${statementLineInstance.lineOrder}" required="" />
	</div>
</div>
