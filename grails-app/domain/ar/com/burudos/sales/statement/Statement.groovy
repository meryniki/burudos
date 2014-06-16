package ar.com.burudos.sales.statement

import java.util.Date;
import java.util.List;
import org.grails.datastore.gorm.finders.MethodExpression.InRange;
import ar.com.burucps.sales.statement.StatementLineGroup;
import ar.com.burucps.sales.statement.StatementLineType;
import ar.com.burudos.business.BussinesUnit;
import ar.com.burudos.party.Employee;
import org.apache.commons.logging.LogFactory;

class Statement {

	private static final log = LogFactory.getLog(this)

	Date statementPeriod
	BussinesUnit businessUnit
	static hasMany = [lines : StatementLine]
	// Points
	Double pointsSubtotal
	Double pointsObjPerc
	// Q
	Double qBUTotal
	Double qEmployeeTotal
	Double qEmployeeReachedTotal
	Double qEmployeeReachedPerc
	// Positive values
	Double stalesSubtotal
	Double indIncentSubtotal
	Double posIncentSubtotal
	Double positiveSubtotal
	// Negative values
	Double deductionsSubtotal
	// Manual arrangements
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
		pointsSubtotal(nullable:true)
		stalesSubtotal(nullable:true, min : 0D)
		indIncentSubtotal(nullable:true, min : 0D)
		posIncentSubtotal(nullable:true, min : 0D)
		positiveSubtotal(nullable:true, min : 0D)
		deductionsSubtotal(nullable:true)
		fixedSubtotal(nullable:true, min : 0D)
		pointsObjPerc(nullable:true, min: 0D)
		qBUTotal(nullable:true, min: 0D)
		qEmployeeTotal(nullable:true, min: 0D)
		qEmployeeReachedTotal(nullable:true, min: 0D)
		qEmployeeReachedPerc(nullable:true, min: 0D)
		total(nullable:true, min : 0D)
		dueBalance(nullable:true, min : 0D)
		// Auditoria
		creationDate (nullable: true)
		createdBy (nullable: true)
		lastUpdateDate (nullable: true)
		lastUpdateBy (nullable: true)
	}

	static mapping = { lines cascade: 'all-delete-orphan' }

	String getStatementOwner() {};
	String getStatementCui() {};

	def beforeInsert() {
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
		log.debug("Agrego una linea: " + description);
		StatementLine line = new StatementLine( statement: this,
				type : type, paramGroup : paramGroup, description:description, unitAmount:unitAmount,
				operationsAmount:operationsAmount, amount:amount, lineOrder:lineOrder)
		this.addToLines(line)
		switch (paramGroup) {
			case StatementLineGroup.SALES:
				stalesSubtotal += amount;
				total += amount;
				break;
			case StatementLineGroup.INDIVIDUAL_INCENTIVE:
				indIncentSubtotal += amount;
				total += amount;
				break;
			case StatementLineGroup.POS_INCENTIVE:
				posIncentSubtotal += amount;
				total += amount;
				break;
			case StatementLineGroup.DEDUCTIONS:
				deductionsSubtotal += amount;
				total += amount;
				break;
			case StatementLineGroup.POINTS:
				pointsSubtotal += amount;
				break;
			case StatementLineGroup.FIXED:
				fixedSubtotal += amount;
				total += amount;
				break;
			case StatementLineGroup.OBJ_POINTS:
				break;
			case StatementLineGroup.OBJ_Q:
				qBUTotal += unitAmount;
				qEmployeeTotal += operationsAmount;
				qEmployeeReachedTotal += amount;
				break;
		}
	}

	List<StatementLine> getBuPointsLines(){
		StatementLine.findAll(sort: 'lineOrder', order:'asc'){ paramGroup == StatementLineGroup.POINTS && statement == this  }
	}

	List<StatementLine> getBuIncentivesLines(){
		StatementLine.findAll(sort: 'lineOrder', order:'asc'){ paramGroup == StatementLineGroup.POS_INCENTIVE && statement== this }
	}

	List<StatementLine> getEmpSalesLines(){
		StatementLine.findAll(sort: 'lineOrder', order:'asc'){ paramGroup == StatementLineGroup.SALES && statement== this }
	}

	List<StatementLine> getEmpIncentivesLines(){
		StatementLine.findAll(sort: 'lineOrder', order:'asc'){ paramGroup == StatementLineGroup.INDIVIDUAL_INCENTIVE && statement== this }
	}

	List<StatementLine> getEmpDedLines(){
		StatementLine.findAll(sort: 'lineOrder', order:'asc'){ paramGroup == StatementLineGroup.DEDUCTIONS && statement== this }
	}

	List<StatementLine> getBuObjPointsLines(){
		StatementLine.findAll(sort: 'lineOrder', order:'asc'){ paramGroup == StatementLineGroup.OBJ_POINTS && statement== this }
	}

	List<StatementLine> getBuObjQLines(){
		StatementLine.findAll(sort: 'lineOrder', order:'asc'){ paramGroup == StatementLineGroup.OBJ_Q && statement== this }
	}

}
