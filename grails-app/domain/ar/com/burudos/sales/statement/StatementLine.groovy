package ar.com.burudos.sales.statement

import ar.com.burucps.sales.statement.StatementLineGroup;
import ar.com.burucps.sales.statement.StatementLineType;

class StatementLine {

	static belongsTo = [statement : Statement]
	StatementLineType type
	StatementLineGroup paramGroup
	String description
	Double unitAmount
	Double operationsAmount
	Double amount
	Integer order

	static constraints = {
		type (nullable : false, blank : false)
		paramGroup (nullable : false, blank : false)
		unitAmount (nullable : true)
		operationsAmount (nullable : true, min : 0D)
		amount (nullable : false)
		order (nullable : false)
	}

	static mapping = {
		type (defaultValue : StatementLineType.RULE)
		paramGroup (defaultValue : StatementLineGroup.OTHERS)
		unitAmount (defaultValue : 0D)
		operationsAmount (defaultValue : 0D)
		amount (defaultValue : 0D)
		order (defaultValue : 999)
	}

}
