package ar.com.burudos.sales

class Operation {

	String code
	String meaning
	String description
	
    static constraints = {	
		code (nullable: false)
		meaning (nullable: false)
		description (nullable: true);
    }
}
