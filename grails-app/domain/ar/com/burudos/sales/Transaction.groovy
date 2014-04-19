package ar.com.burudos.sales

import ar.com.burudos.party.Client
import ar.com.burudos.business.BussinesUnit
import ar.com.burudos.party.Party

class Transaction {

	Party  party
	Operation op
	Date date
	String sds
	String ani
	String imei
	String sim
	String folio
	String partida
	String equipo
	String solicitud
	BussinesUnit almacen
	Client  cliente
	String cancel
	String estado
	String factura
	String importe
	String plan_desc
	String debaut
	String cat_plan
	String plan_promo
	
	Operation op_desde
	Operation op_hasta

	static constraints = {
		party(nullable:false)
		op(nullable:false)
		date (max : new Date(), nullable: false)
		sds(nullable:true)
		ani(nullable:true)
		imei(nullable:true)
		sim(nullable:true)
		folio(nullable:true)
		partida(nullable:true)
		equipo(nullable:true)
		solicitud(nullable:true)
		almacen(nullable:true)
		cliente(nullable:true)
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
	}
}
 