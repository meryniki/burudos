<%@ page import="ar.com.burudos.sales.Filter"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'summary.label', default: 'summary')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	<div id="content" class="clearfix">
		<div class="contentwrapper">
			<div class="heading">

				<h3>
					<g:message code="summary.btnLabel" args="[entityName]" />
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
					<li class="active"><g:message code="filter.show.label"
							args="[entityName]" /></li>
				</ul>

			</div>

			<ul class="bigBtnIcon">
				<li><g:link class="create" action="create">
						<span class="icon icomoon-icon-plus"></span>
						<g:message code="default.new.label" args="[entityName]" />
					</g:link></li>
			</ul>



			<div class="row">

				<div class="col-lg-2"></div>

				<div class="col-lg-8">
					<div id="show-filter" class="content scaffold-show" role="main">
						<h1>
							<g:message code="default.show.label" args="[entityName]" />
						</h1>
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>

						<div class="panel panel-default">

							<div class="panel-heading">
								<h4>
									<span><g:message code="filter.show.label"
											args="[entityName]" /></span>
								</h4>
							</div>
							<div class="panel-body">

								<ul class="col-lg-12">


									<g:if test="${filterInstance?.filterCode}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="filter.filterCode.label" default="Nombre" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
											<g:fieldValue bean="${filterInstance}" field="filterCode" /></span></li>
									</g:if>

									<g:if test="${filterInstance?.description}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="filter.description.label" default="Description" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
											<g:fieldValue bean="${filterInstance}" field="description" /></span></li>
									</g:if>

									<g:if test="${filterInstance?.bu}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="filter.bu.label" default="Bu" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
											<g:link controller="bussinesUnit" action="show"
												id="${filterInstance?.bu?.id}">
												${filterInstance?.bu?.encodeAsHTML()}
											</g:link></span></li>
									</g:if>

									<g:if test="${filterInstance?.op}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="filter.op.label" default="Op" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
											<g:link controller="operation" action="show"
												id="${filterInstance?.op?.id}">
												${filterInstance?.op?.encodeAsHTML()}
											</g:link></span></li>
									</g:if>

									<g:if test="${filterInstance?.sds}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="filter.sds.label" default="Sds" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
											<g:fieldValue bean="${filterInstance}" field="sds" /></span></li>
									</g:if>

									<g:if test="${filterInstance?.ani}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="filter.ani.label" default="Ani" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
											<g:fieldValue bean="${filterInstance}" field="ani" /></span></li>
									</g:if>

									<g:if test="${filterInstance?.imei}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="filter.imei.label" default="Imei" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
											<g:fieldValue bean="${filterInstance}" field="imei" /></span></li>
									</g:if>

									<g:if test="${filterInstance?.sim}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="filter.sim.label" default="Sim" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
											<g:fieldValue bean="${filterInstance}" field="sim" /></span></li>
									</g:if>

									<g:if test="${filterInstance?.folio}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="filter.folio.label" default="Folio" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
											<g:fieldValue bean="${filterInstance}" field="folio" /></span></li>
									</g:if>

									<g:if test="${filterInstance?.partida}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="filter.partida.label" default="Partida" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
											<g:fieldValue bean="${filterInstance}" field="partida" /></li>
									</g:if>

									<g:if test="${filterInstance?.equipo}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="filter.equipo.label" default="Equipo" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
											<g:fieldValue bean="${filterInstance}" field="equipo" /></li>
									</g:if>

									<g:if test="${filterInstance?.solicitud}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="filter.solicitud.label" default="Solicitud" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
											<g:fieldValue bean="${filterInstance}" field="solicitud" /></li>
									</g:if>

									<g:if test="${filterInstance?.cancel}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="filter.cancel.label" default="Cancel" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
											<g:fieldValue bean="${filterInstance}" field="cancel" /></li>
									</g:if>

									<g:if test="${filterInstance?.estado}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="filter.estado.label" default="Estado" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
											<g:fieldValue bean="${filterInstance}" field="estado" /></li>
									</g:if>

									<g:if test="${filterInstance?.factura}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="filter.factura.label" default="Factura" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
											<g:fieldValue bean="${filterInstance}" field="factura" /></li>
									</g:if>

									<g:if test="${filterInstance?.importe}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="filter.importe.label" default="Importe" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
											<g:fieldValue bean="${filterInstance}" field="importe" /></li>
									</g:if>

									<g:if test="${filterInstance?.plan_desc}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="filter.plan_desc.label" default="Plandesc" /></span> <span
											class="property-value" aria-labelledby="plan_desc-label"><g:fieldValue
													bean="${filterInstance}" field="plan_desc" /></span></li>
									</g:if>

									<g:if test="${filterInstance?.debaut}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="filter.debaut.label" default="Debaut" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
											<g:fieldValue bean="${filterInstance}" field="debaut" /></span></li>
									</g:if>

									<g:if test="${filterInstance?.validMonth}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="filter.validMonth.label" default="Month" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
											<g:formatDate date="${filterInstance?.validMonth}" /></span></li>
									</g:if>

								</ul>
								<ul class="bigBtnIcon" style="display: -webkit-box;">
									<li><g:link class="edit" action="edit"
											resource="${filterInstance}">
											<span class="icon icomoon-icon-pencil"></span>
											<g:message code="default.button.edit.label" default="Edit" />
										</g:link></li>
									<li><g:link class="delete" action="delete"
											value="${message(code: 'default.button.delete.label', default: 'Delete')}"
											resource="${filterInstance}"
											onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
											<span class="icon icomoon-icon-backspace"></span>
											<g:message code="default.button.delete.label"
												default="Delete" />
										</g:link></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>