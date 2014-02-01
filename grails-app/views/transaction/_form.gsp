<%@ page import="ar.com.burudos.sales.Transaction" %>



<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'party', 'error')} required">
	<label for="party">
		<g:message code="transaction.party.label" default="Party" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="party" name="party.id" from="${ar.com.burudos.party.Party.list()}" optionKey="id" required="" value="${transactionInstance?.party?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'op', 'error')} required">
	<label for="op">
		<g:message code="transaction.op.label" default="Op" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="op" name="op.id" from="${ar.com.burudos.sales.Operation.list()}" optionKey="id" required="" value="${transactionInstance?.op?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'month', 'error')} required">
	<label for="month">
		<g:message code="transaction.month.label" default="Month" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="month" type="number" value="${transactionInstance.month}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="transaction.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantity" type="number" value="${transactionInstance.quantity}" required=""/>
</div>

