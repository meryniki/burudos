package ar.com.burudos.sales

class Operation {

	String code
	String cat_plan
	String plan_promo
	String meaning
	String description
	Operation op_desde
	Operation op_hasta

	static constraints = {
		code (nullable: false)
		meaning (nullable: true)
		description (nullable: true)
		cat_plan (nullable: true)
		plan_promo (nullable: true)
		op_desde( nullable:true)
		op_hasta( nullable:true)
	}

	String toString() {
		String complete_code = code;
		if (cat_plan!=null)
			complete_code += "-" + cat_plan ;
		if (plan_promo!=null)
			complete_code += "-" + plan_promo;
		return "$complete_code"
	}
}
