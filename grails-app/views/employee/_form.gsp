<%@ page import="ar.com.burudos.party.Employee"%>

<div
	class=" form-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'uid', 'error')} ">
	<label class="col-lg-3 control-label" for="uid"> <g:message
			code="employee.uid.label" default="Uid" />
	</label>
	<div class="col-lg-9">
		<g:textField name="uid" value="${employeeInstance?.uid}"
			class="form-control uniform-input text" autofocus="autofocus" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'name', 'error')} ">
	<label class="col-lg-3 control-label" for="name"> <g:message
			code="employee.name.label" default="Name" />
	</label>
	<div class="col-lg-9">
		<g:textField name="name" value="${employeeInstance?.name}"
			class="form-control uniform-input text" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'names', 'error')} ">
	<label class="col-lg-3 control-label" for="names"> <g:message
			code="employee.names.label" default="Names" />
	</label>
	<div class="col-lg-9">
		<g:textField name="names" value="${employeeInstance?.names}"
			class="form-control uniform-input text" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'lastname', 'error')} ">
	<label class="col-lg-3 control-label" for="lastname"> <g:message
			code="employee.lastname.label" default="Lastname" />
	</label>
	<div class="col-lg-9">
		<g:textField name="lastname" value="${employeeInstance?.lastname}"
			class="form-control uniform-input text" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'dofbirth', 'error')} ">
	<label class="col-lg-3 control-label" for="dofbirth"> <g:message
			code="employee.dofbirth.label" default="Dofbirth" />
	</label>
	<div class="col-lg-9">
		<g:datePicker name="dofbirth" precision="day"
			value="${employeeInstance?.dofbirth}" years="${1900..2010}" default="none"
			noSelection="['': '']" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'email', 'error')} ">
	<label class="col-lg-3 control-label" for="email"> <g:message
			code="employee.email.label" default="Email" />
	</label>
	<div class="col-lg-9">
		<g:field type="email" name="email" value="${employeeInstance?.email}"
			class="form-control uniform-input text" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'legajo', 'error')} ">
	<label class="col-lg-3 control-label" for="legajo"> <g:message
			code="employee.legajo.label" default="Legajo" />
	</label>
	<div class="col-lg-9">
		<g:textField name="legajo" value="${employeeInstance?.legajo}"
			class="form-control uniform-input text" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'dofingreso', 'error')} required">
	<label class="col-lg-3 control-label" for="dofingreso"> <g:message
			code="employee.dofingreso.label" default="Dofingreso" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="col-lg-9">
		<g:datePicker name="dofingreso" precision="day"
			value="${employeeInstance?.dofingreso}" years="${1920..2020}"/>
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'iscoordinator', 'error')} ">
	<label class="col-lg-3 control-label" for="iscoordinator"> <g:message
			code="employee.iscoordinator.label" default="Iscoordinator" />
	</label>
	<div class="col-lg-9">
		<g:checkBox name="iscoordinator"
			value="${employeeInstance?.iscoordinator}" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'isworker', 'error')} ">
	<label class="col-lg-3 control-label" for="isworker"> <g:message
			code="employee.isworker.label" default="Isworker" />
	</label>
	<div class="col-lg-9">
		<g:checkBox name="isworker" value="${employeeInstance?.isworker}" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'bu', 'error')} ">
	<label class="col-lg-3 control-label" for="bu"> <g:message
			code="employee.bu.label" default="Bu" />
	</label>
	<div class="col-lg-9">
		<g:select id="bu" name="bu.id"
			from="${ar.com.burudos.business.BussinesUnit.list()}" optionKey="id"
			value="${employeeInstance?.bu?.id}" class="many-to-one"
			noSelection="['null': '']" />
		<span class="help-block blue span8">Donde realiza las ventas</span>
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'statementRules', 'error')} ">
	<label class="col-lg-3 control-label" for="statementRules"> <g:message
			code="employee.statementRules.label" default="Statement Rules" />
	</label>
	<div class="col-lg-9">
		<g:select id="statementRules" name="statementRules.id"
			from="${ar.com.burucps.drools.RuleSet.list()}" optionKey="id"
			value="${employeeInstance?.statementRules?.id}" class="many-to-one"
			noSelection="['null': '']" />
		<span class="help-block blue span8">Tipo de liquidación para le empleado</span>
	</div>
</div>