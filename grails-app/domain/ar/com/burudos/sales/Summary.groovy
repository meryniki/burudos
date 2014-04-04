package ar.com.burudos.sales

import ar.com.burudos.business.BussinesUnit;
import ar.com.burudos.party.Employee;

class Summary {
	BussinesUnit bu;
	Integer quantity;
	Operation op;
	Date month;

	static constraints = {
		bu(nullable:false)
		op(nullable:false)
		month (nullable: false)
		quantity (nullable: false)
	}

}