<%@ page import="ar.com.burudos.sales.statement.Statement"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">

<g:set var="entityName"
	value="${message(code: 'statement.label', default: 'Statement')}" />

<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div id="content" class="clearfix">
		<div class="contentwrapper">
			<div class="heading">

				<h3>
					<g:message code="statement.btnLabel" args="[entityName]" />
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
					<li class="active"><g:message code="statement.show.label"
							args="[entityName]" /></li>
				</ul>

			</div>

			<ul class="bigBtnIcon">
				<li><g:link class="create" action="">
						<span class="icon icomoon-icon-menu"></span>
						<g:message code="default.list.label" args="[entityName]" />
					</g:link></li>
			</ul>

			<div class="row">

				<div class="col-lg-2"></div>

				<div class="col-lg-8">
					<div id="show-statement" class="content scaffold-show" role="main">
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>
						<ol class="property-list statement">

							<g:if test="${statementInstance?.statementPeriod}">
								<li class="fieldcontain"><span id="statementPeriod-label"
									class="property-label"><g:message
											code="statement.statementPeriod.label"
											default="Statement Period" /></span> <span class="property-value"
									aria-labelledby="statementPeriod-label"><g:formatDate
											date="${statementInstance?.statementPeriod}" /></span></li>
							</g:if>

							<g:if test="${statementInstance?.businessUnit}">
								<li class="fieldcontain"><span id="businessUnit-label"
									class="property-label"><g:message
											code="statement.businessUnit.label" default="Business Unit" /></span>

									<span class="property-value"
									aria-labelledby="businessUnit-label"><g:link
											controller="bussinesUnit" action="show"
											id="${statementInstance?.businessUnit?.id}">
											${statementInstance?.businessUnit?.encodeAsHTML()}
										</g:link></span></li>
							</g:if>

							<g:if test="${statementInstance?.pointsSubtotal}">
								<li class="fieldcontain"><span id="pointsSubtotal-label"
									class="property-label"><g:message
											code="statement.pointsSubtotal.label"
											default="Points Subtotal" /></span> <span class="property-value"
									aria-labelledby="pointsSubtotal-label"><g:fieldValue
											bean="${statementInstance}" field="pointsSubtotal" /></span></li>
							</g:if>

							<g:if test="${statementInstance?.stalesSubtotal}">
								<li class="fieldcontain"><span id="stalesSubtotal-label"
									class="property-label"><g:message
											code="statement.stalesSubtotal.label"
											default="Stales Subtotal" /></span> <span class="property-value"
									aria-labelledby="stalesSubtotal-label"><g:fieldValue
											bean="${statementInstance}" field="stalesSubtotal" /></span></li>
							</g:if>

							<g:if test="${statementInstance?.indIncentSubtotal}">
								<li class="fieldcontain"><span id="indIncentSubtotal-label"
									class="property-label"><g:message
											code="statement.indIncentSubtotal.label"
											default="Ind Incent Subtotal" /></span> <span
									class="property-value"
									aria-labelledby="indIncentSubtotal-label"><g:fieldValue
											bean="${statementInstance}" field="indIncentSubtotal" /></span></li>
							</g:if>

							<g:if test="${statementInstance?.posIncentSubtotal}">
								<li class="fieldcontain"><span id="posIncentSubtotal-label"
									class="property-label"><g:message
											code="statement.posIncentSubtotal.label"
											default="Pos Incent Subtotal" /></span> <span
									class="property-value"
									aria-labelledby="posIncentSubtotal-label"><g:fieldValue
											bean="${statementInstance}" field="posIncentSubtotal" /></span></li>
							</g:if>

							<g:if test="${statementInstance?.positiveSubtotal}">
								<li class="fieldcontain"><span id="positiveSubtotal-label"
									class="property-label"><g:message
											code="statement.positiveSubtotal.label"
											default="Positive Subtotal" /></span> <span class="property-value"
									aria-labelledby="positiveSubtotal-label"><g:fieldValue
											bean="${statementInstance}" field="positiveSubtotal" /></span></li>
							</g:if>

							<g:if test="${statementInstance?.deductionsSubtotal}">
								<li class="fieldcontain"><span
									id="deductionsSubtotal-label" class="property-label"><g:message
											code="statement.deductionsSubtotal.label"
											default="Deductions Subtotal" /></span> <span
									class="property-value"
									aria-labelledby="deductionsSubtotal-label"><g:fieldValue
											bean="${statementInstance}" field="deductionsSubtotal" /></span></li>
							</g:if>

							<g:if test="${statementInstance?.fixedSubtotal}">
								<li class="fieldcontain"><span id="fixedSubtotal-label"
									class="property-label"><g:message
											code="statement.fixedSubtotal.label" default="Fixed Subtotal" /></span>

									<span class="property-value"
									aria-labelledby="fixedSubtotal-label"><g:fieldValue
											bean="${statementInstance}" field="fixedSubtotal" /></span></li>
							</g:if>

							<g:if test="${statementInstance?.total}">
								<li class="fieldcontain"><span id="total-label"
									class="property-label"><g:message
											code="statement.total.label" default="Total" /></span> <span
									class="property-value" aria-labelledby="total-label"><g:fieldValue
											bean="${statementInstance}" field="total" /></span></li>
							</g:if>

							<g:if test="${statementInstance?.dueBalance}">
								<li class="fieldcontain"><span id="dueBalance-label"
									class="property-label"><g:message
											code="statement.dueBalance.label" default="Due Balance" /></span> <span
									class="property-value" aria-labelledby="dueBalance-label"><g:fieldValue
											bean="${statementInstance}" field="dueBalance" /></span></li>
							</g:if>

							<g:if test="${statementInstance?.lines}">
								<li class="fieldcontain"><span id="lines-label"
									class="property-label"><g:message
											code="statement.lines.label" default="Lines" /></span> <g:each
										in="${statementInstance.lines}" var="l">
										<span class="property-value" aria-labelledby="lines-label"><g:link
												controller="statementLine" action="show" id="${l.id}">
												${l?.encodeAsHTML()}
											</g:link></span>
									</g:each></li>
							</g:if>

							<g:if test="${statementInstance?.othersSubtotal}">
								<li class="fieldcontain"><span id="othersSubtotal-label"
									class="property-label"><g:message
											code="statement.othersSubtotal.label"
											default="Others Subtotal" /></span> <span class="property-value"
									aria-labelledby="othersSubtotal-label"><g:fieldValue
											bean="${statementInstance}" field="othersSubtotal" /></span></li>
							</g:if>

						</ol>
						<g:form url="[resource:statementInstance, action:'delete']"
							method="DELETE">
							<fieldset class="buttons">
								<ul class="bigBtnIcon" style="display: -webkit-box;">
									<li><g:link class="edit" action="edit"
											resource="${statementInstance}">
											<span class="icon icomoon-icon-pencil"></span>
											<g:message code="default.button.edit.label" default="Edit" />
										</g:link></li>
									<li><g:link class="delete" action="delete"
											value="${message(code: 'default.button.delete.label', default: 'Delete')}"
											resource="${statementInstance}"
											onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
											<span class="icon icomoon-icon-backspace"></span>
											<g:message code="default.button.delete.label"
												default="Delete" />
										</g:link></li>
								</ul>
							</fieldset>
						</g:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
