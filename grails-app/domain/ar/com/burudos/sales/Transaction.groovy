package ar.com.burudos.sales

import ar.com.burudos.party.Client
import ar.com.burudos.business.BussinesUnit
import ar.com.burudos.party.Party

class Transaction {

	Party        party
	Operation    op
	Date         datet
	BussinesUnit buventa
	BussinesUnit almacen
	Client       cliente
	Operation    op_desde
	Operation    op_hasta

	String sds
	String ani
	String imei
	String sim
	String folio
	String blister
	String partida
	String equipo
	String solicitud
	String servicio
	String cancel
	String estado
	String tipo_fact
	String factura
	String importe
	String plan
	String plan_desc
	String debaut
	String cantidad
	String descuento
	Double iva
	Double iibb
	Double neto
	Double total
	String cat_plan
	String plan_promo
	
	
	static constraints = {
		party(nullable:false)
		op(nullable:false)
		datet (max : new Date(), nullable: false)
		sds(nullable:true)
		ani(nullable:true)
		buventa(nullable:true)
		imei(nullable:true)
		sim(nullable:true)
		folio(nullable:true)
		partida(nullable:true)
		equipo(nullable:true)
		blister(nullable:true)
		solicitud(nullable:true)
		servicio(nullable:true)
		almacen(nullable:true)
		cliente(nullable:true)
		cancel(nullable:true)
		estado(nullable:true)
		tipo_fact(nullable:true)
		factura(nullable:true)
		importe(nullable:true)
		plan(nullable:true)
		plan_desc(nullable:true)
		debaut(nullable:true)
		cat_plan(nullable:true)
		plan_promo(nullable:true)
		descuento(nullable:true)
		iva(nullable:true)
		cantidad(nullable:true)
		neto(nullable:true)
		total(nullable:true)
		iibb(nullable:true)
		op_desde(nullable:true)
		op_hasta(nullable:true)
	}
}
 