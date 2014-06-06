package ar.com.burucps.sales.statement;

import java.util.ArrayList;
import java.util.Collection;

import org.apache.commons.logging.LogFactory

import org.drools.KnowledgeBase;
import org.drools.KnowledgeBaseFactory;
import org.drools.agent.KnowledgeAgent;
import org.drools.builder.KnowledgeBuilder;
import org.drools.builder.KnowledgeBuilderFactory;
import org.drools.builder.ResourceType;
import org.drools.definition.KnowledgePackage;
import org.drools.io.ResourceFactory;
import org.drools.runtime.StatefulKnowledgeSession;

import ar.com.burudos.business.BussinesUnit;
import ar.com.burudos.party.Employee;
import ar.com.burudos.sales.Summary;
import ar.com.burudos.sales.Transaction;
import ar.com.burudos.sales.statement.EmployeeStatement
import ar.com.burudos.sales.statement.Parameter;
import ar.com.burudos.sales.statement.Statement;

public class StatementGenerator {

	private static final log = LogFactory.getLog(this)

	public void generateStatement(Integer month, Integer year) {
		log.debug("Se van a generar liquidaciones para el periodo: " + year + "/" + month)
		ParameterResolver parameterResolver = new ParameterResolver()
		final KnowledgeBuilder kbuilder = KnowledgeBuilderFactory
				.newKnowledgeBuilder();
		log.debug("Se obtuvo el KnowledgeBuilder")
		kbuilder.add(ResourceFactory.newClassPathResource("SellerRules.drl",
				StatementGenerator.class), ResourceType.DRL);
		log.debug("Se agregó el SellerRules.drl")

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
		log.info("Se creó la sesión de drools")

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
			(month(sumMonth) == month &&
					year(sumMonth) == year)
		}.list().each() { it ->
			ksession.insert(it);
		}
		log.debug("Load Summary")

		// Load parameters for BU and set as facts
		def query = Parameter.where { bussinesUnit != null}.projections { distinct 'paramCode' }
		def allParamCodes = query.list()

		// Load EmployeeList and their statements
		def allEmployees = Employee.findAll(sort: 'bu', order: 'asc') { bu != null && isworker }

		BussinesUnit lastUnit = null;
		def parameterFacts = [];

		for (Employee employee : allEmployees ) {
			additionalValuesMap.clear();
			if (lastUnit != employee.bu) {
				if (lastUnit != null) {
					parameterFacts.each {
						ksession.retract(it);
					}
					parameterFacts.clear()
				}
				for (String codeName : allParamCodes) {
					def parameter = parameterResolver.resolve(codeName, employee.bu);
					if (parameter != null) {
						ksession.insert(parameter);
						parameterFacts << parameter;
					}
				}
			}
			
			EmployeeStatement statement = new EmployeeStatement();
			statement.employee = employee;
			statement.statementPeriod = parsePeriod(month,year)

			ksession.insert(employee);
			ksession.setGlobal("statement", statement);

			log.info("Por ejecutar las reglas")
			ksession.fireAllRules();
			log.info("Fin de la ejecución")

			statement = ksession.getGlobal("statement");
			statement.save(flush: true)
			
			ksession.retract(employee)
			ksession.setGlobal("statement",null)
		}
		log.debug("End process")

		ksession.dispose();

		log
	}

	Date parsePeriod(month,year) {
		return Date.parse("yyyyMM", year.toString() + String.format("%02d", month))
	}
}
