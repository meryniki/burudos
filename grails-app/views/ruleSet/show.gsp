<%@ page import="ar.com.burucps.drools.RuleSet"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'ruleSet.label', default: 'RuleSet')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div id="content" class="clearfix">
		<div class="contentwrapper">
			<div class="heading">
				<h3>
					<g:message code="ruleSet.btnLabel" args="[entityName]" />
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
					<li class="active"><g:message code="ruleSet.show.label"
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

			<div class="row">

				<div class="col-lg-2"></div>

				<div class="col-lg-8">
					<div id="show-ruleSet" class="content scaffold-show" role="main">
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
									<span><g:message code="ruleSet.show.label"
											args="[entityName]" /></span>
								</h4>
							</div>
							<div class="panel-body">

								<ul class="col-lg-12">

									<g:if test="${ruleSetInstance?.setName}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="ruleSet.setName.label" default="Set Name" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${ruleSetInstance}" field="setName" /></span></li>
									</g:if>

									<g:if test="${ruleSetInstance?.setDescription}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="ruleSet.setDescription.label"
													default="Set Description" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${ruleSetInstance}" field="setDescription" /></span></li>
									</g:if>

									<g:if test="${ruleSetInstance?.creationDate}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="ruleSet.creationDate.label" default="Creation Date" /></span>
											<span class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:formatDate
													date="${ruleSetInstance?.creationDate}" /></span></li>
									</g:if>

									<g:if test="${ruleSetInstance?.lastUpdateDate}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="ruleSet.lastUpdateDate.label"
													default="Last Update Date" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:formatDate
													date="${ruleSetInstance?.lastUpdateDate}" /></span></li>
									</g:if>

									<g:if test="${ruleSetInstance?.rules}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="ruleSet.rules.label" default="Rules" /></span> <g:each
												in="${ruleSetInstance.rules}" var="r">
												<span
													class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
												<span class="col-lg-6"><g:link controller="rule"
														action="show" id="${r.id}">
														${r?.encodeAsHTML()}
													</g:link></span>
											</g:each></li>
									</g:if>

								</ul>

								<ul class="bigBtnIcon" style="display: -webkit-box;">
									<li><g:link class="edit" action="edit"
											resource="${ruleInstance}">
											<span class="icon icomoon-icon-pencil"></span>
											<g:message code="default.button.edit.label" default="Edit" />
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
