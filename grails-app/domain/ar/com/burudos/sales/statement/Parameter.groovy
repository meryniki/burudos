package ar.com.burudos.sales.statement

import org.apache.commons.logging.LogFactory

import java.util.Date;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

import ar.com.burudos.party.Party
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
	Party party
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
		bussinesUnit (nullable : true, validator: { val, obj ->
			if (!obj.bussinesUnit)
				return
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
		party (nullable:true, validator: { val, obj ->
			if (!obj.party)
				return
			def paramForSameParty = Parameter.findByParamCodeAndParty(obj.paramCode, obj.party)
			// No data found
			if (!paramForSameParty)
				return
			// Data found and creating a new one
			if (!paramForSameParty.id)
				return false
			// Data found and editing with same values
			if (paramForSameParty.id != obj.id)
				return false
		})
		// Auditoria
		creationDate (nullable: true)
		createdBy (nullable: true)
		lastUpdateDate (nullable: true)
		lastUpdateBy (nullable: true)
	}

	def beforeInsert() {
		if ((!party) && (!bussinesUnit)) {
			this.errors.reject("El parametro debe asignarse o bien a una persona, o bien a un punto de venta.")
			return null;
		} else if ((party) && (bussinesUnit)) {
			this.errors.reject("El parametro debe asignarse o bien a una persona, o bien a un punto de venta.")
			return null;
		}
		active = true;
		//createdBy = securityService.currentAuthenticatedUsername();
		//lastUpdatedBy = securityService.currentAuthenticatedUsername();
		creationDate = new Date();
		lastUpdateDate = new Date();
	}

	def beforeUpdate() {
		if ((!party) && (!bussinesUnit)) {
			this.errors.reject("El parametro debe asignarse o bien a una persona, o bien a un punto de venta.")
			return null;
		} else if ((party) && (bussinesUnit)) {
			this.errors.reject("El parametro debe asignarse o bien a una persona, o bien a un punto de venta.")
			return null;
		}
		//lastUpdatedBy = securityService.currentAuthenticatedUsername();
		lastUpdateDate = new Date();
	}

	String getCurrentDescription() {
		def currentDescription = paramDescription

		if (value != null) {
			currentDescription = currentDescription.replaceAll(Pattern.quote("[VALUE]"), Matcher.quoteReplacement(String.format("%.2f", value)))
		}
		if (minValue != null) {
			currentDescription = currentDescription.replaceAll(Pattern.quote("[MIN]"), Matcher.quoteReplacement(String.format("%.2f", minValue)))
		}
		if (maxValue != null) {
			currentDescription = currentDescription.replaceAll(Pattern.quote("[MAX]"), Matcher.quoteReplacement(String.format("%.2f", maxValue)))
		}
		log.debug(currentDescription)
		return currentDescription

	}

}