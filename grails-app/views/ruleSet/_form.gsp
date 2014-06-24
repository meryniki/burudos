<%@ page import="ar.com.burucps.drools.RuleSet"%>

<div
	class="form-group fieldcontain ${hasErrors(bean: ruleSetInstance, field: 'setName', 'error')} ">
	<label class="col-lg-3 control-label" for="setName"> <g:message
			code="ruleSet.setName.label" default="Set Name" />
	</label>
	<div class="col-lg-9">
		<g:textField name="setName" value="${ruleSetInstance?.setName}"
			class="form-control uniform-input text" autofocus="autofocus" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: ruleSetInstance, field: 'setDescription', 'error')} ">
	<label class="col-lg-3 control-label" for="setDescription"> <g:message
			code="ruleSet.setDescription.label" default="Set Description" />
	</label>
	<div class="col-lg-9">
		<g:textField name="setDescription"
			value="${ruleSetInstance?.setDescription}"
			class="form-control uniform-input text" />
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: ruleSetInstance, field: 'rules', 'error')} ">
	<label class="col-lg-3 control-label" for="rules"> <g:message
			code="ruleSet.rules.label" default="Rules" />
	</label>
	<div class="col-lg-9">
		<g:select name="rules" from="${ar.com.burucps.drools.Rule.list()}"
			multiple="multiple" optionKey="id" size="5"
			value="${ruleSetInstance?.rules*.id}" class="many-to-many"
			class="form-control uniform-input text" />
	</div>
</div>

