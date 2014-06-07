
<%@ page import="ar.com.burudos.sales.Summary"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'summary.label', default: 'summary')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	<script type="text/javascript" src="../../static/js/jsonTable.js"></script>

	<script type='text/javascript'>
var chart; 

function requestData() 
{
	
    $.ajax({
    url: '../totals',
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
        text: 'Totales'
     }
  });
  });
}
window.onload = makechart();
</script>

	<table id="dataTable" cellpadding="0" cellspacing="0" border="0"
		class="tableTools display table table-bordered dataTable" width="0%"
		id="DataTables_Table_1" aria-describedby="DataTables_Table_1_info"></table>


	<script type="text/javascript">
									    $("#dataTable").jsonTable({
									        head : ['Operación','Cantidad'],
									        json : ['name', 'y']
									    });

									    var buoptions = {
									    	    source : "../buventas/${employeeInstance.id}", // Can be a URL or a JSON object array
									    	    rowClass : "mirowClass", //(optional) Class to be applied
									    	}
									    	 
									    	$("#dataTable").jsonTableUpdate(buoptions);

									    var options = {
									    	    source : "../ventas/${employeeInstance.id}
		", // Can be a URL or a JSON object array
			rowClass : "mirowClass", //(optional) Class to be applied
		}

		$("#dataTableEmp").jsonTableUpdate(options);
	</script>

</body>
</html>
