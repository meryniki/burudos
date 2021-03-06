package ar.com.burudos.sales.statement

import ar.com.burucps.sales.statement.StatementLineGroup;
import ar.com.burucps.sales.statement.StatementLineType;

class StatementLine {

	static belongsTo = [statement : Statement]
	StatementLineType type
	StatementLineGroup paramGroup
	String description
	Double unitAmount
	Double unitAmountFixed
	Double operationsAmount
	Double operationsAmountFixed
	Double amount
	Double amountFixed
	Integer lineOrder

	static constraints = {
		type (nullable : false, blank : false)
		description( nullable: false) 
		paramGroup (nullable : false, blank : false)
		unitAmount (nullable : true)
		unitAmountFixed (nullable : true)
		operationsAmount (nullable : true, min : 0D)
		operationsAmountFixed (nullable : true, min : 0D)
		amount (nullable : true)
		amountFixed (nullable : true)
		lineOrder (nullable : false)
	}

	static mapping = {
		type (defaultValue : StatementLineType.RULE)
		paramGroup (defaultValue : StatementLineGroup.OTHERS)
		unitAmount (defaultValue : 0D)
		operationsAmount (defaultValue : 0D)
		amount (defaultValue : 0D)
		lineOrder (defaultValue : 999)
	}

}
