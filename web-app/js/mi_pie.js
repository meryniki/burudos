var chart; 
var chartbu; 

function requestBuData(id) 
{
	alert(id)
    $.ajax({
    url: 'http://localhost:8080/burudos/employee/buventas/' + id,
    datatype: "json",
    success: function(databu) 
    {
           chartbu.series[0].setData(databu);
    },      
    });
}

function requestData(id) 
{
	
    $.ajax({
    url: 'http://localhost:8080/burudos/employee/ventas/' + id,
    datatype: "json",
    success: function(data) 
    {
           chart.series[0].setData(data);
    },      
    });
}

function makechart(id)
{
alert("fdsfsfdsfdsfs");
alert(id);

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
            load: requestData(id)
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
            load: requestBuData(id)
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
