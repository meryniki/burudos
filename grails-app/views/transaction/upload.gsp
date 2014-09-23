<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'transaction.label', default: 'transaction')}" />
<title><g:message code="default.upload.label"
		args="[entityName]" /></title>
</head>
<body>
	<div id="content" class="clearfix">
		<div class="contentwrapper">
			<div class="heading">

				<h3>
					<g:message code="transaction.btnLabel" args="[entityName]" />
				</h3>

				<div class="resBtnSearch">
					<a href="#"><span class="icon16 icomoon-icon-search-3"></span></a>
				</div>

				<ul class="breadcrumb">
					<li>You are here:</li>
					<li><a href="#" class="tip" title="" data-hasqtip="true">
							<span class="icon16 icomoon-icon-screen-2"></span>
					</a> <span class="divider"> <span
							class="icon16 icomoon-icon-arrow-right-3"></span>
					</span></li>
					<li class="active"><g:message code="transaction.upload.label"
							args="[entityName]" /></li>
				</ul>

			</div>

			<ul class="bigBtnIcon">
				<li><g:link class="create" action="create">
						<span class="icon icomoon-icon-plus"></span>
						<g:message code="default.new.label" args="[entityName]" />
					</g:link></li>
				<li><g:link class="create" action="">
						<span class="icon icomoon-icon-menu"></span>
						<g:message code="default.list.label" args="[entityName]" />
					</g:link></li>
			</ul>

			<div id="#upload-transaction" class="content scaffold-create"
				role="main">
				<h1>
					<g:message code="default.upload.label" args="[entityName]" />
				</h1>
				<g:link action="uploads">
					<g:message code="uploads.label" default="Ver Historial de Archivos Subidos" />
				</g:link>
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<g:hasErrors bean="${transactionInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${transactionInstance}" var="error">
							<li><g:if
									test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</g:hasErrors>
				<br/>
				<br/>
				<br/>
				<div class="row">

					<div class="col-lg-2"></div>

					<div class="col-lg-8">

						<g:uploadForm action="uploadFile" class="form-horizontal"
							role="form">
							<div class="form-group">
								<div>
									<label for="fileoption"> <g:message
											code="transaction.fileoption.label" default="Option" />
									</label> <label><g:radio name="type_file" value="ALTA"
											checked="true" onclick="show_altas_desc()" /> <g:message
											code="transaction.alta.label" /></label> <label><g:radio
											name="type_file" value="CATER" onclick="show_cater_desc()" />
										<g:message code="transaction.cater.label" /></label> <label><g:radio
											name="type_file" value="POSTVENTA"
											onclick="show_postventas_desc()" /> <g:message
											code="transaction.postventa.label" /></label> <label><g:radio
											name="type_file" value="BAJAS" onclick="show_bajas_desc()" />
										<g:message code="transaction.bajas.label" /></label> <label><g:radio
											name="type_file" value="FACTURACION"
											onclick="show_facturacion_desc()" /> <g:message
											code="transaction.facturacion.label" /></label> <label><g:radio
											name="type_file" value="PORTA" onclick="show_porta_desc()" />
										<g:message code="transaction.porta.label" /></label>
								</div>
								<label class="col-lg-3 control-label" for="fileinput"><g:message
										code="default.upload.file" /></label>
								<div class="col-lg-5">
									<div class="uploader" id="uniform-file">
										<input type="file" class="form-control" name="FileTransaction"
											id="file"> <span class="filename"
											style="-webkit-user-select: none;">Click <strong>here</strong>
											to Select
										</span><span class="action" style="-webkit-user-select: none;">Choose
											File</span>
									</div>
								</div>
								<g:submitButton name="uploadFile" type="submit"
									class="btn btn-info"
									value="${message(code: 'default.button.upload.label', default: 'uploadFile')}"
									onclick="showThinking()" />
							</div>
						</g:uploadForm>
					</div>
				</div>
				<br/>
				<br/>
				<br/>
				<div id="desc_altas" style="display: block">
					<h4>Descripcion de Archivo de ALTAS</h4>
					<table id="desc_table" cellpadding="0" cellspacing="0" border="0"
						class="tableTools display table table-bordered dataTable"
						width="80%" aria-describedby="DataTables_Table_1_info">
						<thead>
							<tr role="row">
								<th style="width: 20px;">Columna</th>
								<th style="width: 120px;">Dato</th>
								<th>Descripcion</th>
							</tr>
						</thead>
						<tbody role="alert" aria-live="polite" aria-relevant="all">
							<tr class="gradeA even">
								<td>A</td>
								<td>Agente</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>B</td>
								<td>POS Vendedor</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>C</td>
								<td>Activado</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>D</td>
								<td>SDS</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>E</td>
								<td>Activado</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>F</td>
								<td>ANI</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>G</td>
								<td>Porta</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>H</td>
								<td>Cliente</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>I</td>
								<td>Imei</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>J</td>
								<td>SIM</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>K</td>
								<td>Cat Plan</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>L</td>
								<td>Plan</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>M</td>
								<td>Promo</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>N</td>
								<td>Oferta</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>O</td>
								<td>Equipo</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>P</td>
								<td>Almacen</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>Q</td>
								<td>Cliente</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>R</td>
								<td>Nro Doc</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>S</td>
								<td>Cancel</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>T</td>
								<td>Ticket</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>U</td>
								<td>Legajo</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>V</td>
								<td>Factura</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>W</td>
								<td>Importe</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>X</td>
								<td>Plan</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>Y</td>
								<td>Deb Automatico</td>
								<td></td>
							</tr>
						</tbody>
					</table>

				</div>
				<div id="desc_bajas" style="display: none">
					<h4>Descripcion de Archivo de BAJAS</h4>
					<table id="desc_table" cellpadding="0" cellspacing="0" border="0"
						class="tableTools display table table-bordered dataTable"
						width="80%" aria-describedby="DataTables_Table_1_info">
						<thead>
							<tr role="row">
								<th style="width: 20px;">Columna</th>
								<th style="width: 120px;">Dato</th>
								<th>Descripcion</th>
							</tr>
						</thead>
						<tbody role="alert" aria-live="polite" aria-relevant="all">
							<tr class="gradeA even">
								<td>A</td>
								<td>Tipo de Evento</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>B</td>
								<td>Fecha Inicia</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>C</td>
								<td>Codigo Vendedor</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>D</td>
								<td>PIN</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>E</td>
								<td>Abonado</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>F</td>
								<td>Tipo Form</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>G</td>
								<td>Form</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>H</td>
								<td>Cuenta</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>I</td>
								<td>Vendedor</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>J</td>
								<td>Producto</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>K</td>
								<td>Estado</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>L</td>
								<td>Situacion Origen</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>M</td>
								<td>Descripción de serv. Origen</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>N</td>
								<td>Código de Plan Original</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>O</td>
								<td>Descripcion de Plan Original</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>P</td>
								<td>Cantidad</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>Q</td>
								<td>F. Baja</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>R</td>
								<td>Comision</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>S</td>
								<td>Acumulado</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>T</td>
								<td>Descripcion</td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="desc_cater" style="display: none">
					<h4>Descripcion de Archivo de CATER</h4>
					<table id="desc_table" cellpadding="0" cellspacing="0" border="0"
						class="tableTools display table table-bordered dataTable"
						width="80%" aria-describedby="DataTables_Table_1_info">
						<thead>
							<tr role="row">
								<th style="width: 20px;">Columna</th>
								<th style="width: 120px;">Dato</th>
								<th>Descripcion</th>
							</tr>
						</thead>
						<tbody role="alert" aria-live="polite" aria-relevant="all">
							<tr class="gradeA even">
								<td>A</td>
								<td>Agente</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>B</td>
								<td>OP_tipo</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>C</td>
								<td>Motivo</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>D</td>
								<td>POS</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>E</td>
								<td>Vendedor</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>F</td>
								<td>Fecha</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>G</td>
								<td>ANI</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>H</td>
								<td>SIM</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>I</td>
								<td>Imei</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>J</td>
								<td>Folio</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>K</td>
								<td>Plan</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>L</td>
								<td>Factura</td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="desc_facturacion" style="display: none">
					<h4>Descripcion de Archivo de FACTURACION</h4>
					<table id="desc_table" cellpadding="0" cellspacing="0" border="0"
						class="tableTools display table table-bordered dataTable"
						width="80%" aria-describedby="DataTables_Table_1_info">
						<thead>
							<tr role="row">
								<th style="width: 20px;">Columna</th>
								<th style="width: 120px;">Dato</th>
								<th>Descripcion</th>
							</tr>
						</thead>
						<tbody role="alert" aria-live="polite" aria-relevant="all">
							<tr class="gradeA even">
								<td>A</td>
								<td>Fecha</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>B</td>
								<td>Vendedor</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>C</td>
								<td>Tipo</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>D</td>
								<td>Factura</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>E</td>
								<td>Codigo</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>F</td>
								<td>Tipo</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>G</td>
								<td>Descripcion</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>H</td>
								<td>Modelo</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>I</td>
								<td>Blister</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>J</td>
								<td>Cantidad</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>K</td>
								<td>Neto</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>L</td>
								<td>Dcto</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>M</td>
								<td>Neto</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>N</td>
								<td>Iva</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>O</td>
								<td>Imp Int</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>P</td>
								<td>PercIIBB</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>Q</td>
								<td>Total</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>R</td>
								<td>Imei</td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="desc_porta" style="display: none">
					<h4>Descripcion de Archivo de PORTA</h4>
					<table id="desc_table" cellpadding="0" cellspacing="0" border="0"
						class="tableTools display table table-bordered dataTable"
						width="80%" aria-describedby="DataTables_Table_1_info">
						<thead>
							<tr role="row">
								<th style="width: 20px;">Columna</th>
								<th style="width: 120px;">Dato</th>
								<th>Descripcion</th>
							</tr>
						</thead>
						<tbody role="alert" aria-live="polite" aria-relevant="all">
							<tr class="gradeA even">
								<td>A</td>
								<td>Canal</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>B</td>
								<td>Vendedor</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>C</td>
								<td>Subvendedor</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>D</td>
								<td>Punto de Venta</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>E</td>
								<td>ANI</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>F</td>
								<td>Tipo de Form.</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>G</td>
								<td>Nro de formulario</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>H</td>
								<td>Tipo de formulario Alta</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>I</td>
								<td>Nro de formulario Alta</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>J</td>
								<td>Estado ALTA</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>K</td>
								<td>Usuario ALTA</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>L</td>
								<td>Fecha ALTA</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>M</td>
								<td>Estado Final IRIS</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>N</td>
								<td>Estado Final</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>O</td>
								<td>Codigo de Reclamo</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>P</td>
								<td>Subcodigo Reclamo</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>Q</td>
								<td>Descripcion</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>R</td>
								<td>Fecha Autorizacion</td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="desc_postventas" style="display: none">
					<h4>Descripcion de Archivo de POSTVENTAS</h4>
					<table id="desc_table" cellpadding="0" cellspacing="0" border="0"
						class="tableTools display table table-bordered dataTable"
						width="80%" aria-describedby="DataTables_Table_1_info">
						<thead>
							<tr role="row">
								<th style="width: 20px;">Columna</th>
								<th style="width: 120px;">Dato</th>
								<th>Descripcion</th>
							</tr>
						</thead>
						<tbody role="alert" aria-live="polite" aria-relevant="all">
							<tr class="gradeA even">
								<td>A</td>
								<td>Tipo</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>B</td>
								<td>POS</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>C</td>
								<td>Vendedor</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>D</td>
								<td>Fecha</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>E</td>
								<td>ID</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>F</td>
								<td>ANI</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>G</td>
								<td>Solicitud</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>H</td>
								<td>Servicio</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>I</td>
								<td>Plan</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>J</td>
								<td>Plan Antiguo</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>K</td>
								<td>Cliente</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>L</td>
								<td>Nro DOC</td>
								<td></td>
							</tr>
							<tr class="gradeA even">
								<td>M</td>
								<td>Cancel</td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				
			</div>
		</div>
	</div>
	<div id="thinking" style="display: none">
		<img src="../static/images/ajax-loader.gif" alt=""
			style="width: 100px;">
	</div>
</body>
</html>



