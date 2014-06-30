package ar.com.burudos.sales

import java.util.Date;

import ar.com.burudos.business.BussinesUnit
import ar.com.burudos.party.Client;
import ar.com.burudos.party.Party;

/* Luego se ordenan por type desc, y primero se calcular los WHERE, luego los sum, query y advanced */
enum Filter_Type {
	WHERE, SUM, QUERY, ADVANCED
}

class Filter {
	
	Filter_Type type = Filter_Type.WHERE
	String filterCode
	String description
	BussinesUnit bu
	Date validMonth
	static hasMany = [totals:Filter]
	
	String op
	String sds
	String ani
	String imei
	String sim
	String folio
	String partida
	String equipo
	String solicitud
	String cancel
	String estado
	String factura
	String importe
	String plan_desc
	String debaut
	String cat_plan
	
	/*Si suma por un campo, se escribe aca*/
	String suma
	
	String plan_promo
	
	Operation op_desde
	Operation op_hasta
	
	static constraints = {
		type(nullable: false)
		filterCode (nullable: false, unique:true)
		validMonth (max : new Date(), nullable: false)
		description (nullable: true)
		bu( nullable:false)
		op(nullable:true)
		sds(nullable:true)
		ani(nullable:true)
		imei(nullable:true)
		sim(nullable:true)
		folio(nullable:true)
		partida(nullable:true)
		equipo(nullable:true)
		solicitud(nullable:true)
		cancel(nullable:true)
		estado(nullable:true)
		factura(nullable:true)
		importe(nullable:true)
		plan_desc(nullable:true)
		debaut(nullable:true)		
		cat_plan(nullable:true)
		plan_promo(nullable:true)
		op_desde(nullable:true)
		op_hasta(nullable:true)
	    suma(nullable:true)	
		totals(nullable:true)	
	}
	
	String toString() {
		return filterCode
	}

}
