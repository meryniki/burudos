<%@ page import="ar.com.burudos.party.Employee" %>



<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'uid', 'error')} ">
	<label for="uid">
		<g:message code="employee.uid.label" default="Uid" />
		
	</label>
	<g:textField name="uid" value="${employeeInstance?.uid}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'employeenro', 'error')} ">
	<label for="employeenro">
		<g:message code="employee.employeenro.label" default="Employeenro" />
	</label>
	<g:textField name="employeenro" value="${employeeInstance?.employeenro}"/>
	<a onmouseover="nhpup.popup('<g:message code="employee.employeenro.help"/>');">?</a>
</div>
<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'names', 'error')} ">
	<label for="names">
		<g:message code="employee.names.label" default="Names" />
	</label>
	<g:textField name="names" value="${employeeInstance?.names}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'lastname', 'error')} ">
	<label for="lastname">
		<g:message code="employee.lastname.label" default="Lastname" />
	</label>
	<g:textField name="lastname" value="${employeeInstance?.lastname}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="employee.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${employeeInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'dofbirth', 'error')} required">
	<label for="dofbirth">
		<g:message code="employee.dofbirth.label" default="Dofbirth" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dofbirth" precision="day"  value="${employeeInstance?.dofbirth}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'bu', 'error')} ">
	<label for="bu">
		<g:message code="employee.bu.label" default="Bu" />
		
	</label>
	<g:select id="bu" name="bu.id" from="${ar.com.burudos.business.BussinesUnit.list()}" optionKey="id" value="${employeeInstance?.bu?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'isworker', 'error')} ">
	<label for="isworker">
		<g:message code="employee.isworker.label" default="Isworker" />
		
	</label>
	<g:checkBox name="isworker" value="${employeeInstance?.isworker}" />
	<a onmouseover="nhpup.popup('<g:message code="employee.isworker.help"/>');">?</a>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'iscoordinator', 'error')} ">
	<label for="iscoordinator">
		<g:message code="employee.iscoordinator.label" default="Iscoordinator" />
		
	</label>
	<g:checkBox name="iscoordinator" value="${employeeInstance?.iscoordinator}" />
	<a onmouseover="nhpup.popup('<g:message code="employee.iscoordinator.help"/>');">?</a>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'basic', 'error')} required">
	<label for="basic">
		<g:message code="employee.basic.label" default="Basic" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="basic" type="number" value="${employeeInstance.basic}" required=""/>
</div>



