<%@ page import="ar.com.burudos.business.BussinesUnit"%>

<div
	class=" form-group fieldcontain ${hasErrors(bean: bussinesUnitInstance, field: 'code', 'error')} ">
	<label class="col-lg-3 control-label" for="code"> <g:message
			code="bussinesUnit.code.label" default="Code" />

	</label>
	<div class="col-lg-9">
		<g:textField name="code" value="${bussinesUnitInstance?.code}"
			class="form-control uniform-input text" autofocus="autofocus" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: bussinesUnitInstance, field: 'provincia', 'error')} ">
	<label class="col-lg-3 control-label" for="provincia"> <g:message
			code="bussinesUnit.provincia.label" default="Provincia" />

	</label>
	<div class="col-lg-9">
		<g:textField name="provincia"
			value="${bussinesUnitInstance?.provincia}"
			class="form-control uniform-input text" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: bussinesUnitInstance, field: 'departamento', 'error')} ">
	<label class="col-lg-3 control-label" for="departamento"> <g:message
			code="bussinesUnit.departamento.label" default="Departamento" />

	</label>
	<div class="col-lg-9">
		<g:textField name="departamento"
			value="${bussinesUnitInstance?.departamento}"
			class="form-control uniform-input text" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: bussinesUnitInstance, field: 'localidad', 'error')} ">
	<label class="col-lg-3 control-label" for="localidad"> <g:message
			code="bussinesUnit.localidad.label" default="Localidad" />

	</label>
	<div class="col-lg-9">
		<g:textField name="localidad"
			value="${bussinesUnitInstance?.localidad}"
			class="form-control uniform-input text" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: bussinesUnitInstance, field: 'calle', 'error')} ">
	<label class="col-lg-3 control-label" for="calle"> <g:message
			code="bussinesUnit.calle.label" default="Calle" />

	</label>
	<div class="col-lg-9">
		<g:textField name="calle" value="${bussinesUnitInstance?.calle}"
			class="form-control uniform-input text" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: bussinesUnitInstance, field: 'altura', 'error')} ">
	<label class="col-lg-3 control-label" for="altura"> <g:message
			code="bussinesUnit.altura.label" default="Altura" />

	</label>
	<div class="col-lg-9">
		<g:textField name="altura" value="${bussinesUnitInstance?.altura}"
			class="form-control uniform-input text" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: bussinesUnitInstance, field: 'nombre', 'error')} ">
	<label class="col-lg-3 control-label" for="nombre"> <g:message
			code="bussinesUnit.nombre.label" default="Nombre" />

	</label>
	<div class="col-lg-9">
		<g:textField name="nombre" value="${bussinesUnitInstance?.nombre}"
			class="form-control uniform-input text" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: bussinesUnitInstance, field: 'coordinator', 'error')} ">
	<label class="col-lg-3 control-label" for="coordinator"> <g:message
			code="bussinesUnit.coordinator.label" default="Coordinator" />

	</label>
	<div class="col-lg-9">
		<g:select id="coordinator" name="coordinator.id"
			from="${ar.com.burudos.party.Employee.list()}" optionKey="id"
			value="${bussinesUnitInstance?.coordinator?.id}" class="many-to-one"
			noSelection="['null': '']" />
	</div>
</div>

<div
	class=" form-group fieldcontain ${hasErrors(bean: bussinesUnitInstance, field: 'father', 'error')} ">
	<label class="col-lg-3 control-label" for="father"> <g:message
			code="bussinesUnit.father.label" default="Father" />

	</label>
	<div class="col-lg-9">
		<g:select id="father" name="father.id"
			from="${ar.com.burudos.business.BussinesUnit.list()}" optionKey="id"
			value="${bussinesUnitInstance?.father?.id}" class="many-to-one"
			noSelection="['null': '']" />
	</div>
</div>

