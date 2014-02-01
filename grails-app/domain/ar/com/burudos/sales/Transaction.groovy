package ar.com.burudos.sales

import ar.com.burudos.party.Party

class Transaction {

	Party   party
	Operation op
	Integer month
	Integer quantity

	static constraints = {
		party(nullable:false)
		op(nullable:false)
		month (nullable: false)
		quantity (nullable: false)
	}
}
