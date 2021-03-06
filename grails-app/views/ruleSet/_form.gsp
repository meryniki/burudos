<%@ page import="ar.com.burucps.drools.RuleSet"%>

<div
	class="form-group fieldcontain ${hasErrors(bean: ruleSetInstance, field: 'ruleSetName', 'error')} ">
	<label class="col-lg-3 control-label" for="setName"> <g:message
			code="ruleSet.ruleSetName.label" default="Rule Set Name" />
	</label>
	<div class="col-lg-9">
		<g:textField name="ruleSetName"
			value="${ruleSetInstance?.ruleSetName}"
			class="form-control uniform-input text" autofocus="autofocus" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: ruleSetInstance, field: 'ruleSetDescription', 'error')} ">
	<label class="col-lg-3 control-label" for="ruleSetDescription">
		<g:message code="ruleSet.ruleSetDescription.label"
			default="Rule Set Description" />
	</label>
	<div class="col-lg-9">
		<g:textField name="ruleSetDescription"
			value="${ruleSetInstance?.ruleSetDescription}"
			class="form-control uniform-input text" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: ruleSetInstance, field: 'statementTemplate', 'error')} required">
	<label class="col-lg-3 control-label" for="dialect"> <g:message
			code="ruleSet.statementTemplate.label" default="Statement Template" />
	</label>
	<div class="col-lg-9">
		<g:select name="dialect" class="form-control uniform-input text"
			optionValue="${ {name->g.message(code: name) } }"
			from="${ar.com.burucps.sales.statement.StatementTemplate.values()}"
			keys="${ar.com.burucps.sales.statement.StatementTemplate.values()*.name()}"
			value="${ruleSetInstance?.statementTemplate?.name()}" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: ruleSetInstance, field: 'ruleSetPackage', 'error')} ">
	<label class="col-lg-3 control-label" for="ruleSetPackage"> <g:message
			code="ruleSet.ruleSetPackage.label" default="Rule Set Package" />
	</label>
	<div class="col-lg-9">
		<g:textField name="ruleSetPackage"
			value="${ruleSetInstance?.ruleSetPackage}"
			class="form-control uniform-input text" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: ruleSetInstance, field: 'ruleSetImports', 'error')} ">
	<label class="col-lg-3 control-label" for="ruleSetImports"> <g:message
			code="ruleSet.ruleSetImports.label" default="Rule Set Imports" />
	</label>
	<div class="col-lg-9">
		<g:textArea name="ruleSetImports"
			class="form-control uniform-input text"
			value="${ruleSetInstance?.ruleSetImports}" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: ruleSetInstance, field: 'ruleSetGlobals', 'error')} ">
	<label class="col-lg-3 control-label" for="ruleSetGlobals"> <g:message
			code="ruleSet.ruleCondition.label" default="Rule Set Globals" />
	</label>
	<div class="col-lg-9">
		<g:textArea name="ruleSetGlobals"
			class="form-control uniform-input text"
			value="${ruleSetInstance?.ruleSetGlobals}" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: ruleSetInstance, field: 'rules', 'error')} ">
	<label class="col-lg-3 control-label" for="rules"> <g:message
			code="ruleSet.rules.label" default="Rules" />
	</label>
	<div class="col-lg-9">
		<g:select id="rule-set-selector" name="rules" from="${ar.com.burucps.drools.Rule.list()}"
			multiple="multiple" optionKey="id" size="5"
			value="${ruleSetInstance?.rules*.id}" class="many-to-many"
			class="form-control uniform-input text rule-list-selector" />
	</div>
</div>

