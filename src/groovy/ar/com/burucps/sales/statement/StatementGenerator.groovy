package ar.com.burucps.sales.statement;

import org.apache.commons.logging.LogFactory
import org.drools.KnowledgeBase
import org.drools.KnowledgeBaseFactory
import org.drools.agent.LastUpdatedPing;
import org.drools.builder.KnowledgeBuilder
import org.drools.builder.KnowledgeBuilderFactory
import org.drools.builder.ResourceType
import org.drools.definition.KnowledgePackage
import org.drools.io.ResourceFactory
import org.drools.logger.KnowledgeRuntimeLogger
import org.drools.logger.KnowledgeRuntimeLoggerFactory
import org.drools.runtime.StatefulKnowledgeSession

import ar.com.burudos.business.BussinesUnit
import ar.com.burudos.party.Employee
import ar.com.burudos.sales.Summary
import ar.com.burudos.sales.statement.EmployeeStatement
import ar.com.burudos.sales.statement.Parameter

/**
 * This is a sample file to launch a rule package from a rule source file.
 */
public class StatementGenerator {

	private static final log = LogFactory.getLog(this)

	public void generateStatement(Integer param_month, Integer param_year) {
		log.debug("Se van a generar liquidaciones para el periodo: " + param_year + "/" + param_month)

		cleanDataForPeriodIfExists(param_month, param_year);
		
		ParameterResolver parameterResolver = new ParameterResolver()
		final KnowledgeBuilder kbuilder = KnowledgeBuilderFactory
				.newKnowledgeBuilder();
		log.debug("Se obtuvo el KnowledgeBuilder")
		kbuilder.add(ResourceFactory.newClassPathResource("SellerRules.drl",
				StatementGenerator.class), ResourceType.DRL);
		log.debug("Se agreg�� el SellerRules.drl")

		// Check the builder for errors
		if (kbuilder.hasErrors()) {
			log.info("SellerRules.drl con errores")
			System.out.println(kbuilder.getErrors().toString());
			throw new RuntimeException("Unable to compile \"SellerRules.drl\".");
		}
		log.info("SellerRules.drl verificado")

		// get the compiled packages (which are serializable)
		final Collection<KnowledgePackage> pkgs = kbuilder
				.getKnowledgePackages();

		// add the packages to a knowledgebase (deploy the knowledge packages).
		final KnowledgeBase kbase = KnowledgeBaseFactory.newKnowledgeBase();
		log.debug("Se obtuvo el KnowledgeBase")
		kbase.addKnowledgePackages( pkgs );

		final StatefulKnowledgeSession ksession = kbase
				.newStatefulKnowledgeSession();
		log.info("Se cre�� la sesi��n de drools")

		// GLOBALS
		// Load Statement parameters
		parameterResolver.loadParameters()
		ksession.setGlobal( "parameterResolver", parameterResolver);
		log.debug("Load Statement parameters")

		// Load Map for calculations
		Map<String,Object> additionalValuesMap = new HashMap<String,Object>();
		ksession.setGlobal( "additionalValues", additionalValuesMap);
		log.debug("Load Map for calculations")
		
		// FACTS
		// Load Summary
		
		Summary.where{
			(       month(sumMonth) == param_month &&
					year(sumMonth) == param_year        )
		}.list().each() { it ->
			try {
				ksession.insert(it);
			} catch (Exception e) {
				println "Exception " + it
				println e
			}
		}
		log.debug("Load Summary")
		log.debug("Fact Count" + ksession.getFactCount())

		// Load parameters for BU and set as facts
		def query = Parameter.where { bussinesUnit != null}.projections { distinct 'paramCode' }
		def allParamCodes = query.list()

		// Load EmployeeList and their statements
		def allEmployees = Employee.findAll(sort: 'bu', order: 'asc') { bu != null && isworker }

		BussinesUnit lastUnit = null;
		def parameterFacts = [];
		
		// setup the audit logging
		// Remove comment to use FileLogger
		KnowledgeRuntimeLogger logger = KnowledgeRuntimeLoggerFactory.newFileLogger( ksession, "./BurucpsRules" );

		// Remove comment to use ThreadedFileLogger so audit view reflects events whilst debugging
		//KnowledgeRuntimeLogger logger = KnowledgeRuntimeLoggerFactory.newThreadedFileLogger( ksession, "./helloworld", 1000 );

		for (Employee employee : allEmployees ) {
			additionalValuesMap.clear();
			log.debug("Last Unit: " + lastUnit);
			if ((!lastUnit) || (lastUnit != employee.bu)) {
				if (lastUnit != null) {
					log.debug("Elimino los parametros para la BU previa: " + lastUnit)
					parameterFacts.each {
						ksession.retract(it);
					}
					log.debug("Fact Count" + ksession.getFactCount())
					parameterFacts.clear()
				}
				log.debug("Agrego los parametros para la nueva BU: " + employee.bu)
				for (String codeName : allParamCodes) {
					def parameter = parameterResolver.resolve(codeName, employee.bu);
					if (parameter != null) {
						parameterFacts << ksession.insert(parameter);
					}
				}
				log.debug("Fact Count" + ksession.getFactCount())
				lastUnit = employee.bu
			}

			log.debug("Creo la liquidaci��n para el empleado: " + employee)
			
			EmployeeStatement statement = new EmployeeStatement(employee: employee, businessUnit: employee.bu,
				statementPeriod: parsePeriod(param_month,param_year)).save(failOnError: true, flush: true)

			def employeeFact = ksession.insert(employee);
			ksession.setGlobal("statement", statement);

			log.info("Por ejecutar las reglas")
			ksession.fireAllRules();
			log.info("Fin de la ejecuci��n")

			statement = ksession.getGlobal("statement");
			statement.save(failOnError: true, flush: true)

			ksession.retract(employeeFact)
			ksession.setGlobal("statement",null)
		}

		// Remove comment if using logging
		logger.close();

		log.debug("End process")

		ksession.dispose();
	}

	Date parsePeriod(Integer month, Integer year) {
		return Date.parse("yyyyMM", year.toString() + String.format("%02d", month))
	}

	void cleanDataForPeriodIfExists(Integer month, Integer year) {
		EmployeeStatement.executeUpdate("delete Statement s where s.statementPeriod = :period",
				[period: parsePeriod(month,year)])
	}

}
