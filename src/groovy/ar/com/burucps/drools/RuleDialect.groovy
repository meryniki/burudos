package ar.com.burucps.drools

public enum RuleDialect {
	MVEL("MVEL","mvel"), JAVA("JAVA","java");
	
	private final String value
	private final String description
	
	private RuleDialect(String value, String description) {
		this.value = value
		this.description = description
	}
	
	@Override
	public String toString() {
		description
	}
}
