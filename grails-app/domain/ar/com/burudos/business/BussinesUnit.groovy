package ar.com.burudos.business

import ar.com.burudos.party.Employee;
import ar.com.burudos.party.Party;

class BussinesUnit {

	String code;
	String description;
	BussinesUnit father;
	Employee coordinator;
	
	static constraints = {
		code(nullable: false);
		description(nullable: false);
		coordinator (nullable: true);
		father(nullable: true);
	}
	
	String toString() {
		"$code-$description";
	}
	
}
