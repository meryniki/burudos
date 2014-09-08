
<%@ page import="ar.com.burudos.sales.Transaction"%>
<
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'transaction.label', default: 'transaction')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
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
					<li class="active"><g:message code="transaction.show.label"
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
				<li><g:link class="create" action="upload">
						<span class="icon icomoon-icon-table"></span>
						<g:message code="default.upload.label" args="[entityName]" />
					</g:link></li>
			</ul>



			<div class="row">

				<div class="col-lg-2"></div>

				<div class="col-lg-8">

					<div id="show-transaction" class="content scaffold-show"
						role="main">
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
									<span><g:message code="transaction.show.label"
											args="[entityName]" /></span>
								</h4>
							</div>
							<div class="panel-body">

								<ul class="col-lg-12">
									<g:if test="${transactionInstance?.party}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="transaction.party.label" default="Party" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"> <g:link controller="employee"
													action="show" id="${transactionInstance?.party?.id}">
													${transactionInstance?.party?.encodeAsHTML()}
												</g:link></span></li>
									</g:if>

									<g:if test="${transactionInstance?.op}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="transaction.op.label" default="Op" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"> <g:link controller="operation"
													action="show" id="${transactionInstance?.op?.id}">
													${transactionInstance?.op?.encodeAsHTML()}
												</g:link></span></li>
									</g:if>

									<g:if test="${transactionInstance?.datet}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="transaction.date.label" default="Date" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"> <g:formatDate
													date="${transactionInstance?.datet}" /></span></li>
									</g:if>

									<g:if test="${transactionInstance?.sds}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="transaction.sds.label" default="Sds" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"> <g:fieldValue
													bean="${transactionInstance}" field="sds" /></span></li>
									</g:if>

									<g:if test="${transactionInstance?.ani}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="transaction.ani.label" default="Ani" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"> <g:fieldValue
													bean="${transactionInstance}" field="ani" /></span></li>
									</g:if>

									<g:if test="${transactionInstance?.imei}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="transaction.imei.label" default="Imei" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"> <g:fieldValue
													bean="${transactionInstance}" field="imei" /></span></li>
									</g:if>

									<g:if test="${transactionInstance?.sim}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="transaction.sim.label" default="Sim" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"> <g:fieldValue
													bean="${transactionInstance}" field="sim" /></span></li>
									</g:if>

									<g:if test="${transactionInstance?.folio}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="transaction.folio.label" default="Folio" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"> <g:fieldValue
													bean="${transactionInstance}" field="folio" /></span></li>
									</g:if>

									<g:if test="${transactionInstance?.partida}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="transaction.partida.label" default="Partida" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"> <g:fieldValue
													bean="${transactionInstance}" field="partida" /></span></li>
									</g:if>

									<g:if test="${transactionInstance?.equipo}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="transaction.equipo.label" default="Equipo" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"> <g:fieldValue
													bean="${transactionInstance}" field="equipo" /></span></li>
									</g:if>

									<g:if test="${transactionInstance?.almacen}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="transaction.almacen.label" default="Almacen" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"> <g:link controller="bussinesUnit"
													action="show" id="${transactionInstance?.almacen?.id}">
													${transactionInstance?.almacen?.encodeAsHTML()}
												</g:link></span></li>
									</g:if>

									<g:if test="${transactionInstance?.cliente}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="transaction.cliente.label" default="Cliente" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"> <g:link controller="client"
													action="show" id="${transactionInstance?.cliente?.id}">
													${transactionInstance?.cliente?.encodeAsHTML()}
												</g:link></span></li>
									</g:if>

									<g:if test="${transactionInstance?.cancel}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="transaction.cancel.label" default="Cancel" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"> <g:fieldValue
													bean="${transactionInstance}" field="cancel" /></span></li>
									</g:if>

									<g:if test="${transactionInstance?.estado}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="transaction.estado.label" default="Estado" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"> <g:fieldValue
													bean="${transactionInstance}" field="estado" /></span></li>
									</g:if>

									<g:if test="${transactionInstance?.factura}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="transaction.factura.label" default="Factura" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"> <g:fieldValue
													bean="${transactionInstance}" field="factura" /></span></li>
									</g:if>

									<g:if test="${transactionInstance?.importe}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="transaction.importe.label" default="Importe" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"> <g:fieldValue
													bean="${transactionInstance}" field="importe" /></span></li>
									</g:if>

									<g:if test="${transactionInstance?.plan_desc}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="transaction.plan_desc.label" default="Plandesc" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"> <g:fieldValue
													bean="${transactionInstance}" field="plan_desc" /></span></li>
									</g:if>

									<g:if test="${transactionInstance?.cat_plan}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="transaction.cat_plan.label"
													default="Categoria del Plan" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"> <g:fieldValue
													bean="${transactionInstance}" field="cat_plan" /></span></li>
									</g:if>

									<g:if test="${transactionInstance?.plan_promo}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="transaction.plan_promo.label"
													default="Plan Promo o Estado 2" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"> <g:fieldValue
													bean="${transactionInstance}" field="plan_promo" /></span></li>
									</g:if>


									<g:if test="${transactionInstance?.debaut}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="transaction.debaut.label" default="Debaut" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"> <g:fieldValue
													bean="${transactionInstance}" field="debaut" /></span></li>
									</g:if>


									<g:if test="${transactionInstance?.plan}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="transaction.plan.label" default="Plan" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"> <g:fieldValue
													bean="${transactionInstance}" field="plan" /></span></li>
									</g:if>
								</ul>

								<ul class="bigBtnIcon" style="display: -webkit-box;">
									<li><g:link class="edit" action="edit"
											resource="${transactionInstance}">
											<span class="icon icomoon-icon-pencil"></span>
											<g:message code="default.button.edit.label" default="Edit" />
										</g:link></li>
									<li><g:link class="delete" action="delete"
											value="${message(code: 'default.button.delete.label', default: 'Delete')}"
											resource="${transactionInstance}"
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
