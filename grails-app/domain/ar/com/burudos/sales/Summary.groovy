package ar.com.burudos.sales

import ar.com.burudos.business.BussinesUnit;
import ar.com.burudos.party.Employee;
import ar.com.burudos.party.Party;

class Summary {
	String summaryCode;
	BussinesUnit bu;
	Party employee;
	Double quantity;
	Filter filter;
	Date sumMonth;

	static constraints = {
		summaryCode(nullable:false)
		bu(nullable:true)
		employee(nullable:true)
		filter(nullable:true)
		sumMonth (nullable: false)
		quantity (nullable: false)
	}
	
	
	def beforeInsert() {
		if (!summaryCode && filter)
			summaryCode = filter.filterCode;
	}

}