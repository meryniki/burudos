package ar.com.burucps.drools

public enum RuleDialect {
	MVEL, JAVA;
	
	@Override
	public String toString() {
		switch (this) {
		case MVEL:
			return "\"mvel\"";
		case JAVA:
			return "\"java\"";
		}
	}
}
