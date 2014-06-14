package ar.com.burucps.sales.statement;

public enum StatementLineGroup {
	SALES, INDIVIDUAL_INCENTIVE, POS_INCENTIVE, DEDUCTIONS, POINTS, FIXED, OTHERS;

	@Override
	public String toString() {
		switch (this) {
		case SALES:
			return "statement.line.sales";
		case INDIVIDUAL_INCENTIVE:
			return "statement.line.individualIncentives";
		case POS_INCENTIVE:
			return "statement.line.posIncentive";
		case DEDUCTIONS:
			return "statement.line.deductions";
		case POINTS:
			return "statement.line.points";
		case FIXED:
			return "statement.line.fixed";
		case OTHERS:
			return "statement.line.others";
		case OBJ_POINTS:
			return "statement.line.fixed";
		case OBJ_Q:
			return "statement.line.others";
		default:
			throw new IllegalArgumentException();
		}
	}
	
}
