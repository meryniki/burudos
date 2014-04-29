package ar.com.burudos.sales.statement

import java.util.Date;

import org.grails.datastore.gorm.finders.MethodExpression.InRange;

import ar.com.burucps.sales.statement.StatementLineGroup;
import ar.com.burucps.sales.statement.StatementLineType;
import ar.com.burudos.business.BussinesUnit;
import ar.com.burudos.party.Employee;

class Statement {

	Date statementPeriod
	BussinesUnit businessUnit
	static hasMany = [lines : StatementLine]
	// Points
	Double pointsSubtotal
	// Positive values
	Double stalesSubtotal
	Double indIncentSubtotal
	Double posIncentSubtotal
	Double positiveSubtotal
	// Negative values
	Double deductionsSubtotal
	// Manual arrangements
	Double othersSubtotal
	Double fixedSubtotal
	// Comision total
	Double total
	// If the employee has negative balance,
	// the difference goes to the next month statement
	Double dueBalance
	// Auiditoria
	Date creationDate
	String createdBy
	Date lastUpdateDate
	String lastUpdateBy

	static constraints = {
		statementPeriod (nullable : false)
		businessUnit(nullable: true)
		pointsSubtotal(nullable:true, min : 0D)
		stalesSubtotal(nullable:true, min : 0D)
		indIncentSubtotal(nullable:true, min : 0D)
		posIncentSubtotal(nullable:true, min : 0D)
		positiveSubtotal(nullable:true, min : 0D)
		deductionsSubtotal(nullable:true, min : 0D)
		fixedSubtotal(nullable:true, min : 0D)
		total(nullable:true, min : 0D)
		dueBalance(nullable:true, min : 0D)
		// Auditoria
		creationDate (nullable: true)
		createdBy (nullable: true)
		lastUpdateDate (nullable: true)
		lastUpdateBy (nullable: true)
	}

	String getStatementOwner() {};
	String getStatementCui() {};

	def beforeInsert() {
		active = true;
		//createdBy = securityService.currentAuthenticatedUsername();
		//lastUpdatedBy = securityService.currentAuthenticatedUsername();
		creationDate = new Date();
		lastUpdateDate = new Date();
	}

	def beforeUpdate() {
		//lastUpdatedBy = securityService.currentAuthenticatedUsername();
		lastUpdateDate = new Date();
	}

	void addLine (StatementLineType type, StatementLineGroup paramGroup, String description, 
					Double unitAmount, Double operationsAmount, Double amount, Integer lineOrder) {
		StatementLine line = new StatementLine( statement: this,
				type : type, paramGroup : paramGroup, description:description, unitAmount:unitAmount, 
				operationsAmount:operationsAmount, amount:amount, lineOrder:lineOrder)
		this.addToLines(line)
	}
					
	List<StatementLine> getPointsLines() {
		// TODO
	}
}
