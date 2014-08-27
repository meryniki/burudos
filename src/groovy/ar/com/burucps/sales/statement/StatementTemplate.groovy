package ar.com.burucps.sales.statement

enum StatementTemplate {
	STANDARD("STANDARD","statement.template.standard","showStandard"),
	PROMOTER("PROMOTER","statement.template.promoter","showPromoter"),
	COORDINATOR("COORDINATOR","statement.template.coordinator","showCoordinator"),
	SILVERO("SILVERO","statement.template.silvero","showSilvero");
	
	private final String value
	private final String description
	private final String view

	private StatementTemplate(String value, String description, String view) {
		this.value = value
		this.description = description
		this.view = view
	}

	@Override
	public String toString() {
		description
	}
}
