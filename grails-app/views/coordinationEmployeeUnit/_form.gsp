<%@ page import="ar.com.burudos.business.CoordinationEmployeeUnit" %>



<div class="fieldcontain ${hasErrors(bean: coordinationEmployeeUnitInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="coordinationEmployeeUnit.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="role" name="role.id" from="${ar.com.burudos.business.BussinesUnit.list()}" optionKey="id" required="" value="${coordinationEmployeeUnitInstance?.role?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: coordinationEmployeeUnitInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="coordinationEmployeeUnit.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${ar.com.burudos.party.Employee.list()}" optionKey="id" required="" value="${coordinationEmployeeUnitInstance?.user?.id}" class="many-to-one"/>
</div>

