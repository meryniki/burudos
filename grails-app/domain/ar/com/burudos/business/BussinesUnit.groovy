package ar.com.burudos.business

import ar.com.burudos.party.Employee;
import ar.com.burudos.party.Party;

class BussinesUnit {

	int code;
	String description;
	BussinesUnit father;
	Employee coordinator;
	
	static constraints = {
		coordinator (nullable: true);
		code(nullable: false);
		father(nullable: true);
	}
	
}
