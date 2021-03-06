<%@ page import="ar.com.burudos.party.Employee"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">

<r:require module="highcharts" />
<r:require module="jsontable" />

<g:set var="entityName"
	value="${message(code: 'employee.label', default: 'Employee')}" />

<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<script type="text/javascript" src="../../static/js/jsonTable.js"></script>

	<script type='text/javascript'>
var chart; 
var chartbu; 

function requestBuData() 
{
	
    $.ajax({
    url: '../buventas/${employeeInstance.id}',
    datatype: "json",
    success: function(databu) 
    {
           chartbu.series[0].setData(databu);
    },      
    });
}

function requestData() 
{
	
    $.ajax({
    url: '../ventas/${employeeInstance.id}',
    datatype: "json",
    success: function(data) 
    {
           chart.series[0].setData(data);
    },      
    });
}

function makechart()
{
$(document).ready(function() {
    Highcharts.setOptions({
        global: {
            useUTC: false
        }
    });
chart = new Highcharts.Chart({
     chart: {
        renderTo: 'graph',
        type: 'pie',
        events: {
            load: requestData
        }
     },
     series: [{
         type: 'pie',
         data: []
     }],
     title: {
        text: 'Ventas'
     }
  });
  });

$(document).ready(function() {
    Highcharts.setOptions({
        global: {
            useUTC: false
        }
    });
chartbu = new Highcharts.Chart({
     chart: {
        renderTo: 'graphbu',
        type: 'pie',
        events: {
            load: requestBuData
        }
     },
     series: [{
         type: 'pie',
         data: []
     }],
     title: {
        text: 'Totales'
     }
  });
  });
}
window.onload = makechart();
</script>


	<div id="content" class="clearfix">
		<div class="contentwrapper">
			<div class="heading">

				<h3>
					<g:message code="employee.btnLabel" args="[entityName]" />
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
					<li class="active"><g:message code="employee.show.label"
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

					<div id="show-employee" class="content scaffold-show" role="main">
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
									<span><g:message code="employee.show.label"
											args="[entityName]" /></span>
								</h4>
							</div>
							<div class="panel-body">

								<ul class="col-lg-12">
									<g:if test="${employeeInstance?.uid}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.uid.label" default="Uid" /> </span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="uid" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.name}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.name.label" default="Name" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="name" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.email}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.email.label" default="Email" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="email" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.creationDate}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.creationDate.label" default="Creation Date" /></span>

											<span class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:formatDate
													date="${employeeInstance?.creationDate}" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.createdBy}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.createdBy.label" default="Created By" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="createdBy" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.lastUpdateDate}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.lastUpdateDate.label"
													default="Last Update Date" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:formatDate
													date="${employeeInstance?.lastUpdateDate}" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.lastUpdateBy}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.lastUpdateBy.label" default="Last Update By" /></span>

											<span class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="lastUpdateBy" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.legajo}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.legajo.label" default="Legajo" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="legajo" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.fullname}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.fullname.label" default="Fullname" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="fullname" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.names}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.names.label" default="Names" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="names" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.lastname}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.lastname.label" default="Lastname" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="lastname" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.dofingreso}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.dofingreso.label" default="Dofingreso" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:formatDate
													date="${employeeInstance?.dofingreso}" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.bu}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.bu.label" default="Bu" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:link controller="bussinesUnit"
													action="show" id="${employeeInstance?.bu?.id}">
													${employeeInstance?.bu?.encodeAsHTML()}
												</g:link></span></li>
									</g:if>

									<g:if test="${employeeInstance?.dofbirth}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.dofbirth.label" default="Dofbirth" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:formatDate
													date="${employeeInstance?.dofbirth}" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.isworker}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.isworker.label" default="Isworker" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:formatBoolean
													boolean="${employeeInstance?.isworker}" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.iscoordinator}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.iscoordinator.label" default="Iscoordinator" /></span>

											<span class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
											<g:formatBoolean boolean="${employeeInstance?.iscoordinator}" /></li>
									</g:if>

									<g:if test="${employeeInstance?.basic}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.basic.label" default="Basic" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="basic" /></span></li>
									</g:if>
									<g:if test="${employeeInstance?.statementRules}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.statementRules.label" default="Reglas de Liquidación" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="statementRules" /></span></li>
									</g:if>
								</ul>

								<ul class="bigBtnIcon" style="display: -webkit-box;">
									<li><g:link class="edit" action="edit"
											resource="${employeeInstance}">
											<span class="icon icomoon-icon-pencil"></span>
											<g:message code="default.button.edit.label" default="Edit" />
										</g:link></li>
									<li><g:link class="delete" action="delete"
											value="${message(code: 'default.button.delete.label', default: 'Delete')}"
											resource="${employeeInstance}"
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


			<div class="row">

				<div class="col-lg-2"></div>

				<div class="col-lg-8">

					<div id="show-employee" class="content scaffold-show" role="main">
						<h1>
							<g:message code="default.sales.label" args="[entityName]" />
						</h1>
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>

						<div class="panel panel-default">

							<div class="panel-heading">
								<h4>
									<span><g:message code="employee.totals.show.label"
											args="[entityName]" /></span>
								</h4>
							</div>
							<div class="panel-body">

								<ul class="col-lg-12">
									<g:if test="${employeeInstance?.uid}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.uid.label" default="Uid" /> </span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="uid" /></span></li>
									</g:if>
								</ul>

								<div id="graph" style="width: 100%; height: 400px;"></div>

								<ul class="bigBtnIcon" style="display: -webkit-box;">
									<li><g:link class="print" action="print"
											resource="${employeeInstance}">
											<span class="icon icomoon-icon-print"></span>
											<g:message code="default.button.print.label" default="Imprimir" />
										</g:link></li>
								</ul>

								<table id="dataTableEmp" cellpadding="0" cellspacing="0"
									border="0"
									class="tableTools display table table-bordered dataTable"
									width="0%" id="DataTables_Table_1"
									aria-describedby="DataTables_Table_1_info"></table>

							</div>

							<div class="panel panel-default" style="display: none;">

								<div class="panel-heading">
									<h4>
										<span><g:message code="employee.butotals.show.label"
												args="[entityName]" /></span>
									</h4>
								</div>
								<div class="panel-body">

									<ul class="col-lg-12">
										<g:if test="${employeeInstance?.uid}">
											<li style="display: block;"><span class="blue col-lg-3"><g:message
														code="employee.uid.label" default="Uid" /> </span> <span
												class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
												class="col-lg-6"><g:fieldValue
														bean="${employeeInstance}" field="uid" /></span></li>
										</g:if>
									</ul>

									<div id="graphbu" style="width: 100%; height: 400px;"></div>

									<ul class="bigBtnIcon" style="display: -webkit-box;">
										<li><g:link class="print" action="print"
												resource="${employeeInstance}">
												<span class="icon icomoon-icon-print"></span>
												<g:message code="default.button.print.label" default="Print" />
											</g:link></li>
									</ul>
									<table id="dataTableBu" cellpadding="0" cellspacing="0"
										border="0"
										class="tableTools display table table-bordered dataTable"
										width="0%" id="DataTables_Table_1"
										aria-describedby="DataTables_Table_1_info"></table>
								</div>

								<script type="text/javascript">
									    $("#dataTableBu").jsonTable({
									        head : ['Operación','Cantidad'],
									        json : ['name', 'y']
									    });
									    $("#dataTableEmp").jsonTable({
									        head : ['Operación','Cantidad'],
									        json : ['name', 'y']
									    });

									    var buoptions = {
									    	    source : "../buventas/${employeeInstance.id}", // Can be a URL or a JSON object array
									    	    rowClass : "mirowClass", //(optional) Class to be applied
									    	}
									    	 
									    	$("#dataTableBu").jsonTableUpdate(buoptions);

									    var options = {
									    	    source : "../ventas/${employeeInstance.id}", // Can be a URL or a JSON object array
									    	    rowClass : "mirowClass", //(optional) Class to be applied
									    	}
									    	 
									    	$("#dataTableEmp").jsonTableUpdate(options);
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
