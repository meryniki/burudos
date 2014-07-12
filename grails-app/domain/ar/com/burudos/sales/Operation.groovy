package ar.com.burudos.sales

class Operation {

	String type
	String code
	String description
	Boolean active

	static constraints = {
		code (nullable: false)
		active (nullable: false)
		type (nullable: false)
		description (nullable: true)
	}

	static mapping = {
		code index:'OpCode_Idx'
	}
	
	String toString() {
		return code
	}
}
