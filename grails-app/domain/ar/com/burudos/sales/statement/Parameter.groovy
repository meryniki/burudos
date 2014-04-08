package ar.com.burudos.sales.statement

import java.util.Date;

import ar.com.burudos.sales.statement.StatementLine;
import ar.com.burucps.sales.statement.StatementLineGroup;
import ar.com.burudos.business.BussinesUnit;

class Parameter {

	String paramCode
	StatementLineGroup paramCategory
	String paramGroup
	String paramDescription
	Double maxValue
	Double minValue
	BussinesUnit bussinesUnit
	Boolean active
	// Auiditoria
	Date creationDate
	String createdBy
	Date lastUpdateDate
	String lastUpdateBy


	static constraints = {
		paramCode (nullable : false)
		paramCategory (nullable : false)
		paramGroup (nullable : true)
		paramDescription (nullable : false)
		maxValue (nullable : false)
		minValue (nullable : true)
		bussinesUnit (nullable : false, validator: { val, obj ->
			def paramForSameBU = Parameter.findByParamCodeAndBussinesUnit(obj.paramCode, obj.bussinesUnit)
			// No data found
			if (!paramForSameBU)
				return
			// Data found and creating a new one
			if (!paramForSameBU.id)
				return false
			// Data found and editing with same values
			if (paramForSameBU.id != obj.id)
				return false
		})
		// Auditoria
		creationDate (nullable: true)
		createdBy (nullable: true)
		lastUpdateDate (nullable: true)
		lastUpdateBy (nullable: true)
	}

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

}