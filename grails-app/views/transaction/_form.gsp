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

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="transaction.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${transactionInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'sds', 'error')} ">
	<label for="sds">
		<g:message code="transaction.sds.label" default="Sds" />
		
	</label>
	<g:textField name="sds" value="${transactionInstance?.sds}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'ani', 'error')} ">
	<label for="ani">
		<g:message code="transaction.ani.label" default="Ani" />
		
	</label>
	<g:textField name="ani" value="${transactionInstance?.ani}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'imei', 'error')} ">
	<label for="imei">
		<g:message code="transaction.imei.label" default="Imei" />
		
	</label>
	<g:textField name="imei" value="${transactionInstance?.imei}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'sim', 'error')} ">
	<label for="sim">
		<g:message code="transaction.sim.label" default="Sim" />
		
	</label>
	<g:textField name="sim" value="${transactionInstance?.sim}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'folio', 'error')} ">
	<label for="folio">
		<g:message code="transaction.folio.label" default="Folio" />
		
	</label>
	<g:textField name="folio" value="${transactionInstance?.folio}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'partida', 'error')} ">
	<label for="partida">
		<g:message code="transaction.partida.label" default="Partida" />
		
	</label>
	<g:textField name="partida" value="${transactionInstance?.partida}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'equipo', 'error')} ">
	<label for="equipo">
		<g:message code="transaction.equipo.label" default="Equipo" />
		
	</label>
	<g:textField name="equipo" value="${transactionInstance?.equipo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'almacen', 'error')} ">
	<label for="almacen">
		<g:message code="transaction.almacen.label" default="Almacen" />
		
	</label>
	<g:select id="almacen" name="almacen.id" from="${ar.com.burudos.business.BussinesUnit.list()}" optionKey="id" value="${transactionInstance?.almacen?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'cliente', 'error')} ">
	<label for="cliente">
		<g:message code="transaction.cliente.label" default="Cliente" />
		
	</label>
	<g:select id="cliente" name="cliente.id" from="${ar.com.burudos.party.Client.list()}" optionKey="id" value="${transactionInstance?.cliente?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'cancel', 'error')} ">
	<label for="cancel">
		<g:message code="transaction.cancel.label" default="Cancel" />
		
	</label>
	<g:textField name="cancel" value="${transactionInstance?.cancel}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'estado', 'error')} ">
	<label for="estado">
		<g:message code="transaction.estado.label" default="Estado" />
		
	</label>
	<g:textField name="estado" value="${transactionInstance?.estado}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'factura', 'error')} ">
	<label for="factura">
		<g:message code="transaction.factura.label" default="Factura" />
		
	</label>
	<g:textField name="factura" value="${transactionInstance?.factura}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'importe', 'error')} ">
	<label for="importe">
		<g:message code="transaction.importe.label" default="Importe" />
		
	</label>
	<g:textField name="importe" value="${transactionInstance?.importe}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'plan_desc', 'error')} ">
	<label for="plan_desc">
		<g:message code="transaction.plan_desc.label" default="Plandesc" />
		
	</label>
	<g:textField name="plan_desc" value="${transactionInstance?.plan_desc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'debaut', 'error')} ">
	<label for="debaut">
		<g:message code="transaction.debaut.label" default="Debaut" />
		
	</label>
	<g:textField name="debaut" value="${transactionInstance?.debaut}"/>
</div>

