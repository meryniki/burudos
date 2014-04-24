package ar.com.burudos.sales

import ar.com.burudos.business.BussinesUnit;
import ar.com.burudos.party.Employee;
import ar.com.burudos.party.Party;

class Summary {
	BussinesUnit bu;
	Party employee;
	Integer quantity;
	Filter filter;
	Date sumMonth;

	static constraints = {
		bu(nullable:true)
		employee(nullable:true)
		filter(nullable:false)
		sumMonth (nullable: false)
		quantity (nullable: false)
	}

}