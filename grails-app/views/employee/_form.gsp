<%@ page import="ar.com.burudos.party.Employee" %>



<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'uid', 'error')} ">
	<label for="uid">
		<g:message code="employee.uid.label" default="Uid" />
		
	</label>
	<g:textField name="uid" value="${employeeInstance?.uid}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="employee.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${employeeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="employee.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${employeeInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'creationDate', 'error')} ">
	<label for="creationDate">
		<g:message code="employee.creationDate.label" default="Creation Date" />
		
	</label>
	<g:datePicker name="creationDate" precision="day"  value="${employeeInstance?.creationDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="employee.createdBy.label" default="Created By" />
		
	</label>
	<g:textField name="createdBy" value="${employeeInstance?.createdBy}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'lastUpdateDate', 'error')} ">
	<label for="lastUpdateDate">
		<g:message code="employee.lastUpdateDate.label" default="Last Update Date" />
		
	</label>
	<g:datePicker name="lastUpdateDate" precision="day"  value="${employeeInstance?.lastUpdateDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'lastUpdateBy', 'error')} ">
	<label for="lastUpdateBy">
		<g:message code="employee.lastUpdateBy.label" default="Last Update By" />
		
	</label>
	<g:textField name="lastUpdateBy" value="${employeeInstance?.lastUpdateBy}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'legajo', 'error')} ">
	<label for="legajo">
		<g:message code="employee.legajo.label" default="Legajo" />
		
	</label>
	<g:textField name="legajo" value="${employeeInstance?.legajo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'fullname', 'error')} ">
	<label for="fullname">
		<g:message code="employee.fullname.label" default="Fullname" />
		
	</label>
	<g:textField name="fullname" value="${employeeInstance?.fullname}"/>
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

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'dofingreso', 'error')} required">
	<label for="dofingreso">
		<g:message code="employee.dofingreso.label" default="Dofingreso" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dofingreso" precision="day"  value="${employeeInstance?.dofingreso}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'bu', 'error')} ">
	<label for="bu">
		<g:message code="employee.bu.label" default="Bu" />
		
	</label>
	<g:select id="bu" name="bu.id" from="${ar.com.burudos.business.BussinesUnit.list()}" optionKey="id" value="${employeeInstance?.bu?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'dofbirth', 'error')} ">
	<label for="dofbirth">
		<g:message code="employee.dofbirth.label" default="Dofbirth" />
		
	</label>
	<g:datePicker name="dofbirth" precision="day"  value="${employeeInstance?.dofbirth}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'isworker', 'error')} ">
	<label for="isworker">
		<g:message code="employee.isworker.label" default="Isworker" />
		
	</label>
	<g:checkBox name="isworker" value="${employeeInstance?.isworker}" />
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'iscoordinator', 'error')} ">
	<label for="iscoordinator">
		<g:message code="employee.iscoordinator.label" default="Iscoordinator" />
		
	</label>
	<g:checkBox name="iscoordinator" value="${employeeInstance?.iscoordinator}" />
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'basic', 'error')} required">
	<label for="basic">
		<g:message code="employee.basic.label" default="Basic" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="basic" type="number" value="${employeeInstance.basic}" required=""/>
</div>

