<%@ page import="ar.com.burudos.sales.Filter"%>

<div class="panel-heading">
	<h4>

		<span> <label align="center" id="filter_type" for="type">
				Tipo de Filtro <g:select name="type"
					from="${ar.com.burudos.sales.Filter_Type.values()}"
					value="${filterInstance?.type}" />
		</label>
		</span>
	</h4>
</div>
<br />
<div id="" class="col-lg-12">
	<div class="col-lg-6">

		<div
			class="form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'filterCode', 'error')} ">
			<label class="col-lg-3 control-label" for="filterCode"> <g:message
					code="filter.filterCode.label" default="Nombre del Filtro" />

			</label>
			<div class="col-lg-9">
				<g:textField name="filterCode" value="${filterInstance?.filterCode}" />
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'description', 'error')} ">
			<label class="col-lg-3 control-label" for="description"> <g:message
					code="filter.description.label" default="Description" />

			</label>
			<div class="col-lg-9">
				<g:textField name="description"
					value="${filterInstance?.description}" />
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'bu', 'error')} required">
			<label class="col-lg-3 control-label" for="bu"> <g:message
					code="filter.bu.label" default="Punto de Venta" /> <span
				class="required-indicator">*</span>
			</label>
			<div class="col-lg-9">
				<g:select id="bu" name="bu.id"
					from="${ar.com.burudos.business.BussinesUnit.list()}"
					optionKey="id" required="" value="${filterInstance?.bu?.id}"
					class="many-to-one" />
			</div>
		</div>

		<div
			class="tipo_where form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'op', 'error')} ">
			<label class="col-lg-3 control-label" for="op"> <g:message
					code="filter.op.label" default="Operacion" />

			</label>
			<div class="col-lg-9">
				<g:textField name="op" value="${filterInstance?.op}" />
			</div>

		</div>

		<div
			class=" tipo_where form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'sds', 'error')} ">
			<label class="col-lg-3 control-label" for="sds"> <g:message
					code="filter.sds.label" default="Sds" />

			</label>
			<div class="col-lg-9">
				<g:textField name="sds" value="${filterInstance?.sds}" />
			</div>
		</div>

		<div
			class="tipo_where form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'ani', 'error')} ">
			<label class="col-lg-3 control-label" for="ani"> <g:message
					code="filter.ani.label" default="Ani" />

			</label>
			<div class="col-lg-9">
				<g:textField name="ani" value="${filterInstance?.ani}" />
			</div>
		</div>
		<div
			class="tipo_where form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'imei', 'error')} ">
			<label class="col-lg-3 control-label" for="imei"> <g:message
					code="filter.imei.label" default="Imei" />

			</label>
			<div class="col-lg-9">
				<g:textField name="imei" value="${filterInstance?.imei}" />
			</div>
		</div>

		<div
			class="tipo_where form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'sim', 'error')} ">
			<label class="col-lg-3 control-label" for="sim"> <g:message
					code="filter.sim.label" default="Sim" />

			</label>
			<div class="col-lg-9">
				<g:textField name="sim" value="${filterInstance?.sim}" />
			</div>
		</div>

		<div
			class="tipo_where form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'folio', 'error')} ">
			<label class="col-lg-3 control-label" for="folio"> <g:message
					code="filter.folio.label" default="Folio" />

			</label>
			<div class="col-lg-9">
				<g:textField name="folio" value="${filterInstance?.folio}" />
			</div>
		</div>

		<div
			class="tipo_where form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'partida', 'error')} ">
			<label class="col-lg-3 control-label" for="partida"> <g:message
					code="filter.partida.label" default="Partida" />

			</label>
			<div class="col-lg-9">
				<g:textField name="partida" value="${filterInstance?.partida}" />
			</div>
		</div>

		<div
			class="tipo_where form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'equipo', 'error')} ">
			<label class="col-lg-3 control-label" for="equipo"> <g:message
					code="filter.equipo.label" default="Equipo" />

			</label>
			<div class="col-lg-9">
				<g:textField name="equipo" value="${filterInstance?.equipo}" />
			</div>
		</div>
		<div
			class="tipo_where form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'solicitud', 'error')} ">
			<label class="col-lg-3 control-label" for="solicitud"> <g:message
					code="filter.solicitud.label" default="Solicitud" />
			</label>
			<div class="col-lg-9">
				<g:textField name="solicitud" value="${filterInstance?.solicitud}" />
			</div>
		</div>
	</div>

	<div class="col-lg-6">
		<div
			class="tipo_where form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'cancel', 'error')} ">
			<label class="col-lg-3 control-label" for="cancel"> <g:message
					code="filter.cancel.label" default="Cancel" />

			</label>
			<div class="col-lg-9">
				<g:textField name="cancel" value="${filterInstance?.cancel}" />
			</div>
		</div>

		<div
			class="tipo_where form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'estado', 'error')} ">
			<label class="col-lg-3 control-label" for="estado"> <g:message
					code="filter.estado.label" default="Estado" />

			</label>
			<div class="col-lg-9">
				<g:textField name="estado" value="${filterInstance?.estado}" />
			</div>
		</div>

		<div
			class="tipo_where form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'factura', 'error')} ">
			<label class="col-lg-3 control-label" for="factura"> <g:message
					code="filter.factura.label" default="Factura" />

			</label>
			<div class="col-lg-9">
				<g:textField name="factura" value="${filterInstance?.factura}" />
			</div>
		</div>

		<div
			class="tipo_where form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'importe', 'error')} ">
			<label class="col-lg-3 control-label" for="importe"> <g:message
					code="filter.importe.label" default="Importe" />

			</label>
			<div class="col-lg-9">
				<g:textField name="importe" value="${filterInstance?.importe}" />
			</div>
		</div>


		<div
			class="tipo_where form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'plan_desc', 'error')} ">
			<label class="col-lg-3 control-label" for="plan_desc"> <g:message
					code="filter.plan_desc.label" default="Plandesc" />

			</label>
			<div class="col-lg-9">
				<g:textField name="plan_desc" value="${filterInstance?.plan_desc}" />
			</div>
		</div>

		<div
			class="tipo_where form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'debaut', 'error')} ">
			<label class="col-lg-3 control-label" for="debaut"> <g:message
					code="filter.debaut.label" default="Debaut" />

			</label>
			<div class="col-lg-9">
				<g:textField name="debaut" value="${filterInstance?.debaut}" />
			</div>
		</div>

		<div
			class="tipo_where form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'cat_plan', 'error')} ">
			<label class="col-lg-3 control-label" for="cat_plan"> <g:message
					code="filter.cat_plan.label" default="Categoria del Plan" />

			</label>
			<div class="col-lg-9">
				<g:textField name="cat_plan" value="${filterInstance?.cat_plan}" />
			</div>
		</div>

	    <div
			class="tipo_where form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'plan', 'error')} ">
			<label class="col-lg-3 control-label" for="plan"> <g:message
					code="filter.plan.label" default="Plan" />

			</label>
			<div class="col-lg-9">
				<g:textField name="plan" value="${filterInstance?.plan}" />
			</div>
		</div>
		
		<div
			class="tipo_where form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'servicio', 'error')} ">
			<label class="col-lg-3 control-label" for="servicio"> <g:message
					code="filter.servicio.label" default="servicio" />

			</label>
			<div class="col-lg-9">
				<g:textField name="servicio" value="${filterInstance?.servicio}" />
			</div>
		</div>
		<div
			class="tipo_where form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'plan_promo', 'error')} ">
			<label class="col-lg-3 control-label" for="plan_desc"> <g:message
					code="filter.plan_promo.label" default="Plan Promo" />

			</label>
			<div class="col-lg-9">
				<g:textField name="plan_promo" value="${filterInstance?.plan_promo}" />
			</div>
		</div>


		<div
			class="tipo_where form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'suma', 'error')} ">
			<label class="col-lg-3 control-label" for="suma"> <g:message
					code="filter.suma.label" default="Sumar por" />

			</label>
			<div class="col-lg-9">
				<g:textField name="suma" value="${filterInstance?.suma}" />
			</div>
		</div>
		
		<div class="tipo_advanced" style="display: none;">
			<div
			class="form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'advance_where', 'error')} ">
			<label class="col-lg-3 control-label" for="advance_where"> <g:message
					code="filter.advance.label" default="Where Avanzado" />

			</label>
			<div class="col-lg-9">
				<g:textField name="advance_where" value="${filterInstance?.advance_where}" />
			</div>
		</div>
		</div>

		<div class="tipo_sum" style="display: none;">
			<div
				class="form-group fieldcontain ${hasErrors(bean: filterInstance, field: 'filterCode', 'error')} ">
				<label class="col-lg-4 control-label" for="totals"> <g:message
						code="filter.totals.label" default="Totales a sumar:" />
				</label>
				<div class="col-lg-8">
					<g:select style="height:300px;" class="col-lg-9" name="totals"
						from="${ar.com.burudos.sales.Filter.list()}" optionKey="id"
						noSelection="['null': '']" multiple="true"
						value="${filterInstance?.totals*.filterCode}" />
				</div>
			</div>
		</div>

	</div>

</div>


<div id="" class="tipo_advanced col-lg-12" style="display: none;">
</div>

<div id="" class="tipo_query col-lg-12" style="display: none;"></div>