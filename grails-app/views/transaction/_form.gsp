<%@ page import="ar.com.burudos.sales.Transaction"%>

<div
	class=" form-group fieldcontain ${hasErrors(bean: transactionInstance, field: 'party', 'error')} required">
	<label class="col-lg-3 control-label" for="party"> <g:message
			code="transaction.party.label" default="Party" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="col-lg-9">
		<g:select id="party" name="party.id"
			from="${ar.com.burudos.party.Party.list()}" optionKey="id"
			required="" value="${transactionInstance?.party?.id}"
			class="many-to-one" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: transactionInstance, field: 'op', 'error')} required">
	<label class="col-lg-3 control-label" for="op"> <g:message
			code="transaction.op.label" default="Op" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="col-lg-9">
		<g:select id="op" name="op.id"
			from="${ar.com.burudos.sales.Operation.list()}" optionKey="id"
			required="" value="${transactionInstance?.op?.id}"
			class="many-to-one" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: transactionInstance, field: 'datet', 'error')} required">
	<label class="col-lg-3 control-label" for="date"> <g:message
			code="transaction.date.label" default="Date" /> <span
		class="required-indicator">*</span>
	</label>
	<div class="col-lg-9">
		<g:datePicker name="date" precision="day"
			value="${transactionInstance?.date}" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: transactionInstance, field: 'sds', 'error')} ">
	<label class="col-lg-3 control-label" for="sds"> <g:message
			code="transaction.sds.label" default="Sds" />

	</label>
	<div class="col-lg-9">
		<g:textField name="sds" value="${transactionInstance?.sds}" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: transactionInstance, field: 'ani', 'error')} ">
	<label class="col-lg-3 control-label" for="ani"> <g:message
			code="transaction.ani.label" default="Ani" />

	</label>
	<div class="col-lg-9">
		<g:textField name="ani" value="${transactionInstance?.ani}" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: transactionInstance, field: 'imei', 'error')} ">
	<label class="col-lg-3 control-label" for="imei"> <g:message
			code="transaction.imei.label" default="Imei" />

	</label>
	<div class="col-lg-9">
		<g:textField name="imei" value="${transactionInstance?.imei}" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: transactionInstance, field: 'sim', 'error')} ">
	<label class="col-lg-3 control-label" for="sim"> <g:message
			code="transaction.sim.label" default="Sim" />

	</label>
	<div class="col-lg-9">
		<g:textField name="sim" value="${transactionInstance?.sim}" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: transactionInstance, field: 'folio', 'error')} ">
	<label class="col-lg-3 control-label" for="folio"> <g:message
			code="transaction.folio.label" default="Folio" />

	</label>
	<div class="col-lg-9">
		<g:textField name="folio" value="${transactionInstance?.folio}" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: transactionInstance, field: 'partida', 'error')} ">
	<label class="col-lg-3 control-label" for="partida"> <g:message
			code="transaction.partida.label" default="Partida" />

	</label>
	<div class="col-lg-9">
		<g:textField name="partida" value="${transactionInstance?.partida}" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: transactionInstance, field: 'equipo', 'error')} ">
	<label class="col-lg-3 control-label" for="equipo"> <g:message
			code="transaction.equipo.label" default="Equipo" />

	</label>
	<div class="col-lg-9">
		<g:textField name="equipo" value="${transactionInstance?.equipo}" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: transactionInstance, field: 'almacen', 'error')} ">
	<label class="col-lg-3 control-label" for="almacen"> <g:message
			code="transaction.almacen.label" default="Almacen" />

	</label>
	<div class="col-lg-9">
		<g:select id="almacen" name="almacen.id"
			from="${ar.com.burudos.business.BussinesUnit.list()}" optionKey="id"
			value="${transactionInstance?.almacen?.id}" class="many-to-one"
			noSelection="['null': '']" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: transactionInstance, field: 'cliente', 'error')} ">
	<label class="col-lg-3 control-label" for="cliente"> <g:message
			code="transaction.cliente.label" default="Cliente" />

	</label>
	<div class="col-lg-9">
		<g:select id="cliente" name="cliente.id"
			from="${ar.com.burudos.party.Client.list()}" optionKey="id"
			value="${transactionInstance?.cliente?.id}" class="many-to-one"
			noSelection="['null': '']" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: transactionInstance, field: 'cancel', 'error')} ">
	<label class="col-lg-3 control-label" l for="cancel"> <g:message
			code="transaction.cancel.label" default="Cancel" />
	</label>
	<div class="col-lg-9">
		<g:textField name="cancel" value="${transactionInstance?.cancel}" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: transactionInstance, field: 'estado', 'error')} ">
	<label class="col-lg-3 control-label" for="estado"> <g:message
			code="transaction.estado.label" default="Estado" />

	</label>
	<div class="col-lg-9">
		<g:textField name="estado" value="${transactionInstance?.estado}" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: transactionInstance, field: 'factura', 'error')} ">
	<label class="col-lg-3 control-label" for="factura"> <g:message
			code="transaction.factura.label" default="Factura" />

	</label>
	<div class="col-lg-9">
		<g:textField name="factura" value="${transactionInstance?.factura}" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: transactionInstance, field: 'importe', 'error')} ">
	<label class="col-lg-3 control-label" for="importe"> <g:message
			code="transaction.importe.label" default="Importe" />

	</label>
	<div class="col-lg-9">
		<g:textField name="importe" value="${transactionInstance?.importe}" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: transactionInstance, field: 'plan_desc', 'error')} ">
	<label class="col-lg-3 control-label" for="plan_desc"> <g:message
			code="transaction.plan_desc.label" default="Plandesc" />

	</label>
	<div class="col-lg-9">
		<g:textField name="plan_desc"
			value="${transactionInstance?.plan_desc}" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: transactionInstance, field: 'plan', 'error')} ">
	<label class="col-lg-3 control-label" for="plan"> <g:message
			code="transaction.plan.label" default="Plan" />

	</label>
	<div class="col-lg-9">
		<g:textField name="plan"
			value="${transactionInstance?.plan}" />
	</div>
</div>


<div
	class=" form-group fieldcontain ${hasErrors(bean: transactionInstance, field: 'debaut', 'error')} ">
	<label class="col-lg-3 control-label" for="debaut"> <g:message
			code="transaction.debaut.label" default="Debaut" />

	</label>
	<div class="col-lg-9">
		<g:textField name="debaut" value="${transactionInstance?.debaut}" />
	</div>
</div>

