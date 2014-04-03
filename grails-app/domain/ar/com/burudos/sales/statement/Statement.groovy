package ar.com.burudos.sales.statement

import org.grails.datastore.gorm.finders.MethodExpression.InRange;

import ar.com.burudos.party.Employee;

class Statement {

	Date statementDate
	static belongsTo = [employee : Employee]
	static hasMany = [lines : StatementLine]

	static constraints = {
		statementDate (nullable : false)
		employee (nullable : false)
	}
}
