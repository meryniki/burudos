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

	static String getGroupDescription(StatementLineGroup paramGroup) {
		switch (paramGroup) {
			case StatementLineGroup.SALES:
				return "statement.line.sales"
				break
			case StatementLineGroup.INDIVIDUAL_INCENTIVE:
				return "statement.line.individualIncentives"
				break
			case StatementLineGroup.POS_INCENTIVE:
				return "statement.line.posIncentive"
				break
			case StatementLineGroup.DEDUCTIONS:
				return "statement.line.deductions"
				break
			case StatementLineGroup.POINTS:
				return "statement.line.points"
				break
			case StatementLineGroup.FIXED:
				return "statement.line.fixed"
				break
			default:
				return "statement.line.others"
				break
		}
	}
}
