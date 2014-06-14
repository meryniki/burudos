package ar.com.burudos.sales.statement

import org.apache.commons.logging.LogFactory

import java.util.Date;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

import ar.com.burudos.sales.statement.StatementLine;
import ar.com.burucps.sales.statement.StatementLineGroup;
import ar.com.burudos.business.BussinesUnit;

class Parameter {
	
	private static final log = LogFactory.getLog(this)

	String paramCode
	StatementLineGroup paramCategory
	String paramGroup
	String paramDescription
	Double maxValue
	Double minValue
	Double value
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
		value (nullable : true)
		maxValue (nullable : true)
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

	String getCurrentDescription() {
		def currentDescription = paramDescription
		def aux = ""
		log.debug(currentDescription)
		
		if (value != null) {
			aux = currentDescription.replaceAll(Pattern.quote("[VALUE]"), Matcher.quoteReplacement(String.format("%.2f", value)))
			currentDescription = aux
		}
		if (minValue != null) {
			aux = currentDescription.replaceAll(Pattern.quote("[MIN]"), Matcher.quoteReplacement(String.format("%.2f", minValue)))
			currentDescription = aux
		}
		if (maxValue != null) {
			aux = currentDescription.replaceAll(Pattern.quote("[MAX]"), Matcher.quoteReplacement(String.format("%.2f", maxValue)))
			currentDescription = aux
		}
		log.debug(currentDescription)
		return currentDescription

	}

}