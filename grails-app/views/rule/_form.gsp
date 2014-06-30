<%@ page import="ar.com.burucps.drools.Rule"%>

<div
	class="form-group  fieldcontain ${hasErrors(bean: ruleInstance, field: 'ruleName', 'error')} ">
	<label class="col-lg-3 control-label" for="ruleName"> <g:message
			code="rule.ruleName.label" default="Rule Name" />
	</label>
	<div class="col-lg-9">
		<g:textField name="ruleName" value="${ruleInstance?.ruleName}"
			class="form-control uniform-input text" autofocus="autofocus" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: ruleInstance, field: 'dialect', 'error')} required">
	<label class="col-lg-3 control-label" for="dialect"> <g:message
			code="rule.dialect.label" default="Dialect" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="col-lg-9">
		<g:select name="dialect" class="form-control uniform-input text"
			from="${ar.com.burucps.drools.RuleDialect?.values()}"
			keys="${ar.com.burucps.drools.RuleDialect.values()*.name()}"
			required="" value="${ruleInstance?.dialect?.name()}" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: ruleInstance, field: 'salience', 'error')} ">
	<label class="col-lg-3 control-label" for="salience"> <g:message
			code="rule.salience.label" default="Salience" />
	</label>
	<div class="col-lg-9">
		<g:field name="salience" type="number"
			class="form-control uniform-input text"
			value="${ruleInstance.salience}" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: ruleInstance, field: 'ruleCondition', 'error')} ">
	<label class="col-lg-3 control-label" for="ruleCondition"> <g:message
			code="rule.ruleCondition.label" default="Rule Condition" />
	</label>
	<div class="col-lg-9">
		<g:textArea name="ruleCondition"
			class="form-control uniform-input text"
			value="${ruleInstance?.ruleCondition}" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: ruleInstance, field: 'ruleConsequence', 'error')} ">
	<label class="col-lg-3 control-label" for="ruleConsequence"> <g:message
			code="rule.ruleConsequence.label" default="Rule Consequence" />
	</label>
	<div class="col-lg-9">
		<g:textArea name="ruleConsequence"
			class="form-control uniform-input text"
			value="${ruleInstance?.ruleConsequence}" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: ruleInstance, field: 'ruleGroup', 'error')} required">
	<label class="col-lg-3 control-label" for="ruleGroup"> <g:message
			code="rule.ruleGroup.label" default="Rule Group" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="col-lg-9">
		<g:select name="ruleGroup" class="form-control uniform-input text"
			optionValue="${ {name->g.message(code: name) } }"
			from="${ar.com.burucps.sales.statement.StatementLineGroup?.values()}"
			keys="${ar.com.burucps.sales.statement.StatementLineGroup.values()*.name()}"
			required="" value="${ruleInstance?.ruleGroup?.name()}" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: ruleInstance, field: 'active', 'error')} ">
	<div class="col-lg-offset-3 col-lg-9">
		<div class="checkbox">
			<label for="active"> <g:checkBox
					name="active" value="${ruleInstance?.active}" /> <g:message
					code="rule.active.label" default="Active" />
			</label>
		</div>
	</div>
</div>
