package ar.com.burucps.sales.statement;

public enum StatementLineGroup {
	SALES("SALES","statement.line.sales"),
	INDIVIDUAL_INCENTIVE("INDIVIDUAL_INCENTIVE","statement.line.individualIncentives"),
	POS_INCENTIVE("POS_INCENTIVE","statement.line.posIncentive"),
	DEDUCTIONS("DEDUCTIONS","statement.line.deductions"),
	POINTS("POINTS","statement.line.points"),
	FIXED("FIXED","statement.line.fixed"),
	OTHERS("OTHERS","statement.line.others"),
	OBJ_POINTS("OBJ_POINTS","statement.line.pointObjectives"),
	OBJ_Q("OBJ_Q","statement.line.objectives");

	private final String value
	private final String description

	private StatementLineGroup(String value, String description) {
		this.value = value
		this.description = description
	}

	@Override
	public String toString() {
		description
	}
}
