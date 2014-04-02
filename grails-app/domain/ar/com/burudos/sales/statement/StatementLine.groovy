package ar.com.burudos.sales.statement

import ar.com.burucps.sales.statement.StatementLineGroup;
import ar.com.burucps.sales.statement.StatementLineType;

class StatementLine {

	static belongsTo = [statement : Statement]
	StatementLineType type
	StatementLineGroup group
	String description
	Double unitAmount
	Double salesOperationsAmount
	Double removalOperationsAmount
	Double amount
	Integer order

	static constraints = {
		type (nullable : false, blank : false)
		group (nullable : false, blank : false)
		unitAmount (nullable : true)
		salesOperationsAmount (nullable : true,, min : 0.0)
		removalOperationsAmount (nullable : true, min : 0.0)
		amount (nullable : false)
		order (nullable : false)
	}

	static mapping = {
		type (defaultValue : StatementLineType.RULE)
		group (defaultValue : StatementLineGroup.OTHERS)
		unitAmount (defaultValue : 0)
		salesOperationsAmount (defaultValue : 0)
		removalOperationsAmount (defaultValue : 0)
		amount (defaultValue : 0)
		order (defaultValue : 999)
	}

	def getGroupDescription(StatementLineGroup group) {
		switch (group) {
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
